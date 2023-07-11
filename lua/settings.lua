-- Neovim API aliases
-----------------------------------------------------------
-- local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn              -- call Vim functions
local g = vim.g                -- global variables
local o = vim.o                -- global options
local b = vim.bo               -- buffer-scoped options
local w = vim.wo               -- windows-scoped options
local opt = vim.opt
local CACHE_PATH = vim.fn.stdpath "cache"

g.mapleader = ","           -- change leader to a command

o.mouse = "a"               -- enable mouse support
o.clipboard = "unnamedplus" -- copy/paste to system clipboard
b.swapfile = false          -- don't use swapfile
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
o.syntax = "enable" -- enable syntax highlighting
w.number = true     -- show line number
w.numberwidth = 1
o.showmatch = true  -- highlight matching parenthesis
o.ignorecase = true -- ignore case letters when search
o.smartcase = true  -- ignore lowercase for the whole pattern
o.hlsearch = true
o.undofile = true
o.undodir = CACHE_PATH .. "/undo" -- set an undo directory
o.cmdheight = 1
o.title = true
opt.cursorline = true -- Highlight the text line of the cursor
opt.showtabline = 0
opt.backupcopy = 'yes'
opt.laststatus = 3
opt.undolevels = 1000
opt.shortmess:append { c = true, S = false }
opt.showmode = false
opt.hidden = true
opt.splitright = true
opt.splitbelow = true
opt.wrapscan = true
opt.backup = false
opt.termguicolors = true
opt.writebackup = false
opt.showcmd = true
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.smartcase = true
-- opt.relativenumber = true -- Show relative numberline
opt.errorbells = false
opt.joinspaces = false
opt.title = true
opt.lazyredraw = false
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
o.encoding = "utf-8"
o.scrolloff = 8
o.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
o.termguicolors = true -- enable 24-bit RGB colors
o.background = "dark"  -- or "light" for light mode
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
o.expandtab = true   -- use spaces instead of tabs
o.shiftwidth = 4     -- shift 4 spaces when tab
o.tabstop = 4        -- 1 tab == 4 spaces
o.smartindent = true -- autoindent new lines
--------------------------------------
-- gui
--------------------------------------
o.guifont = "Hack Nerd Font:h14"
--------------------------------------
o.completeopt = "menuone,noselect"
-- neovide
--------------------------------------
-- g.neovide_fullscreen = true
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
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end


if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_profiler = false
    vim.g.neovide_input_macos_alt_is_meta = true

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.1)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.1)
    end)

    vim.g.neovide_input_use_logo = true
    vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
