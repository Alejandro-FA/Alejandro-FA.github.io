#!/usr/bin/env -S npx tsx

// This script is used to automatically generate hashes to achieve a strict CSP.
// For more information about strict CSPs, see https://web.dev/articles/strict-csp
// For more information about CSP hashes, see
// https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
//
// We need to compute the hash of flutter_bootstrap.js at built time because
// different build environments and/or configurations can produce different
// outputs.

import * as fs from "node:fs";
import * as crypto from "node:crypto";
import * as util from "node:util";
import * as cheerio from "cheerio";
import * as path from "node:path";

class ProgramOptions {
  private constructor(
    public scripts: string[],
    public algorithm: string,
    public htmlPath: string,
    public headersPath: string,
  ) {}

  public static parse(): ProgramOptions {
    try {
      const { values, positionals } = ProgramOptions.parseArgs();
      if (values.help) {
        ProgramOptions.printHelp();
        process.exit(0);
      }
      if (positionals.length > 1) {
        throw new Error("Too many arguments.");
      }

      return new ProgramOptions(
        positionals.map((file) => ProgramOptions.parseFile(file)),
        values.algorithm,
        ProgramOptions.parseFile(values.html),
        ProgramOptions.parseFile(values.headers),
      );
    } catch (error: unknown) {
      if (!(error instanceof Error)) throw error;
      console.error(error.message);
      const program = path.basename(process.argv[1] ?? import.meta.url);
      console.log(`Try '${program} --help' for more information.`);
      process.exit(1);
    }
  }

  private static parseArgs() {
    return util.parseArgs({
      options: {
        algorithm: { type: "string", short: "a", default: "sha512" },
        help: { type: "boolean", short: "h", default: false },
        html: { type: "string", default: "index.html" },
        headers: { type: "string", default: "_headers" },
      },
      allowPositionals: true,
    });
  }

  private static parseFile(file: string): string {
    if (!fs.existsSync(file)) {
      throw new Error(`File not found: ${file}`);
    } else if (!fs.statSync(file).isFile()) {
      throw new Error(`${file} is not a file.`);
    }
    return file;
  }

  private static printHelp(): void {
    const helpMessage = `
Usage: generate_csp_hashes.ts [OPTIONS] SCRIPT...
Generate a hash of SCRIPT, and add it to the Content Security Policy of the headers file
and to the HTML file that includes SCRIPT.

Arguments:
  SCRIPT                       The script file to hash and include in the CSP

Options:
  -a, --algorithm <algorithm>  The hash algorithm to use (default: sha512)
  -h, --help                   Show this help message and exit
      --html <file>            The HTML file that includes the script (default: index.html)
      --headers <file>         The HTTP headers file with the CSP policy header (default: _headers)
  `.trim();
    console.log(helpMessage);
  }
}

/**
 * Computes the hash of a given file using the specified algorithm.
 *
 * @param {string} filePath - The path to the file to hash.
 * @param {string} algorithm - The hash algorithm to use (e.g., 'sha256', 'sha384', 'sha512').
 * @returns {string} The computed hash in base64 format.
 */
function computeFileHash(filePath: string, algorithm: string): string {
  const fileContent = fs.readFileSync(filePath);
  try {
    return `${algorithm}-${crypto.hash(algorithm, fileContent, "base64")}`;
  } catch (error: unknown) {
    if (!(error instanceof Error)) throw error;
    console.error(`Error computing hash for ${filePath}: ${error.message}`);
    process.exit(1);
  }
}

function writeHashToHtml(
  hash: string,
  htmlPath: string,
  scriptPath: string,
): void {
  const buffer = fs.readFileSync(htmlPath);
  const $ = cheerio.loadBuffer(buffer);
  const scriptSrc = path.relative(path.dirname(htmlPath), scriptPath);
  const scriptTag = $(`script[src="${scriptSrc}"]`);

  if (scriptTag.length === 0) {
    console.error(`Script tag not found: ${scriptSrc}`);
    process.exit(1);
  }

  scriptTag.attr("integrity", hash);
  scriptTag.attr("crossorigin", "anonymous");
  fs.writeFileSync(htmlPath, $.html());
}

function writeHashToHeaders(hash: string, headersPath: string): void {
  const headers = fs.readFileSync(headersPath, "utf8");
  const scriptHashesRegex =
    /(?<=script-src)((?: '\S+'?)*)(?= 'strict-dynamic')/i;

  // Find the CSP script-src hashes in the headers file
  const scriptHashes = scriptHashesRegex.exec(headers);
  if (scriptHashes === null) {
    console.error(
      "Content-Security-Policy with script-src directive not found.",
    );
    process.exit(1);
  }

  // Add the new hash to the list of hashes
  hash = `'${hash}'`;
  const hashesList = scriptHashes[0].split(" ");
  if (!hashesList.includes(hash)) hashesList.push(hash);
  const newHeaders = headers.replace(scriptHashesRegex, hashesList.join(" "));

  // Write the updated headers file
  fs.writeFileSync(headersPath, newHeaders);
}

function main(): void {
  const options = ProgramOptions.parse();

  for (const script of options.scripts) {
    const hash = computeFileHash(script, options.algorithm);
    writeHashToHtml(hash, options.htmlPath, script);
    writeHashToHeaders(hash, options.headersPath);
  }
}

main();
