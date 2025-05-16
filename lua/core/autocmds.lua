-- Autocommands configuration

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = highlight_group,
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.highlight.on_yank()
    end,
}) 