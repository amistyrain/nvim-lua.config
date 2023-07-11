local M = {}
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local opt = { noremap = true, silent = true }

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

M.trouble = function()
    map("n", "<leader>xx", "<cmd>Trouble<cr>", opt)
    map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opt)
    map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opt)
    map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opt)
    map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opt)
end

M.dap = function()
    map("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opt)
    map("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", opt)
    map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opt)
    map("n", "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", opt)
    map("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", opt)
    map("n", "<leader>dg", "<cmd>lua require'dap'.session()<cr>", opt)
    map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opt)
    map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opt)
    map("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opt)
    map("n", "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", opt)
    map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opt)
    map("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", opt)
end

M.diffview = function()
    map("n", "<leader>vo", "<cmd>DiffviewOpen<cr>", opt)
    map("n", "<leader>vq", "<cmd>DiffviewClose<cr>", opt)
    map("n", "<leader>vb", "<cmd>DiffviewOpen origin/master..HEAD<cr>", opt)
    map("n", "<leader>vh", "<cmd>DiffviewFileHistory<cr>", opt)
end

return M
