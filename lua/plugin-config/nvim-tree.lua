vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}
vim.g.nvim_tree_ignore = {'.git', '.idea', '.cache', '.DS_Store', '.vscode'}
vim.api.nvim_set_keymap('n', '<leader>g', ':NvimTreeToggle<CR>',
                        {silent = true, noremap = true})
