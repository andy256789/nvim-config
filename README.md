# Neovim Configuration

This is a Lua-based Neovim configuration converted from a Nix configuration. It provides a modern development environment with LSP support, syntax highlighting, file explorer, and more.

## Requirements

-   Neovim 0.9.0+
-   Git (for plugin installation)
-   A terminal with true color support
-   A [Nerd Font](https://www.nerdfonts.com/) (for icons)

## Installation

1. Back up your current Neovim configuration (if any):

    ```sh
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2. Clone this configuration:

    ```sh
    git clone https://github.com/andy256789/nvim-config.git ~/.config/nvim
    ```

3. Start Neovim:
    ```sh
    nvim
    ```

On the first run, the configuration will:

-   Automatically install [lazy.nvim](https://github.com/folke/lazy.nvim) (plugin manager)
-   Install all configured plugins

## Features

-   Modern UI with Tokyo Night theme and transparency support
-   File explorer (nvim-tree)
-   Fuzzy finding (Telescope)
-   LSP support with autocompletion
-   Syntax highlighting (Treesitter)
-   Git integration
-   Keymaps for efficient navigation and editing
-   Statusline with useful information (lualine)

## File Structure

```
nvim-config/
├── init.lua               # Main entry point
├── lua/
│   ├── core/
│   │   ├── autocmds.lua   # Autocommands
│   │   ├── keymaps.lua    # Key mappings
│   │   └── options.lua    # Neovim options
│   └── plugins/
│       ├── init.lua       # Plugin setup
│       └── configs/       # Individual plugin configs
└── README.md              # This file
```

## Keymaps

The configuration includes many useful keymaps. Here are some highlights:

-   `<Space>` - Leader key
-   `<leader>e` - Toggle file explorer
-   `<leader>ff` - Find files
-   `<leader>fg` - Live grep
-   `<leader>fb` - Browse buffers
-   `<leader>f` - Format code
-   `<leader>sv` - Split window vertically
-   `<leader>sh` - Split window horizontally

For LSP:

-   `gd` - Go to definition
-   `gr` - Find references
-   `gD` - Go to declaration
-   `K` - Show documentation

## Customization

You can customize the configuration by editing the files in `lua/core/` and `lua/plugins/configs/`. The modular structure makes it easy to add, remove, or modify features.
