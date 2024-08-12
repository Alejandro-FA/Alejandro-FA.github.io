# Alejandro-FA.github.io

Flutter web app for my personal website.

## Building a Material Theme

This project uses the Material Design system to create a consistent and visually appealing user interface.
Follow the instructions in the [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/)
to build your own Material theme. For more information, check the
[Material Design website](https://m3.material.io/blog/material-theme-builder).

## Setting Up Git Hooks

This project includes custom Git hooks to ensure code quality and consistency.
To use these hooks, you’ll need to configure Git to use the provided hooks directory.

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

- **Pre-commit Hook:** Before you commit changes, the pre-commit hook will run tests using `flutter test`.
  If the tests fail, the commit will be aborted. It also ensures that the project builds successfully using `flutter build web --wasm`.

By setting up these hooks, you help maintain code quality and prevent potential issues from being committed to the repository.
