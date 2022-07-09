local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.register({
  ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find file" },

  ["<C-Up>"] = { ":resize -2<CR>", "Resize buffer h--" },
  ["<C-Down>"] = { ":resize +2<CR>", "Resize buffer h++" },
  ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize buffer v--" },
  ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize buffer v++" },

  L = { ":BufMRUPrev<CR>", "Previous buffer" },
  H = { ":BufMRUNext<CR>", "Next buffer" },

  ["<A-j>"] = { "<Esc>:m .+1<CR>", "Move line down" },
  ["<A-k>"] = { "<Esc>:m .-2<CR>", "Move line up" },

  ["<esc>"] = { ":noh<return><esc>", "Clear search" },
  ["<esc>^["] = { "<esc>^[]]", "Clear search" },

  Y = { "y$", "Yank to end of line" },

  x = { "d", "Cut" },
  ["xx"] = { "dd", "Cut line" },
  X = { "D", "Cut to end of line" },
}, {})
