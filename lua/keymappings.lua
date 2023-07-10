local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local defaults = { noremap = true, silent = true }

map("n", "<Esc>", ":nohl<CR>", defaults)
map("n", "<leader><leader>", ":bufdo e!<CR>", defaults)

-- map("n", "<M-s>", ":w <CR>", defaults)
-- map("n", "<M-c>", ":%y+<CR>", defaults)
