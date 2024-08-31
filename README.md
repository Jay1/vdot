# 🌌 vdot - A Customized Neovim Configuration

Feature-rich Neovim configuration designed for efficient coding and productivity. 
It leverages modern plugins and configurations to enhance your development experience.


## 🚀 Features

- **🧠 LSP Integration**: Intelligent code completion and navigation.
- **🔍 Fuzzy Finding**: Quickly search files and content with [Telescope](https://github.com/nvim-telescope/telescope.nvim).
- **🐙 Git Integration**: Seamless interaction with Git repositories.
- **⌨️ Custom Keybindings**: Tailored keybindings for an improved workflow.
- **🎨 Beautiful UI**: Aesthetic and customizable interface with the [Catppuccin](https://github.com/catppuccin/nvim) theme.

## 📋 Prerequisites

- **Neovim** >= 0.8.0
- **ripgrep**: For searching files.
- **fd**: A simple, fast, and user-friendly alternative to `find`.

## 📥 Installation

1. **Backup your existing Neovim configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak

Clone this repository:
bash
git clone https://github.com/jay1/vdot.git ~/.config/nvim

Install required dependencies:
Ensure you have ripgrep and fd installed. You can install them using your package manager, e.g.:
bash
sudo apt install ripgrep fd

Open Neovim and let the update go thru. 

This will install all the necessary plugins.
Check health:
text
:checkhealth

Make sure everything is set up correctly.

## ⌨️ Key Bindings
<leader>f: Open Telescope to find files.
<leader>r: Open recent files.
<leader>g: Git commands.
<leader>e: Edit the current configuration.

## 📦 Plugins
vdot includes the following plugins:
nvim-treesitter: Enhanced syntax highlighting.
nvim-lspconfig: Easy LSP configuration.
telescope.nvim: Fuzzy finder.
nvim-web-devicons: File icons.
catppuccin: Beautiful color scheme.

## 🛠️ Customization
Feel free to customize the configuration to suit your needs. You can modify keybindings, themes, and plugins in the init.lua and lua/plugins/ files.

## 🐞 Troubleshooting
If you encounter any issues, try the following:
Run :checkhealth to identify any missing dependencies.
Check the Neovim logs for any errors.

## 🤝 Contributing
Contributions are welcome! If you have suggestions or improvements, please feel free to submit a Pull Request.

## 📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

## 🙏 Acknowledgements
Thanks to the Neovim community for their amazing plugins and support.
Inspired by various Neovim configurations available online.
Feel free to reach out if you have any questions or need assistance!
