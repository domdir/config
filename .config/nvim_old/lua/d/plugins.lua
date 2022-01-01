local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  
  -- Collection of common configurations for the Nvim LSP client
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Completion framework
  use "hrsh7th/nvim-cmp"

  -- LSP completion source for nvim-cmp
  use "hrsh7th/cmp-nvim-lsp"

  -- Snippet completion source for nvim-cmp
  use "hrsh7th/cmp-vsnip"

  -- Other usefull completion sources
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"

  -- See hrsh7th's other plugins for more completion sources!
  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  use "simrat39/rust-tools.nvim"

  -- Snippet engine
  use "hrsh7th/vim-vsnip"

  -- Fuzzy finder
  use "nvim-telescope/telescope.nvim"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

  -- tabs
  use "mildred/vim-bufmru"

  -- theme
  use "https://gitlab.com/yorickpeterse/happy_hacking.vim.git"
  use "tomasiser/vim-code-dark"
  use "luochen1990/rainbow"

  -- multi line
  use "mg979/vim-visual-multi"

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

  -- lua mapping function
  use "b0o/mapx.nvim"

  -- java
  use "mfussenegger/nvim-jdtls"

  -- debugger
  use "mfussenegger/nvim-dap"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

