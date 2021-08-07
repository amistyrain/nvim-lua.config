local map = vim.api.nvim_set_keymap
local defaults = {noremap = true, silent = true}

map('i', 'jj', '<Esc>', {noremap = true})
map('n', '<leader>c', ':nohl<CR>', defaults)

