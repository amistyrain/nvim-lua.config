local present, alpha = pcall(require, "alpha")

if not present then
    return
end
local dashboard = require("alpha.themes.dashboard")

local ascii = {
    "    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ",
    "    ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ",
    "    ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ",
    "    ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ",
    "    ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ",
    "    ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ",
    "    ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ",
    "    ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ",
    "    ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ",
    "    ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ",
    "    ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ",
    "    ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ",
    "    ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ",
    "    ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ",
    "    ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ",
    "    ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  "
}

local header = {
    type = "text",
    val = ascii,
    opts = {
        position = "center",
        hl = "Type",
        shrink_margin = true
    }
}

local buttons = {
    type = "group",
    val = {
        { type = "text", val = "Quick links", opts = { hl = "Constant", position = "center" } },
        dashboard.button("SPC f f", "󰈞  Find File  ", ":Telescope find_files<CR>"),
        dashboard.button("SPC f o", "󰷊  Recent File  ", ":Telescope oldfiles<CR>"),
        dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
        dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
        dashboard.button("SPC p y", "  Sync plugins", ":Lazy sync<CR>"),
        dashboard.button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>")
    },
    opts = {
        spacing = 1
    }
}

local function footer()
    local stats = require("lazy").stats()
    -- local ms = math.floor(stats.startuptime * 100 + 0.5) / 100   [ in " .. ms .. "ms]
    local date = os.date("%Y-%m-%d")
    local time = os.date("%H:%M:%S")
    return "[ " .. stats.count .. " plugins] [ " .. date .. "] [ " .. time .. "]"
end

local footers = {
    type = "group",
    val = {
        { type = "text", val = footer(), opts = { hl = "Constant", position = "center" } },
    }
}

local section = {
    header = header,
    buttons = buttons,
    footers = footers
}

alpha.setup {
    layout = {
        { type = "padding", val = 4 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        { type = "padding", val = 1 },
        section.footers
    },
    opts = {
        position = "center",
        setup = function()
            vim.cmd([[
            autocmd alpha_temp DirChanged * lua require('alpha').redraw()
            ]])
        end,
    }
}
