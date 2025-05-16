return {
  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Enable syntax highlighting
        highlight = {
          enable = true,
        },
        
        -- Enable indentation
        indent = {
          enable = true,
        },
        
        -- Ensure these parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "nix",
          "python",
          "regex",
          "rust",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        
        -- Auto install missing parsers when entering buffer
        auto_install = true,
        
        -- Additional modules
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
      })
    end,
  },
} 