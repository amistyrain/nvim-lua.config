local M = {}
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {noremap = true, silent = true}

M.comment_nvim = function()
    map("n", "gc", ":CommentToggle<CR>", opt)
    map("v", "gcc", ":CommentToggle<CR>", opt)
end

M.nvimtree = function()
    map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
end

M.telescope = function()
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
    map("n", "<leader>ff", ":Telescope find_files <CR>", opt)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
    map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
    map("n", "<leader>fo", ":Telescope oldfiles<CR>", opt)
    map("n", "<leader>ft", ":Telescope themes<CR>", opt)
    map("n", "<leader>gs", ":Telescope git_status <CR>", opt)
    map("n", "<leader>gc", ":Telescope git_commits <CR>", opt)
end

M.vista = function()
    map("n", "<Leader>v", ":<C-u>Vista!!<CR>", opt)
end

M.trouble = function()
    map("n", "<leader>xx", "<cmd>Trouble<cr>", opt)
    map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opt)
    map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opt)
    map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opt)
    map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opt)
    map("n", "gR", "<cmd>Trouble lsp_references<cr>", opt)
end

M.hop = function()
    map("n", "s", ":HopChar2<CR>", {silent = true})
    map("n", "S", ":HopWord<CR>", {silent = true})
end

return M
