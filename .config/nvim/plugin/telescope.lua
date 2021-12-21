require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"\\.git\\/", "\\.git\\", "target\\/", "target\\"}
    }
}
require('telescope').load_extension('fzf')

local mapx = require'mapx'
mapx.nnoremap("<c-p>", ":lua require('telescope.builtin').git_files()<CR>", "silent")
mapx.nnoremap("<c-t>g", ":lua require('telescope.builtin').find_files()<CR>", "silent")
mapx.nnoremap("<c-t>s", ":lua require('telescope.builtin').grep_string()<CR>", "silent")
mapx.nnoremap("<c-t>f", ":lua require('telescope.builtin').live_grep()<CR>", "silent")
mapx.nnoremap("<c-t>b", ":lua require('telescope.builtin').buffers()<CR>", "silent")
mapx.nnoremap("<c-t>c", ":lua require('telescope.builtin').commands()<CR>", "silent")
mapx.nnoremap("<c-t>t", ":lua require('telescope.builtin').treesitter()<CR>", "silent")
mapx.nnoremap("gd", ":lua require('telescope.builtin').lsp_definitions()<CR>")
mapx.nnoremap("gi", ":lua require('telescope.builtin').lsp_implementations()<CR>")
mapx.nnoremap("gr", ":lua require('telescope.builtin').lsp_references()<CR>")
mapx.nnoremap("gD", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
mapx.nnoremap("gW", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

