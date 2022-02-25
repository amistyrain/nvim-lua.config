local fn = vim.fn

local packer_install_dir = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local plug_url_format = ""

plug_url_format = "https://github.com/%s"

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
    vim.api.nvim_echo({{"Installing packer.nvim", "Type"}}, true, {})
    vim.cmd(install_cmd)
    vim.cmd("packadd packer.nvim")
end

vim.cmd [[packadd packer.nvim]]

local packer = require("packer")

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end,
        prompt_border = "single"
    },
    git = {
        clone_timeout = 600
    },
    auto_clean = true,
    compile_on_sync = true
}

packer.startup(
    function()
        -- Packer can manage itself
        use {
            "wbthomason/packer.nvim"
        }

        use {
            "neovim/nvim-lspconfig",
            event = "BufReadPre",
            config = function()
                require "plugin-config.lsp"
            end
        }

        use {
            "williamboman/nvim-lsp-installer",
            after = "nvim-lspconfig",
            config = function()
                require "plugin-config.lsp-servers"
            end
        }

        use {
            "rafamadriz/friendly-snippets",
            event = "InsertEnter"
        }

        use {
            "hrsh7th/nvim-cmp",
            after = "friendly-snippets",
            config = function()
                require "plugin-config.nvim-cmp"
            end
        }

        use {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            after = "nvim-cmp",
            config = function()
                require "plugin-config.luasnip"
            end
        }

        use {
            "saadparwaiz1/cmp_luasnip",
            after = "LuaSnip"
        }

        use {
            "hrsh7th/cmp-nvim-lua",
            after = "cmp_luasnip"
        }

        use {
            "hrsh7th/cmp-nvim-lsp",
            after = "cmp-nvim-lua"
        }

        use {
            "hrsh7th/cmp-buffer",
            after = "cmp-nvim-lsp"
        }

        use {
            "hrsh7th/cmp-path",
            after = "cmp-buffer"
        }
        --------------------------------------

        use {
            "kyazdani42/nvim-web-devicons"
        }

        use {
            "lewis6991/gitsigns.nvim",
            after = "plenary.nvim",
            event = "BufRead",
            config = function()
                require "plugin-config.gitsigns"
            end
        }

        use {
            "folke/trouble.nvim",
            event = "BufRead",
            config = function()
                require "plugin-config.trouble"
            end,
            setup = function()
                require("plugin-map").trouble()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "plugin-config.treesitter"
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "InsertEnter",
            config = function()
                require("lspkind").init()
            end
        }

        use {
            "SmiteshP/nvim-gps",
            after = "nvim-web-devicons",
            config = function()
                require "plugin-config.nvim-gps"
            end
        }

        use {
            "feline-nvim/feline.nvim",
            after = "nvim-gps",
            config = function()
                require "plugin-config.feline"
            end
        }

        use {
            "nvim-lua/plenary.nvim"
        }

        use {
            "nvim-lua/popup.nvim",
            after = "plenary.nvim"
        }

        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require "plugin-config.telescope"
            end,
            setup = function()
                require("plugin-map").telescope()
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {"NvimTreeToggle", "NvimTreeFocus"},
            config = function()
                require "plugin-config.nvim-tree"
            end,
            setup = function()
                require("plugin-map").nvimtree()
            end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require "plugin-config.indent-blankline"
            end,
            event = {"BufReadPre", "BufNewFile"}
        }

        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugin-config.lsp-sign")
            end
        }

        use {
            'goolord/alpha-nvim',
            event = "BufWinEnter",
            config = function()
                require("plugin-config.alpha")
            end
        }

        use {
            "folke/which-key.nvim",
            event = "BufWinEnter",
            config = function()
                require("which-key").setup {}
            end
        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require "plugin-config.autopairs"
            end
        }

        use {
            "numToStr/Comment.nvim",
            event = "BufReadPre",
            config = function()
                require("Comment").setup()
            end
        }

        use {
            "liuchengxu/vista.vim",
            event = {"BufRead", "BufNewFile"},
            config = function()
                require "plugin-config.vista"
            end,
            setup = function()
                require("plugin-map").vista()
            end
        }

        use {
            "ggandor/lightspeed.nvim",
            event = "BufReadPre",
            config = function()
                require "plugin-config.lightspeed"
            end
        }

        use {
            "ellisonleao/gruvbox.nvim",
            event = "VimEnter",
            config = [[vim.cmd('colorscheme gruvbox')]]
        }

        use {
            "ray-x/go.nvim",
            event = "VimEnter",
            config = function()
                require "plugin-config.nvim-go"
            end,
            requires = {
                "ray-x/guihua.lua",
                run = "cd lua/fzy && make"
            }
        }
    end
)
