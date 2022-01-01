local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- quick save
map("n", "<leader>w", ":w<CR>", opts)

-- toggle explorer
map("n", "<leader>e", ":Lex 30<CR>", opts)

-- quickfix list (<c-q>)
map("n", "<c-j>", ":cnext<CR>", opts)
map("n", "<c-k>", ":cprev<CR>", opts)
map("n", "<c-w>q", ":cclose<CR>", opts)

-- buffers
map("n", "<Tab>", ":BufMRUNext<CR>", opts)
map("n", "<S-Tab>", ":BufMRUPrev<CR>", opts)
map("n", "<c-w><c-w>", ":bd<CR>", opts)

map("n", "L", ":bnext<CR>", opts)
map("n", "H", ":bprevious<CR>", opts)

-- move lines up/down
map("n", "<A-j>", ":m .+1<CR>", opts)
map("n", "<A-k>", ":m .-2<CR>", opts)
map("v", "<A-j>", ":m .+1<CR>", opts)
map("v", "<A-k>", ":m .-2<CR>", opts)
map("x", "<A-j>", ":m '>+1<CR>gv", opts)
map("x", "<A-k>", ":m '<-2<CR>gv", opts)

-- stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- don't overwrite register on paste
map("v", "p", '"_dP', opts)

