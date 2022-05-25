local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local defaults = { noremap = true, silent = true }

map("i", "jj", "<Esc>", { noremap = true })
map("n", "<Esc>", ":nohl<CR>", defaults)
map("n", "<leader><leader>", ":bufdo e!<CR>", defaults)

-- map("n", "<M-s>", ":w <CR>", defaults)
-- map("n", "<M-c>", ":%y+<CR>", defaults)

-- Packer commands till because we are not loading it at startup
cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
