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

-- local function button(sc, txt, keybind)
--     local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

--     local opts = {
--         position = "center",
--         text = txt,
--         shortcut = sc,
--         cursor = 5,
--         width = 36,
--         align_shortcut = "right",
--         hl = "AlphaButtons"
--     }

--     if keybind then
--         opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
--     end

--     return {
--         type = "button",
--         val = txt,
--         on_press = function()
--             local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
--             vim.api.nvim_feedkeys(key, "normal", false)
--         end,
--         opts = opts,
--     }
-- end

local buttons = {
    type = "group",
    val = {
        { type = "text", val = "Quick links", opts = { hl = "Constant", position = "center" } },
        -- { type = "padding", val = 1 },
        dashboard.button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
        dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
        dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
        dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
        dashboard.button("SPC p y", "  Sync plugins", ":PackerSync<CR>"),
        dashboard.button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>")
    },
    opts = {
        spacing = 1
    }
}

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local date = os.date("%Y-%m-%d")
    local time = os.date("%H:%M:%S")
    return "[ " .. total_plugins .. " plugins] [ " .. date .. "] [ " .. time .. "]"
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
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        { type = "padding", val = 2 },
        section.footers
    },
    opts = {
        -- position = "center",
        margin = 5,
        setup = function()
            vim.cmd([[
            autocmd alpha_temp DirChanged * lua require('alpha').redraw()
            ]])
        end,
    }
}
