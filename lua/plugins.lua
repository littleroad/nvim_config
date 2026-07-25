-- Plugin configuration with packer (thin aggregator)
-- Chrome plugins only; feature-owned pins live in their modules.

local code_intelligence = require('config.code_intelligence')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme (pin + setup co-located)
  use 'tomasr/molokai'
  vim.cmd.colorscheme('molokai')
  vim.cmd.highlight('Normal guibg=NONE')
  vim.cmd.highlight('NonText guibg=NONE')
  vim.cmd.highlight('Comment guifg=#808080')

  -- git
  use 'tpope/vim-fugitive'

  -- Code intelligence plugins (owned by code_intelligence module)
  code_intelligence.pack(use)
end)
