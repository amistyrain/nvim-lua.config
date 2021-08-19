local M = {}
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {noremap = true, silent = true}


M.toggleterm = function()
   -- Open
   map("n", "<leader>w", ":lua termW:toggle() <CR>", opt)
   -- Hide
   map("t", "JJ", "<C-\\><C-n> :ToggleTerm <CR>", opt)
end

M.comment_nvim = function()
   map("n", "gc", ":CommentToggle<CR>", opt)
   map("v", "gcc", ":CommentToggle<CR>", opt)
end

M.nvimtree = function()
   map("n", "<leader>g", ":NvimTreeToggle<CR>", opt)
end

M.telescope = function()
   map("n", "<leader>fw", ":Telescope live_grep<CR>", opt)
   map("n", "<leader>ff", ":Telescope find_files <CR>", opt)
   map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
   map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
   map("n", "<leader>fo", ":Telescope oldfiles<CR>", opt)
   map("n", "<leader>ft", ":Telescope themes<CR>", opt)
   map("n", "<leader>gs", ":Telescope git_status <CR>", opt)
   map("n", "<leader>gc", ":Telescope git_commits <CR>", opt)
end

M.bufferline = function()
   -- move between tabs
   map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
   map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)
end

M.vista = function()
   map("n", "<Leader>v", ":<C-u>Vista!!<CR>",opt)
end

return M
