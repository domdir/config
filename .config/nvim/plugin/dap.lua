local mapx = require'mapx'

mapx.nnoremap("<F5>", ":lua require'dap'.continue()<CR>")
mapx.nnoremap("<F10>", ":lua require'dap'.step_over()<CR>")
mapx.nnoremap("<F11>", ":lua require'dap'.step_into()<CR>")
mapx.nnoremap("<F12>", ":lua require'dap'.step_out()<CR>")
mapx.nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
mapx.nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
mapx.nnoremap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
mapx.nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
mapx.nnoremap("<leader>dl", ":lua require'dap'.run_last()<CR>")

require('dap')
-- vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointCondition', {text='❓', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

