local general_group = vim.api.nvim_create_augroup("_GeneralSettings", {})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf", "help", "man", "lspinfo" },
  group = general_group,
  callback = function ()
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":close<CR>", { noremap = true })
  end
})
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = general_group,
  callback = function ()
    require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  end
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  group = general_group,
  command = "set formatoptions-=cro"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  group = general_group,
  command = "set nobuflisted"
})

local resize_group = vim.api.nvim_create_augroup("_Resize", {})
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  group = resize_group,
  command = "tabdo wincmd = "
})

local tabs_and_spaces_group = vim.api.nvim_create_augroup("_TabsAndSpaces", {})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  group = tabs_and_spaces_group,
  command = "set shiftwidth=2 tabstop=2"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  group = tabs_and_spaces_group,
  command = "set autoindent noexpandtab tabstop=4 shiftwidth=4 formatoptions+=cro"
})
