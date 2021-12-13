set exrc
" set guicursor=i:ver25-iCursor
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set signcolumn=yes

call plug#begin('~/AppData/Local/nvim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" tabs
Plug 'mildred/vim-bufmru'

" theme
Plug 'https://gitlab.com/yorickpeterse/happy_hacking.vim.git'
Plug 'tomasiser/vim-code-dark'
Plug 'luochen1990/rainbow'

" multi line
Plug 'mg979/vim-visual-multi'

call plug#end()

let mapleader = " "

nnoremap <silent> <Leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vp :PlugInstall<CR>


" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup({})
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF


" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" telescope
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<CR>
lua << EOF
require('telescope').setup {
    defaults = {
    }
}
require('telescope').load_extension('fzy_native')
EOF

" buffers
nnoremap <Tab> :BufMRUNext<CR>
nnoremap <S-Tab> :BufMRUPrev<CR>
nnoremap <leader><Tab> :BufMRUCommit<CR>
nnoremap <c-w><c-w> :bd<CR>

" color happy_hacking
colorscheme codedark
let g:rainbow_active = 1

" quick save
nnoremap <leader>w :w<CR>

" clipboard from OS
inoremap <c-v> <esc>"*pi
inoremap <c-c> <esc>V"*y<esc>i
nnoremap <c-c> V"*y<esc>
vnoremap <c-c> "*y

" quckfix list (<c-q>)
nnoremap <c-j> :cnext<CR>
nnoremap <c-k> :cprev<CR>
nnoremap <c-w>q :cclose<CR>

