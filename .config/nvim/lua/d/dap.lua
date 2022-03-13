local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
  return
end

local vt_status_ok, vt = pcall(require, "nvim-dap-virtual-text")
if not vt_status_ok then
  return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", "<cmd>:lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", "<cmd>:lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<cmd>:lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<cmd>:lua require'dap'.step_out()<CR>", opts)

vt.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
