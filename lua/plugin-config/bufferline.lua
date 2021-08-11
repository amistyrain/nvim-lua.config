require"bufferline".setup {
    options = {
        modified_icon = '✥',
        mappings = true,
        buffer_close_icon = '',
        always_show_bufferline = false
    }
}

vim.api.nvim_set_keymap("n", "]b", ":BufferLineCycleNext <CR>", {silent = true})
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCyclePrev <CR>", {silent = true})
