# Development Environment Setup

## Development tools (pre-requisites)

- [Node.js](https://nodejs.org/en/download/package-manager) with `npm` (latest LTS version recommended).

- [Flutter](https://flutter.dev/docs/get-started/install) (latest stable version recommended).

## First-time setup

1. **Clone the repository**

   If you haven’t already, clone the repository to your local machine:

   ```bash
   git clone https://github.com/Alejandro-FA/Alejandro-FA.github.io.git
   cd Alejandro-FA.github.io
   ```

2. **Install the project dependencies**

    ```bash
    npm run setup:dev
    ```

## Setting Up Git Hooks

This project includes custom Git hooks to ensure code quality and consistency. To use these hooks, you’ll need to configure Git to use the provided hooks directory.

### Steps to configure git hooks

1. **Configure `git` to use the custom hooks directory**

   ```bash
   git config core.hooksPath .githooks
   ```

2. **Verify the configuration**

   To ensure that the configuration is set up correctly, you can check your `git` settings:

   ```bash
   git config --get core.hooksPath
   ```

   This should output `.githooks`, confirming that Git is using the correct directory.

### What do the hooks do?

The hooks in this project are designed to run automated checks before certain `git` operations. For example:

- **Pre-commit hook:** Before you commit changes, the pre-commit hook will run a static code analysis with `npm run lint`. It will also run tests using `npm run test`. If either the static analysis or the tests fail, the commit will be aborted.

- **Pre-push hook:** Before pushing changes to production, it ensures that the project builds successfully using `npm run build`.

By setting up these hooks, you help maintain code quality and prevent potential issues from being published to production.

## Changing the `flutter` debug browser (optional)

By default, Flutter web apps will try to run in Google Chrome (check the [Getting Started](https://docs.flutter.dev/get-started/install) guide for more information on how to configure flutter for web development). If you prefer to use another Chromium-based browser instead of Chrome (e.g. Edge, Opera, Brave...), add the following lines to your `.bash_profile` file (if you use `bash`) or your `.zshenv` file (if you use `zsh`):

```bash
export CHROME_EXECUTABLE="path/to/broswer/executable"
export CHROME_PATH="${CHROME_EXECUTABLE}" # This is for Lighthouse
```

For example, to use [Brave Browser](https://brave.com/) in macOS:

```bash
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export CHROME_PATH="${CHROME_EXECUTABLE}"
```
