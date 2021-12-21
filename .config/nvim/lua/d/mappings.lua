local mapx = require'mapx'

-- quick save
mapx.nnoremap("<leader>w", ":w<CR>")

-- quickfix list (<c-q>)
mapx.nnoremap("<c-j>", ":cnext<CR>", "silent")
mapx.nnoremap("<c-k>", ":cprev<CR>", "silent")
mapx.nnoremap("<c-w>q", ":cclose<CR>", "silent")

-- buffers
mapx.nnoremap("<Tab>", ":BufMRUNext<CR>", "silent")
mapx.nnoremap("<S-Tab>", ":BufMRUPrev<CR>", "silent")
mapx.nnoremap("<c-w><c-w>", ":bd<CR>")

