#!/usr/bin/python3
import os
import subprocess
import re
from bs4 import BeautifulSoup
from typing import Optional


def git_root() -> Optional[str]:
    """Return the root directory of the git repository."""
    git_root = subprocess.check_output(['git', 'rev-parse', '--show-toplevel'])
    return git_root.strip().decode('utf-8')


def reset_csp_hashes(headers_file: str) -> None:
    """Remove all hashes from the 'script-src' element of the CSP header."""
    with open(headers_file, 'r') as file:
        lines = file.readlines()

    with open(headers_file, 'w') as file:
        for line in lines:
            if  line.strip().startswith('Content-Security-Policy:'):
                # Base64 characters: https://en.wikipedia.org/wiki/Base64#Base64_table_from_RFC_4648
                line = re.sub(r" 'sha\d{3}-[0-9a-zA-Z+/=]+'", '', line)
            file.write(line)


def compute_file_hash(file: str, algorithm: str = 'sha512') -> str:
    """Compute the hash of the content of a file."""
    hash_command = f"cat {file} | openssl dgst -{algorithm} -binary | openssl base64 -A"
    hash_value = subprocess.check_output(hash_command, shell=True).strip().decode('utf-8')
    return f"{algorithm}-{hash_value}"  # prepend algorithm as required for CSP


def add_script_integrity(index_html_file: str, script_file: str, file_hash: str) -> None:
    """Update the integrity attribute of the script tag corresponding to {script_file}
    in the index.html file. It also adds crossorigin="anonymous" to the script tag, in
    case the script is loaded from a different origin (otherwise, the hash will be ignored)."""

    # Read the HTML file
    with open(index_html_file, 'r') as file:
        soup = BeautifulSoup(file, 'html.parser')

    script_file_name = os.path.basename(script_file)

    # Find the script tag with the matching src attribute
    script_tag = soup.find('script', src=script_file_name)

    if script_tag:
        # Update or add the integrity attribute
        script_tag['integrity'] = file_hash

        # Add crossorigin="anonymous" if it's not already present
        if 'crossorigin' not in script_tag.attrs:
            script_tag['crossorigin'] = 'anonymous'

    # Write the modified HTML back to the file
    with open(index_html_file, 'w') as file:
        file.write(str(soup.prettify()))


# https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity#tools_for_generating_sri_hashes
def add_hash_to_headers(headers_file: str, file_hash: str) -> None:
    """Append the hash to the 'script-src' element of the CSP header in the
    {headers_file} file."""
    with open(headers_file, 'r') as file:
        lines = file.readlines()

    with open(headers_file, 'w') as file:
        for line in lines:
            if "Content-Security-Policy:" in line.strip():
                parts = line.split()
                # Find 'script-src' and add the hash right after it
                for i, part in enumerate(parts):
                    if part == "script-src":
                        parts.insert(i + 1, f"'{file_hash}'")
                        break
                # Preserve original indentation by reconstructing the line
                leading_whitespace = line[:len(line) - len(line.lstrip())]
                line = leading_whitespace + ' '.join(parts) + '\n'
            file.write(line)


def character_limit_exceeded(headers_file: str, max_characters: int) -> bool:
    """Check if the Content-Security-Policy line exceeds the max_characters limit."""
    with open(headers_file, 'r') as file:
        lines = file.readlines()
    for line in lines:
        if 'Content-Security-Policy:' in line.strip():
            if len(line) > max_characters:
                return True
    return False


if __name__ == '__main__':
    # Set your directory base paths
    app_root = f'{git_root()}/app'
    build_directory = f'{app_root}/build/web'
    index_html_file = f'{build_directory}/index.html'
    headers_file = f'{build_directory}/_headers'

    # Set the paths of the files from which we want to update the hash
    bootstrap_file = f'{build_directory}/flutter_bootstrap.js'
    files = [bootstrap_file]

    # Update the hash of the files
    print(f'Updating the hash of scripts in {build_directory}...')
    reset_csp_hashes(headers_file)
    for file in files:
        if not os.path.exists(file):
            print(f'{file} not found. Exiting...')
            exit(1)
        else:
            # Compute the hash of the bootstrap.js file
            file_hash = compute_file_hash(file, algorithm='sha512')

            # Update the integrity attribute in the index.html file
            add_script_integrity(index_html_file, file, file_hash)

            # Update the hash allowlisting in the _headers file
            add_hash_to_headers(headers_file, file_hash)

            # Print success message
            print(f'Hash of {file} updated successfully.')

    # Check if the CSP header exceeds the character limit
    max_characters = 2000
    if character_limit_exceeded(headers_file, max_characters):
        print(f'The Content-Security-Policy header exceeds the {max_characters} characters limit.')
        print('Please update the CSP header manually.')
        exit(1)
