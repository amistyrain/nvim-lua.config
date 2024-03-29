-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

require("go").setup(
    {
        go = "go",                   -- go command, can be go[default] or go1.18beta1
        goimport = "gopls",          -- goimport command, can be gopls[default] or goimport
        fillstruct = "gopls",        -- can be nil (use fillstruct, slower) and gopls
        gofmt = "gofumpt",
        max_line_len = 120,          -- max line length in goline format
        -- tag_transform = false, -- tag_transfer  check gomodifytags for details
        test_template = "",          -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
        test_template_dir = "",      -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        tag_transform = "camelcase", -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        tag_options = '',            -- sets options sent to gomodifytags, i.e., json=omitempty
        comment_placeholder = "",    -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = { breakpoint = "🧘", currentpos = "🏃" },
        verbose = false,             -- output loginf in messages
        lsp_cfg = nil,               -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_codelens = true,      -- set to false to disable codelens, true by default
        gopls_remote_auto = true, -- add -remote=auto to gopls
        gopls_cmd = nil,          -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        fillstruct = "gopls",     -- can be nil (use fillstruct, slower) and gopls
        diagnostic = {            -- set diagnostic to false to disable vim.diagnostic setup
            -- in go.nvim
            hdlr = false,         -- hook lsp diag handler and send diag to quickfix
            underline = true,
            -- virtual text setup
            virtual_text = { spacing = 0, prefix = '■' },
            signs = true,
            update_in_insert = false,
        },
        dap_debug = true,         -- set to false to disable dap
        textobjects = true,       -- enable default text jobects through treesittter-text-objects
        test_runner = "go",       -- richgo, go test, richgo, dlv, ginkgo
        run_in_floaterm = true,   -- set to true to run in float window.
        --float term recommand if you use richgo/ginkgo with terminal color
        dap_debug_keymap = false, -- set keymaps for debugger
        dap_debug_gui = true,     -- set to true to enable dap gui, highly recommand
        dap_debug_vt = false,     -- set to true to enable dap virtual text
        build_tags = "tag1,tag2"  -- set default build tags
    }
)
