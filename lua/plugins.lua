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
            "kabouzeid/nvim-lspinstall",
            event = "BufReadPre"
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugin-config.lsp"
            end
        }

        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugin-config.nvim-compe"
            end,
            wants = "vim-vsnip",
            requires = {
                {
                    "hrsh7th/vim-vsnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require "plugin-config.vim-vsnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                }
            }
        }

        use {
            "kyazdani42/nvim-web-devicons"
        }

        use {
            "akinsho/bufferline.nvim",
            after = "galaxyline.nvim",
            config = [[require("plugin-config.bufferline")]],
            setup = function()
                require("plugin-map").bufferline()
            end
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
            event = "BufRead",
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
            "glepnir/galaxyline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugin-config.galaxyline"
            end
        }

        use {
            "nvim-lua/plenary.nvim",
            after = "bufferline.nvim"
        }

        use {
            "nvim-lua/popup.nvim",
            after = "plenary.nvim"
        }
        use {
            "nvim-telescope/telescope.nvim",
            after = "plenary.nvim",
            config = function()
                require "plugin-config.telescope"
            end,
            setup = function()
                require("plugin-map").telescope()
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            event = "VimEnter",
            config = function()
                require "plugin-config.nvim-tree"
            end,
            requires = "kyazdani42/nvim-web-devicons",
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
            "glepnir/dashboard-nvim",
            event = "BufWinEnter",
            config = function()
                require "plugin-config.dashboard"
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
            "akinsho/nvim-toggleterm.lua",
            event = "BufWinEnter",
            config = function()
                require "plugin-config.toggleterm"
            end,
            setup = function()
                require("plugin-map").toggleterm()
            end
        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function()
                require "plugin-config.autopairs"
            end
        }

        use {
            "terrortylor/nvim-comment",
            event = {"BufReadPre", "BufNewFile"},
            config = function()
                require("nvim_comment").setup()
            end,
            setup = function()
                require("plugin-map").comment_nvim()
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
            "blackCauldron7/surround.nvim",
            event = {"BufRead", "BufNewFile"},
            config = function()
                require "surround".setup {}
            end
        }

        use {
            "phaazon/hop.nvim",
            as = "hop",
            event = "BufReadPre",
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
            end
        }

        use {
            "fatih/molokai",
            event = "VimEnter",
            config = [[vim.cmd('colorscheme molokai')]]
        }

        use {
            "Pocco81/TrueZen.nvim",
            cmd = {
                "TZAtaraxis"
            },
            event = "BufRead",
            config = function()
                require "plugin-config.zenmode"
            end,
            setup = function()
                require("plugin-map").truezen()
            end
        }
    end
)
