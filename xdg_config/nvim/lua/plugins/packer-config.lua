-- Install packer if it is not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'
  -- Native LSP
  use 'neovim/nvim-lspconfig'
  -- LSP Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Language Packs
	use 'sheerun/vim-polyglot'
  -- Telescope Requirements
  use {                                                        
   'nvim-telescope/telescope.nvim',                           
   requires = {                                               
     {'nvim-lua/popup.nvim'},                                 
     {'nvim-lua/plenary.nvim'},                               
     {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
     {'nvim-telescope/telescope-symbols.nvim'},               
   },                                                         
  }                                                             
  -- devicons
  use 'kyazdani42/nvim-web-devicons'
  -- colorscheme
  use 'gruvbox-community/gruvbox'
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
	
end)

