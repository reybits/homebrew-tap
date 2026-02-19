# Homebrew Tap for My Utilities

This repository provides a Homebrew tap with custom CLI tools and utilities developed by me. With this tap, you can easily install and update these tools using Homebrew.

## Installation

First, add the tap:

```sh
brew tap reybits/homebrew-tap
```

Then, install a specific tool:

```sh
brew install reybits/homebrew-tap/<toolname>
```

## Available Tools

- `simple-viewer-gl` – Simple and tiny image viewer based on OpenGL.
- `texture-packer` – CLI tool that packs multiple images into optimized texture atlases.

## Updating

To update the tap and installed tools, run:

```sh
brew update && brew upgrade
```

## Uninstallation

To remove a tool:

```sh
brew uninstall reybits/homebrew-tap/<toolname>
```

To remove the tap:

```sh
brew untap reybits/homebrew-tap
```

## Contributing

Feel free to open an issue or a pull request if you have suggestions or improvements.

## License

All tools and scripts in this repository are licensed under MIT License.

