local options = {
    encoding="utf-8",
    exrc = true,
    relativenumber = true,
    number = true,
    hlsearch = false,
    hidden = true,
    errorbells = false,
    belloff = "all",
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    wrap = false,
    swapfile = false,
    backup = false,
    undodir = "~/.vim/undodir",
    incsearch = true,
    scrolloff = 8,
    signcolumn = "yes",
    pastetoggle="<F3>",
    termguicolors = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

