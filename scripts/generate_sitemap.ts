#!/usr/bin/env -S npx tsx

import * as fs from "node:fs";
import * as path from "node:path";
import { parseArgs } from "node:util";
import { config } from "../package.json" assert { type: "json" };
import { XMLBuilder, XMLParser } from "fast-xml-parser";

interface UrlTag {
  loc: string;
  lastmod: string;
  changefreq: string;
  priority: string;
}

interface SitemapXML {
  "?xml": { $version: string; $encoding: string };
  urlset: {
    $xmlns: string;
    url: UrlTag[];
  };
}

class ProgramOptions {
  static validFreqs = [
    "always",
    "hourly",
    "daily",
    "weekly",
    "monthly",
    "yearly",
    "never",
  ];

  private constructor(
    public pageFiles: string[],
    public output: string,
    public changeFreq: string,
    public priority: string,
    public update: boolean,
    public help: boolean,
    public baseUrl: string,
  ) {}

  /**
   * Parses command-line arguments and returns the program options.
   *
   * @returns {ProgramOptions} The program options.
   */
  public static parse(): ProgramOptions {
    const { values, positionals } = parseArgs({
      options: {
        output: { type: "string", short: "o", default: "sitemap.xml" },
        changeFreq: { type: "string", short: "f", default: "monthly" },
        priority: { type: "string", short: "p", default: "0.5" },
        update: { type: "boolean", short: "u", default: false },
        help: { type: "boolean", short: "h", default: false },
        baseUrl: { type: "string", default: config.url },
      },
      allowPositionals: true,
    });

    if (values.help) {
      ProgramOptions.printHelp();
      process.exit(0);
    }

    return new ProgramOptions(
      ProgramOptions.parseFiles(positionals),
      values.output,
      ProgramOptions.parseFreq(values.changeFreq),
      ProgramOptions.parsePriority(values.priority),
      values.update,
      values.help,
      values.baseUrl,
    );
  }

  private static parseFiles(files: string[]): string[] {
    if (files.length === 0) throw new Error("No pages specified.");

    for (const file of files) {
      if (!fs.existsSync(file)) {
        throw new Error(`File not found: ${file}`);
      }
    }
    return files;
  }

  private static parseFreq(freq: string): string {
    if (!ProgramOptions.validFreqs.includes(freq)) {
      throw new Error(`Invalid change frequency: ${freq}`);
    }
    return freq;
  }

  private static parsePriority(priority: string): string {
    try {
      const parsedPriority = parseFloat(priority);
      if (parsedPriority < 0 || parsedPriority > 1) {
        throw new Error(`Priority must be between 0 and 1.`);
      }
      return parsedPriority.toFixed(1);
    } catch {
      throw new Error("Priority must be a number.");
    }
  }

  /**
   * Prints the help message for the program.
   */
  private static printHelp(): void {
    const helpMessage = `
Automatically generate a sitemap with the specified pages.

Usage: generate_sitemap.ts [options] page...

Arguments:
  page                      Source code file of a page to include in the sitemap

Options:
  -o, --output <file>       Specify the output path for the sitemap (default: sitemap.xml)
  -f, --changeFreq <freq>   Set the change frequency of all URLs (default: 'monthly')
  -p, --priority <num>      Set the priority of all URLs (default: 0.5)
  -u, --update              Update an existing sitemap instead of overwriting it (default: false)
  -h, --help                Show this help message and exit
  --baseUrl <url>           Set the base URL for the sitemap (default: config.url from package.json)
  `.trim();
    console.log(helpMessage);
  }
}

/**
 * Gets the last modified date of a file in ISO format.
 *
 * @param {string} filePath - The path to the file.
 * @returns {string} The last modified date in ISO format.
 */
function lastModifiedDate(filePath: string): string {
  const date = fs.statSync(filePath).mtime.toISOString().split("T").at(0);
  if (date === undefined) throw new Error("Invalid date!");
  return date;
}

/**
 * Generates the URL for a page based on the base URL and page file name.
 *
 * @param {string} baseUrl - The base URL for the sitemap.
 * @param {string} pageFile - The page file path.
 * @returns {string} The generated URL for the page.
 */
function pageUrl(baseUrl: string, pageFile: string): string {
  if (!baseUrl.endsWith("/")) baseUrl += "/";
  const pageName = path.basename(pageFile, path.extname(pageFile));
  if (pageName === "home") return baseUrl;
  else return `${baseUrl}${pageName}/`;
}

/**
 * Create a sitemap URL entry for a page.
 *
 * @param {ProgramOptions} options - The program options.
 * @param {string} pageFile - The page file path.
 * @returns {UrlTag} The URL tag for the sitemap.
 */
function createUrlTag(options: ProgramOptions, pageFile: string): UrlTag {
  return {
    loc: pageUrl(options.baseUrl, pageFile),
    lastmod: lastModifiedDate(pageFile),
    changefreq: options.changeFreq,
    priority: options.priority,
  };
}

/**
 * Write the sitemap XML to a file.
 *
 * @param {SitemapXML} sitemap - The sitemap object to write.
 * @param {string} outputPath - The output path for the sitemap file.
 */
function writeSitemap(sitemap: SitemapXML, outputPath: string): void {
  const builder = new XMLBuilder({
    attributeNamePrefix: "$",
    ignoreAttributes: false,
    format: true,
  });
  const xmlContent = builder.build(sitemap) as string;
  fs.writeFileSync(outputPath, xmlContent);
}

/**
 * Read a sitemap XML file and return the parsed object.
 *
 * @param {string} filePath - The path to the sitemap file.
 * @returns {SitemapXML} The parsed sitemap object.
 */
function readSitemap(filePath: string): SitemapXML {
  const parser = new XMLParser({
    ignoreAttributes: false,
    attributeNamePrefix: "$",
  });
  const sitemapContent = fs.readFileSync(filePath, "utf-8");
  return parser.parse(sitemapContent) as SitemapXML;
}

/**
 * Update an existing sitemap with new URL entries or different information.
 *
 * @param {ProgramOptions} options - The program options.
 */
function updateSitemap(options: ProgramOptions): void {
  const sitemapXML = readSitemap(options.output);
  const newUrlTags = options.pageFiles.map((pageFile) =>
    createUrlTag(options, pageFile),
  );

  // Add old URLs that have not been updated
  sitemapXML.urlset.url = newUrlTags.concat(
    sitemapXML.urlset.url.filter((oldTag) => {
      return newUrlTags.every((newTag) => newTag.loc !== oldTag.loc);
    }),
  );
  writeSitemap(sitemapXML, options.output);
}

/**
 * Generate a new sitemap.
 *
 * @param {ProgramOptions} options - The program options.
 */
function generateSitemap(options: ProgramOptions): void {
  const sitemap: SitemapXML = {
    "?xml": {
      $version: "1.0",
      $encoding: "UTF-8",
    },
    urlset: {
      $xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
      url: options.pageFiles.map((file) => createUrlTag(options, file)),
    },
  };
  writeSitemap(sitemap, options.output);
}

function main(): void {
  const options = ProgramOptions.parse();
  if (!options.update || !fs.existsSync(options.output))
    generateSitemap(options);
  else updateSitemap(options);
}

main();
