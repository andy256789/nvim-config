-- Main Neovim configuration file
-- Derived from original Nix configuration

-- Load core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugins
require('plugins') 