-- local cmd = vim.api

-- -- show cursor line only in active window
-- local nvimtree = cmd.nvim_create_augroup("nvimtree", { clear = true })
-- cmd.nvim_create_autocmd(
--     { "BufAdd", "BufNew" },
--     { pattern = "*", command = "NvimTreeRefresh", group = nvimtree }
-- )

vim.api.nvim_create_autocmd('UIEnter', {
    once = true,
    callback = function()
        local notify = require('notify')
        notify.setup({
            level = vim.log.levels.INFO,
            background_colour = 'Normal',
            icons = {
                TRACE = '⇣',
                DEBUG = '🐞',
                INFO  = '🛈',
                WARN  = '⚠',
                ERROR = '',
            },
            render = 'default',
            stages = 'static',
            -- max_width = function()
            --   local c = math.floor(vim.go.columns)
            --   return c > 80 and c/2 or c
            -- end,
            timeout = 3000,
        })
        vim.notify = notify

        vim.keymap.set('n', '<Leader>nn', function()
            notify.dismiss({
                pending = true,
                silent = true,
            })
        end, { noremap = true, silent = true })
    end,
})
