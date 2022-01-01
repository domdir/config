local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

telescope.setup {
    defaults = {
        file_ignore_patterns = {"\\.git\\/", "\\.git\\", "target\\/", "target\\"}
    }
}
telescope.load_extension('fzf')

map("n", "<c-p>", ":lua require('telescope.builtin').git_files()<CR>", opts)
map("n", "<c-t>g", ":lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<c-t>s", ":lua require('telescope.builtin').grep_string()<CR>", opts)
map("n", "<c-t>f", ":lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<c-t>b", ":lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "<c-t>c", ":lua require('telescope.builtin').commands()<CR>", opts)
map("n", "<c-t>t", ":lua require('telescope.builtin').treesitter()<CR>", opts)
map("n", "gd", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
map("n", "gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)
map("n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
map("n", "gD", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
map("n", "gW", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)

