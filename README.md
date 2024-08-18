# Alejandro-FA.github.io

Flutter web app for my personal website.

## Setting Up Git Hooks

This project includes custom Git hooks to ensure code quality and consistency. To use these hooks, you’ll need to configure Git to use the provided hooks directory.

### Steps to configure git hooks

1. **Clone the Repository**

   If you haven’t already, clone the repository to your local machine:

   ```bash
   git clone git@github.com:Alejandro-FA/Alejandro-FA.github.io.git
   cd Alejandro-FA.github.io
   ```

2. **Configure Git to Use the Custom Hooks Directory**

   Run the following command to tell Git to use the custom hooks directory included in this repository:

   ```bash
   git config core.hooksPath .githooks
   ```

   This command sets up Git to look for hooks in the `.githooks` directory in the root of the repository.

3. **Verify the Configuration**

   To ensure that the configuration is set up correctly, you can check your Git settings:

   ```bash
   git config --get core.hooksPath
   ```

   This should output `.githooks`, confirming that Git is using the correct directory.

### What do the hooks do?

The hooks in this project are designed to run automated checks before certain Git operations. For example:

- **Pre-commit hook:** Before you commit changes, the pre-commit hook will run a static code analysis with `flutter analyze`. It will also run tests using `flutter test`. If either the static analysis or the tests fail, the commit will be aborted.

- **Pre-push hook:** Before pushing changes to production, it ensures that the project builds successfully using `flutter build web --wasm --no-web-resources-cdn --release`.

By setting up these hooks, you help maintain code quality and prevent potential issues from being published to production.

## How to use other browsers instead of Google Chrome

By default, Flutter web apps will try to run in Google Chrome (check the [Getting Started](https://docs.flutter.dev/get-started/install) guide for more information on how to configure flutter for web development). Furthermore, this project uses [Lighthouse](https://developers.google.com/web/tools/lighthouse) to evaluate the performance of the website (see the [Performance evaluation](##Performance evaluation) section for more information).

If you prefer to use another Chromium-based browser instead of Chrome (e.g. Edge, Opera, Brave...), add the following line to your `.bash_profile` file (if you use bash) or your `.zprofile` file (if you use zsh):

```bash
export CHROME_EXECUTABLE="path/to/broswer/executable"
export CHROME_PATH="${CHROME_EXECUTABLE}"
```

For example, to use [Brave Browser](https://brave.com/) in macOS:

```bash
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export CHROME_PATH="${CHROME_EXECUTABLE}"
```

## Performance evaluation

The performance of a website is crucial for user experience. To evaluate the performance of this website, we use the [Lighthouse](https://developers.google.com/web/tools/lighthouse) tool. It has audits for performance, accessibility, progressive web apps, SEO, and more.

To evaluate the performance of this website, follow these steps:

1. **Install Node.js (and npm)**

    To use Lighthouse, you need to have Node.js installed on your machine. You can download it from the [official website](https://nodejs.org/), or use a package manager (**recommended**) like [nvm](https://github.com/nvm-sh/nvm) or [Volta](https://volta.sh/).

    This project specifies the version of Node.js to use in the `.nvmrc` file. If you use nvm, you can install this version by running the following command:

    ```bash
    nvm install
    ```

2. **Install Lighthouse**

    To install Lighthouse, install the dependencies specified in the `package.json` and `package-lock.json` files:

    ```bash
    npm ci
    ```

3. **Run Lighthouse**

    To evaluate the performance of the website and generate a report with the results, run the following command:

    ```bash
    npx lighthouse https://alejandrofernandez.pages.dev/ --output html
    ```

## Building a Material Theme

This project uses the Material Design system to create a consistent and visually appealing user interface. Follow the instructions in the [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/) to build your own Material theme. For more information, check the [Material Design website](https://m3.material.io/blog/material-theme-builder).

## Using personalized fonts

Fonts are a great way to give a personalized look and feel to a webpage. [Google Fonts](https://fonts.google.com/) offers a wide variety of free fonts that can be easily integrated into webpages.

There are two ways to use Google Fonts in a webpage. The first is to download the font files and host them on your server. The second is to use the Google Fonts API to load the fonts from Google's servers dynamically (see the [google_fonts](https://pub.dev/packages/google_fonts) flutter package for more information about this). The first method is recommended for privacy and performance reasons (especially if the webpage is served in a CDN).

### How to download Google Fonts and host them on your server

1. **Select the Fonts**. Explore the [Google Fonts website](https://fonts.google.com/) and decide which fonts (and which styles) you want to use.

2. **Download the fonts in woff2 format**. Use the [`Get embed code` option](https://fonts.google.com/selection/embed) to get a download link of the desired styles of the fonts in `.woff2` format, which is web-optimized for performance. To download only a subset of the characters (and have smaller file sizes), check the [Google Fonts API](https://developers.google.com/fonts/docs/getting_started). For example, to download the Silkscreen font in `.woff2` format and only the glyphs required for the text "Loading portfolio...", send a request to [https://fonts.googleapis.com/css2?family=Silkscreen&text=Loading%20portfolio...](https://fonts.googleapis.com/css2?family=Silkscreen&text=Loading%20portfolio...). The link used to download the fonts of this project is [https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Silkscreen:wght@400;700&subset=latin](https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Silkscreen:wght@400;700&subset=latin).

3. **Convert the fonts to woff format**. As of August 2024, the current stable version of Flutter does not support `.woff2` fonts. Therefore, the recommended option is to use the old web-optimized format: `.woff`. It should be noted that `.woff` is only supported on mobile and web platforms (but not on desktop). To convert the files we need to follow these steps:

    1. Install the [woff2 tool](https://github.com/google/woff2) developed by Google (`woff2_decompress path/to/font.woff2`).
    2. Use `woff2_decompress path/to/font.woff2` to decompress the `.woff2` files to `.ttf`.
    3. Use an online tool like [FontSquirrel WebFont Generator](https://www.fontsquirrel.com/tools/webfont-generator) to convert the `.ttf` files to `.woff` (use the `Basic` preset).
    4. Download the converted files.

    > **Note**: FontSquirrel does not support variable fonts. To use variable fonts with Flutter web, you need to stick with `.ttf` files.


### A note about Roboto font in Flutter

The Roboto font is the default font used in Flutter. As of August 2024, it is not possible to prevent Flutter from trying to load the Roboto font. Currently, the best solution is to download the Roboto font and host it on your server.

For more information, check the following GitHub issues:

- [Allow dynamic loading of font assets from pubspec.yaml](https://github.com/flutter/flutter/issues/122282)

- [Proposal to Stop downloading google font roboto when the app uses global custom font](https://github.com/flutter/flutter/issues/136118)
