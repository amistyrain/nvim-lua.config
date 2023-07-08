local dap = require('dap')
local dapui = require("dapui")

vim.fn.sign_define('DapBreakpoint', {
    text = '🔴',
    texthl = '',
    linehl = '',
    numhl = '',
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapStopped", {
    text = "🔞",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
})
