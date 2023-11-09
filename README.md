# dotfiles

Automate your macOS developer environment setup with this convenient bash script and my collection of dotfiles. In the list of tools and applications provided, you'll notice two distinct markers:

- [A]: signifies tools that can be automatically installed using these scripts
- [M]: highlights those that I prefer to install manually

## Core Setup

- Package Manager: Homebrew (A)
- Automation: ansible (A)
- System: command line tools (A)

## Development Environment

- Terminal: [Alacritty](https://alacritty.org/) (M)
- Shell Enhancements: oh-my-zsh (A)
- Shell Prompt: Starship (A)
- Editor
  - Neovim (A)
  - VSCodium (A)
- Search Tool: ripgrep (A)

## Runtimes & Languages

- JavaScript: Node.js (via fnm) (A)
- Python: Python (via pyenv) (A)

## Software

- Cleaner: [Appcleaner](https://freemacsoft.net/appcleaner/) (M)
- Containerization: [Docker](https://www.docker.com/) (M)
- Web Browsers:
  - Safari
  - [Google Chrome](https://www.google.com/chrome/) (M)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/) (M)
- Cloud Storage: [Google Drive](https://www.google.com/drive/download/) (M)
- Customization
  - [Ubersicht](https://tracesof.net/uebersicht/) [M]
  - [simple-bar](https://github.com/Jean-Tinland/simple-bar) [A]

## Productivity Tools

- Note-taking: [Notion](https://www.notion.so/desktop) (M)
- Task Management: [Todoist](https://todoist.com/downloads) (M)

## Education & Reading

- Flashcards: [Anki](https://apps.ankiweb.net/) (M)
- e-Reader: [Kindle](https://www.amazon.com/b?ie=UTF8&node=16571048011) (M)

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
