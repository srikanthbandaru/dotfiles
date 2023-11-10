# dotfiles

Automate your macOS developer environment setup with this convenient bash script and my collection of dotfiles. In the list of tools and applications provided, you'll notice two distinct markers:

- [A]: signifies tools that can be automatically installed using these scripts
- [M]: highlights those that I prefer to install manually

## Core Setup

- Homebrew (A)
- Command line tools (A)

## Development Environment

- [Alacritty](https://alacritty.org/) (M)
- oh-my-zsh (A)
- Starship (A)
- Neovim (A)
- VSCodium (A)

## Runtimes & Languages

- Node.js (via fnm) (A)
- Python (via pyenv) (A)

## Software

- [Appcleaner](https://freemacsoft.net/appcleaner/) (M)
- [Docker](https://www.docker.com/) (M)
- Safari
- [Google Chrome](https://www.google.com/chrome/) (M)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/) (M)
- [Google Drive](https://www.google.com/drive/download/) (M)
- [Ubersicht](https://tracesof.net/uebersicht/) [M]
- [simple-bar](https://github.com/Jean-Tinland/simple-bar) [A]

## Productivity Tools

- [Notion](https://www.notion.so/desktop) (M)
- [Todoist](https://todoist.com/downloads) (M)

## Education & Reading

- [Anki](https://apps.ankiweb.net/) (M)
- [Kindle](https://www.amazon.com/b?ie=UTF8&node=16571048011) (M)

## macOs Specific Settings

1. Open Several Desktops (~5) on Your Machine
2. Go To Keyboard Settings > Shortcuts > Mission Control
3. Expand Mission Control and Turn On Shortcuts for Switching Spaces 1-7 with “Ctrl + # Of Space”
4. Go to System Settings > Accessibility > Display
5. Turn On Reduce Motion
6. Go To System Settings > Desktop & Dock > Mission Control
7. Turn off “Automatically Rearrange Spaces Based On Most Recent Use”
   Personally, I only keep “Displays Have Separate Spaces” turned on here, and that’s what I’d recommend
8. Set home folder and projects folder to finder favorites

## Usage

To set up your environment, run:

```sh
curl -O https://raw.githubusercontent.com/srikanthbandaru/dotfiles/main/setup
bash setup
```

This script will guide you through the installation and configuration process. Follow any on-screen prompts to customize your setup.

## Customization

You can fork this repository and modify the scripts and configurations to suit your preferences. The setup is modular, allowing for easy customization and expansion.

## Contributing

Experienced users are welcome to contribute improvements or suggestions. Please feel free to create an issue or a pull request.

## License

This project is available under the MIT License.
