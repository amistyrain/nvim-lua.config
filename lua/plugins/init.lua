return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugin-config.lsp"
        end
    },

    {
        "williamboman/mason.nvim",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
            "MasonUpdate",
            "MasonUpdateAll",
        },
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require "plugin-config.lsp-servers"
        end
    },

    {
        "hrsh7th/nvim-cmp",
        -- event = { "InsertEnter", "CmdlineEnter" },
        event = { "InsertEnter", },
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require "plugin-config.luasnip"
                end,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-calc",
                'ray-x/cmp-treesitter',
                'hrsh7th/cmp-cmdline',
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end
            },
        },
        config = function()
            require "plugin-config.nvim-cmp"
        end
    },

    {
        "nvim-tree/nvim-web-devicons"
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "plugin-config.gitsigns"
        end
    },

    {
        "folke/trouble.nvim",
        config = function()
            require "plugin-config.trouble"
        end,
        init = function()
            require("plugin-map").trouble()
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        cmd = {
            "TSBufDisable",
            "TSBufEnable",
            "TSBufToggle",
            "TSDisable",
            "TSEnable",
            "TSToggle",
            "TSInstall",
            "TSInstallInfo",
            "TSInstallSync",
            "TSModuleInfo",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
        },
        build = ":TSUpdate",
        config = function()
            require "plugin-config.treesitter"
        end
    },

    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        ft = { 'c', 'cpp', 'lua', 'rust', 'go' },
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },

    {
        "onsails/lspkind-nvim",
        event = "InsertEnter",
        config = function()
            require("lspkind").init()
        end
    },

    {
        "SmiteshP/nvim-navic",
        config = function()
            require "plugin-config.nvim-navic"
        end
    },

    {
        "feline-nvim/feline.nvim",
        config = function()
            if vim.fn.has "nvim-0.8" == 1 then
                require "plugin-config.feline-winbar"
            else
                require "plugin-config.feline"
            end
        end
    },

    {
        "nvim-lua/plenary.nvim"
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertCharPre",
        opts = {
            timeout = 300,
        },
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup()
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    {
        "nvim-lua/popup.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "plugin-config.telescope"
        end,
        init = function()
            require("plugin-map").telescope()
        end
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
            }
        end
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugin-config.nvim-tree"
        end,
        init = function()
            require("plugin-map").nvimtree()
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "plugin-config.indent-blankline"
        end,
        event = { "BufReadPre", "BufNewFile" }
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("plugin-config.alpha")
        end
    },

    {
        "folke/which-key.nvim",
        keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function()
            require("Comment").setup()
        end
    },

    {
        "ggandor/lightspeed.nvim",
        config = function()
            require "plugin-config.lightspeed"
        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd([[colorscheme gruvbox]])
        end
    },

    -- {
    --     "mfussenegger/nvim-dap",
    --     dependencies = {
    --         {
    --             "jay-babu/mason-nvim-dap.nvim",
    --             dependencies = { "nvim-dap" },
    --             cmd = { "DapInstall", "DapUninstall" },
    --             opts = { handlers = {} },
    --         },
    --         {
    --             "rcarriga/nvim-dap-ui",
    --             opts = { floating = { border = "rounded" } },
    --             config = require "plugin-config.dapui",
    --         },
    --         {
    --             "rcarriga/cmp-dap",
    --             dependencies = { "nvim-cmp" },
    --             config = require "plugin-config.cmp-dap",
    --         },
    --     },
    -- },

    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "plugin-config.nvim-go"
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {
        "folke/noice.nvim",
        config = function()
            require "plugin-config.noice"
        end,
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    {
        'sindrets/diffview.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = function()
            require("plugin-map").diffview()
        end
    },

    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        lazy = true,
        keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
        config = function()
            vim.g.mkdp_auto_close = true
            vim.g.mkdp_open_to_the_world = false
            vim.g.mkdp_open_ip = "127.0.0.1"
            vim.g.mkdp_port = "8888"
            vim.g.mkdp_browser = ""
            vim.g.mkdp_echo_preview_url = true
            vim.g.mkdp_page_title = "${name}"
        end,
    },
}
