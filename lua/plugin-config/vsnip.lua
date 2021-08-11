vim.api.nvim_set_keymap("i", "<C-l>",
                        "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'",
                        {expr = true})
vim.api.nvim_set_keymap("s", "<C-l>",
                        "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'",
                        {expr = true})
