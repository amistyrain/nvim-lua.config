local status_ok1, gl = pcall(require, "galaxyline")
local status_ok2, condition = pcall(require, "galaxyline.condition")
if not (status_ok1 or status_ok2) then return end

gl.short_line_list = {
    "NvimTree", "packer", "undotree", "vista", "Floaterm", "vista_markdown"
}

local colors = {
    bg = "#292D38",
    yellow = "#DCDCAA",
    dark_yellow = "#D7BA7D",
    cyan = "#4EC9B0",
    green = "#608B4E",
    light_green = "#B5CEA8",
    string_orange = "#CE9178",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    grey = "#43454F",
    lsp_bg = "#363B40",
    blue = "#569CD6",
    vivid_blue = "#4FC1FF",
    light_blue = "#9CDCFE",
    red = "#D16969",
    error_red = "#F44747",
    info_yellow = "#FFCC66",
    line_bg = '#353644'
}

local function all(...)
    local args = {...}
    return function()
        for _, fn in ipairs(args) do if not fn() then return false end end
        return true
    end
end

local function checkwidth() return (vim.fn.winwidth(0) / 2) > 40 end

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

local function find_git_root()
    return
        require('galaxyline/provider_vcs').get_git_dir(vim.fn.expand('%:p:h'))
end

local gls = gl.section

local mode_color = function()
    local mode_colors = {
        n = colors.green,
        i = colors.blue,
        c = colors.orange,
        V = colors.magenta,
        [""] = colors.magenta,
        v = colors.magenta,
        R = colors.red
    }

    local color = mode_colors[vim.fn.mode()]

    if color == nil then color = colors.red end

    return color
end

gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            vim.api.nvim_command("hi GalaxyViMode gui=bold guibg=" ..
                                     mode_color())
            local alias_mode = alias[vim.fn.mode()]
            if alias_mode == nil then alias_mode = vim.fn.mode() end
            return "  " .. alias_mode .. " "
        end,
        separator = "",
        highlight = {colors.bg, colors.section_bg}
    }
}

gls.left[2] = {
    GitIcon = {
        provider = function() return "   " end,
        condition = condition.check_git_workspace,
        separator = "",
        separator_highlight = {"NONE", colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = {"NONE", colors.bg},
        highlight = {colors.green, colors.bg}
    }
}

gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon_color,
            colors.line_bg
        }
    }
}

gls.left[5] = {
    FileName = {
        provider = {'FileName', 'FileSize'},
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.line_bg, 'bold'}
    }
}

gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = all(checkwidth, find_git_root),
        icon = ' ',
        highlight = {colors.green, colors.bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.red, colors.bg}
    }
}

gls.mid[5] = {
    ShowLspClient = {
        provider = "GetLspClient",
        condition = function()
            local tbl = {["dashboard"] = true, [" "] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = " LSP: ",
        highlight = {colors.cyan, colors.lsp_bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.error_red, colors.bg}
    }
}

gls.right[2] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = {colors.vivid_blue, colors.bg}
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {colors.info_yellow, colors.bg}
    }
}

gls.right[5] = {
    LineInfo = {
        provider = "LineColumn",
        separator = " ",
        separator_highlight = {colors.light_green, colors.bg},
        highlight = {colors.info_yellow, colors.bg}
    }
}

gls.right[6] = {
    PerCent = {
        provider = "LinePercent",
        separator = "",
        separator_highlight = {"NONE", colors.bg},
        highlight = {colors.info_yellow, colors.bg}
    }
}

gls.right[7] = {
    TreeSitterIcon = {
        provider = function()
            if next(vim.treesitter.highlighter.active) ~= nil then
                return " "
            end
            return ""
        end,
        separator = " ",
        separator_highlight = {"NONE", colors.bg},
        highlight = {colors.green, colors.bg}
    }
}

gls.right[8] = {
    FileFormat = {
        provider = "FileFormat",
        separator = " ",
        separator_highlight = {"NONE", colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}
