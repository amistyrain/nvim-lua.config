-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.g.nvim_tree_auto_ignore_ft = "dashboard"
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
    folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
}
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_show_icons = {
    folders = 1,
    files = 1,
    git = 0
}

require "nvim-tree".setup {
    ignore_ft_on_setup = { "dashboard" },
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = true,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = { ".git", ".idea", ".cache", ".DS_Store", ".vscode" }
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
}
