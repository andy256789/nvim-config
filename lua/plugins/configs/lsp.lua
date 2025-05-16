return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- Setup Mason for LSP server management
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",  -- TypeScript/JavaScript
          "lua_ls",    -- Lua
          "rust_analyzer", -- Rust
          "nil_ls",    -- Nix
          "pyright",   -- Python
          "bashls",    -- Bash
          "gopls",     -- Go
        },
        automatic_installation = true,
      })

      -- LSP Configuration
      local lspconfig = require("lspconfig")
      
      -- Key mappings for LSP functionality
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true })
        end

        nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
        nmap('gr', vim.lsp.buf.references, 'Goto References')
        nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
        nmap('gT', vim.lsp.buf.type_definition, 'Type Definition')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
      end

      -- Diagnostics signs
      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      -- Configure LSP servers
      local servers = {
        tsserver = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        rust_analyzer = {},
        nil_ls = {},
        pyright = {},
        bashls = {},
        gopls = {},
      }

      -- Setup LSP servers
      for server_name, server_config in pairs(servers) do
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = server_config.settings,
          filetypes = server_config.filetypes,
        })
      end

      -- Inlay hints
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
          end
        end,
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end,
  },

  -- Autoformat
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup()
    end,
  },
} 