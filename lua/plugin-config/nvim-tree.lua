-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

require "nvim-tree".setup {
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    sort_by = "name",
    hijack_directories = {
        enable = true,
        auto_open = false
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
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "all",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = { ".git", ".idea", ".DS_Store", ".vscode" }
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 500
    },
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
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
