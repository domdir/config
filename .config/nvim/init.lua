vim.g.mapleader = " "

vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync
endif
]])

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

-- Completion framework
Plug 'hrsh7th/nvim-cmp'

-- LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

-- Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

-- Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

-- See hrsh7th's other plugins for more completion sources!
-- To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

-- Snippet engine
Plug 'hrsh7th/vim-vsnip'

-- Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- tabs
Plug 'mildred/vim-bufmru'

-- theme
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'tomasiser/vim-code-dark'
Plug 'luochen1990/rainbow'

-- multi line
Plug 'mg979/vim-visual-multi'

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- lua mapping function
Plug 'b0o/mapx.nvim'

-- java
Plug 'mfussenegger/nvim-jdtls'

-- debugger
Plug 'mfussenegger/nvim-dap'

vim.call('plug#end')

require'd'
require'd.mappings'
require'd.sets'

