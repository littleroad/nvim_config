-- Plugin configuration with packer

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'tomasr/molokai'

  use 'tpope/vim-fugitive'
  use 'preservim/tagbar'
  use 'dhananjaylatkar/cscope_maps.nvim'
  use 'neovim/nvim-lspconfig'
end)
