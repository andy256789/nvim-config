return {
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        -- Git integration
        git = {
          enable = true,
          ignore = false,
        },
        
        -- UI config
        view = {
          width = 30,
          side = "left",
          number = false,
          relativenumber = false,
        },
        
        -- File filtering
        filters = {
          dotfiles = false,
          custom = {
            "^\\.git$",
            "node_modules",
            "^\\.cache$",
          },
        },
        
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end,
  },
  
  -- Web Devicons (used by nvim-tree and other plugins)
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },
} 