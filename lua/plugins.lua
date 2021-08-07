local fn = vim.fn

local packer_install_dir = fn.stdpath('data') ..
                               '/site/pack/packer/start/packer.nvim'

local plug_url_format = ''

plug_url_format = 'https://github.com/%s'

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s',
                                  packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == '' then
    vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
    vim.cmd(install_cmd)
    vim.cmd('packadd packer.nvim')
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins can have dependencies on other plugins
    use {
        'hrsh7th/nvim-compe',
        opt = true,
        event = "InsertEnter",
        config = [[require("plugin-config.nvim-compe")]],
        requires = {
            {
                'hrsh7th/vim-vsnip',
                opt = true,
                event = "InsertCharPre",
                require = {"rafamadriz/friendly-snippets", opt = true}
            }, {'hrsh7th/vim-vsnip-integ', opt = true, event = "InsertCharPre"}
        }
    }
    use {"rafamadriz/friendly-snippets", event = "InsertCharPre"}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require("plugin-config.treesitter")]]
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    use {
        'hoob3rt/lualine.nvim',
        config = [[require("plugin-config.lualine")]],
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = [[require("plugin-config.telescope")]],
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = [[require("plugin-config.nvim-tree")]],
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use "lukas-reineke/indent-blankline.nvim"

    use {"ray-x/lsp_signature.nvim"}

    use "glepnir/lspsaga.nvim"

    use "glepnir/dashboard-nvim"

    use {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = [[require("plugin-config.lsp")]]
    }
    use {
        "kabouzeid/nvim-lspinstall",
        event = "VimEnter",
        config = function()
            local lspinstall = require "lspinstall"
            lspinstall.setup()
        end
    }

    use {
        "voldikss/vim-floaterm",
        config = [[require("plugin-config.vim-floaterm")]]
    }

    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = [[require("plugin-config.autopairs")]]
    }

    use {
        "terrortylor/nvim-comment",
        config = function() require('nvim_comment').setup() end
    }

    use "tpope/vim-surround"

    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }

    use {'fatih/molokai', config = [[vim.cmd('colorscheme molokai')]]}
end)

vim.cmd([[
  augroup packer_auto_compile
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
  augroup END
]])
