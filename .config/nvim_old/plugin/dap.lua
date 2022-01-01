local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)

