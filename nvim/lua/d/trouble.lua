local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup {}

vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<c-j>", "",
  {silent = true, noremap = true, callback = function() trouble.next({skip_groups = true, jump = true}) end}
)

vim.api.nvim_set_keymap("n", "<c-k>", "",
  {silent = true, noremap = true, callback = function() trouble.previous({skip_groups = true, jump = true}) end}
)
