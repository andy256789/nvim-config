-- Keymaps configuration
local keymap = vim.keymap.set

-- Toggle file explorer
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { silent = true, desc = "toggle file explorer" })

-- Moving text in visual mode
keymap('v', 'J', ':m \'>+1<CR>gv=gv', { desc = "moves lines down in visual selection" })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { desc = "moves lines up in visual selection" })

-- Join lines keeping cursor position
keymap('n', 'J', 'mzJ`z')

-- Centered scrolling
keymap('n', '<C-d>', '<C-d>zz', { desc = "move down in buffer with cursor centered" })
keymap('n', '<C-u>', '<C-u>zz', { desc = "move up in buffer with cursor centered" })

-- Keep search terms centered
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- Keep indentation in visual mode
keymap('v', '<', '<gv', { silent = true })
keymap('v', '>', '>gv', { silent = true })

-- Better paste
keymap('x', '<leader>p', '"_dP')
keymap('v', 'p', '"_dp', { silent = true })

-- Clipboard operations
keymap('n', '<leader>Y', '"+Y', { silent = true })
keymap('n', '<leader>d', '"_d', { silent = true })
keymap('v', '<leader>d', '"_d', { silent = true })

-- Escape with Ctrl-C
keymap('i', '<C-c>', '<Esc>')
keymap('n', '<C-c>', ':nohl<CR>', { desc = "Clear search hl", silent = true })

-- Format with LSP
keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>')

-- Disable Q in normal mode
keymap('n', 'Q', '<nop>')

-- Tmux sessionizer
keymap('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Delete without yanking
keymap('n', 'x', '"_x', { silent = true })

-- Global search and replace
keymap('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = "Replace word cursor is on globally" })

-- Make file executable
keymap('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = "makes file executable" })

-- Tab management
keymap('n', '<leader>to', '<cmd>tabnew<CR>', { desc = "Open new tab" })
keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close current tab" })
keymap('n', '<leader>tn', '<cmd>tabn<CR>', { desc = "Go to next tab" })
keymap('n', '<leader>tp', '<cmd>tabp<CR>', { desc = "Go to previous tab" })
keymap('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })

-- Split window management
keymap('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" })
keymap('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontally" })
keymap('n', '<leader>se', '<C-w>=', { desc = "Make splits equal size" })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = "Close current split" })

-- Copy filepath to clipboard
keymap('n', '<leader>fp', ':let @+ = expand("%:~")<CR>:echo "File path copied to clipboard: " . expand("%:~")<CR>', { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics
keymap('n', '<leader>lx', '<cmd>lua vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text, underline = not vim.diagnostic.config().underline})<CR>', { desc = "Toggle LSP diagnostics" })

-- LSP keymaps
-- These will be set up in the LSP plugin configuration 