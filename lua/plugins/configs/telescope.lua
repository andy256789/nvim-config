return {
  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Optional: Improved sorting performance
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      
      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
            "^__pycache__/",
          },
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      })
      
      -- Load FZF native extension if available
      pcall(telescope.load_extension, "fzf")
      
      -- Key mappings for Telescope
      local keymap = vim.keymap.set
      keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
    end,
  },
} 