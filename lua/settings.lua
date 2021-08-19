-- Neovim API aliases
-----------------------------------------------------------
-- local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local o = vim.o -- global options
local b = vim.bo -- buffer-scoped options
local w = vim.wo -- windows-scoped options
local opt = vim.opt

-- CACHE_PATH = fn.stdpath "cache"
o.mouse = 'a' -- enable mouse support
o.clipboard = 'unnamedplus' -- copy/paste to system clipboard
b.swapfile = false -- don't use swapfile
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
o.syntax = 'enable' -- enable syntax highlighting
w.number = true -- show line number
o.showmatch = true -- highlight matching parenthesis
o.ignorecase = true -- ignore case letters when search
o.smartcase = true -- ignore lowercase for the whole pattern
o.hlsearch = true
o.undofile = true

-- o.undodir = CACHE_PATH .. "undo"
o.encoding = 'utf-8'
o.scrolloff = 8
o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
o.termguicolors = true -- enable 24-bit RGB colors
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
b.expandtab = true -- use spaces instead of tabs
b.shiftwidth = 4 -- shift 4 spaces when tab
b.tabstop = 4 -- 1 tab == 4 spaces
b.smartindent = true -- autoindent new lines
--------------------------------------
-- gui
--------------------------------------
o.guifont = 'Hack Nerd Font Mono:h17'
--------------------------------------


-- disable builtin vim plugins
local disabled_built_ins = {
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "gzip",
   "zip",
   "zipPlugin",
   "tar",
   "tarPlugin",
   "getscript",
   "getscriptPlugin",
   "vimball",
   "vimballPlugin",
   "2html_plugin",
   "logipat",
   "rrhelper",
   "spellfile_plugin",
   "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end