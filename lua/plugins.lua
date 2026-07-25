-- Plugin configuration with packer (thin aggregator)
-- Chrome plugins only; feature-owned pins live in their modules.

local code_intelligence = require('config.code_intelligence')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'tomasr/molokai'

  -- git
  use 'tpope/vim-fugitive'

  -- Code intelligence plugins (owned by code_intelligence module)
  code_intelligence.pack(use)
end)
