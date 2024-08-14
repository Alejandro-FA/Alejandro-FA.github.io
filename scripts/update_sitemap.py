#!/usr/bin/python3

import os
import subprocess
import xml.etree.ElementTree as ET
from datetime import datetime
from typing import Optional

def git_root() -> Optional[str]:
    """Return the root directory of the git repository."""
    git_root = subprocess.check_output(['git', 'rev-parse', '--show-toplevel'])
    return git_root.strip().decode('utf-8')


def git_last_modified(file_path: str) -> str:
    """Return the last modified time of a file in the git repository."""
    staged_changes = subprocess.check_output(['git', 'diff', '--name-only', '--staged', file_path])
    has_staged_changes = len(staged_changes) > 0
    if has_staged_changes:
        modified_date = os.path.getmtime(file_path)
        return datetime.fromtimestamp(modified_date).strftime('%Y-%m-%d')
    else:
        return subprocess.check_output(['git', 'log', '-1', '--format=%cs', file_path]).strip().decode('utf-8')


def url_to_filename(url: str, extension: str = '.dart') -> str:
    """Given a URL, return the corresponding filename of the flutter page."""
    page_name = url.split('/')[-1]
    page_name = page_name if page_name != '' else 'home'
    return page_name + extension


def update_last_modified(page_path: str, url_tag: ET.Element) -> None:
    """Update the <lastmod> tag corresponding to the given page."""
    lastmod_tag = url_tag.find('ns:lastmod', namespaces)
    if lastmod_tag is None:
        lastmod_tag = ET.SubElement(url_tag, 'lastmod')
    lastmod_tag.text = git_last_modified(page_path)


if __name__ == '__main__':
    # Set your directory and sitemap file paths
    app_root = f'{git_root()}/app'
    pages_directory = f'{app_root}/lib/pages'
    sitemap_file = f'{app_root}/web/sitemap.xml'

    # Load the sitemap.xml file
    tree = ET.parse(sitemap_file)
    root = tree.getroot()

    # Define the namespaces (if any) used in your sitemap.xml
    namespaces = {'ns': 'http://www.sitemaps.org/schemas/sitemap/0.9'}

    # Iterate over the URLs in the sitemap
    for url in root.findall('ns:url', namespaces):
        loc = url.find('ns:loc', namespaces).text
        file_name = url_to_filename(loc)

        # Check if the corresponding HTML file exists
        file_path = os.path.join(pages_directory, file_name)
        if os.path.exists(file_path):
            update_last_modified(file_path, url)
        else:
            print(f'File not found: {file_name}')

    # Save the updated sitemap.xml file
    tree.write(sitemap_file, xml_declaration=True, encoding='UTF-8', default_namespace=namespaces['ns'])
    print(f'{sitemap_file} updated successfully.')
