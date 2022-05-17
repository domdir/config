local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local mark_status_ok = pcall(require, "harpoon.mark")
if not mark_status_ok then
  return
end

keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)

local ui_status_ok = pcall(require, "harpoon.ui")
if not ui_status_ok then
  return
end

keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)

