local notify = require("notify")
notify.setup({
    -- level = vim.log.levels.INFO,
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
