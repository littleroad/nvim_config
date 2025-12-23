-- Plugin configuration with packer

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'zeis/vim-kolor'
  use 'tpope/vim-fugitive'
  use 'preservim/tagbar'
  use 'dhananjaylatkar/cscope_maps.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
end)
