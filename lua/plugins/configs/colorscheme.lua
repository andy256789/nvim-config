return {
  -- Tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Load before all other plugins
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
} 