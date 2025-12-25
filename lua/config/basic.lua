-- Basic nvim configuration

local opt = vim.opt

-- Display settings
opt.number = true         -- Show line numbers (default: false)
opt.cursorline = true     -- Highlight current line (default: false)
opt.scrolloff = 5         -- Keep 5 lines visible (default: 0)
opt.sidescrolloff = 5     -- Keep 5 columns visible (default: 0)

-- File handling
opt.mouse = 'a'           -- Enable mouse (default: '')
opt.swapfile = false      -- No swap files (default: true)
opt.autoread = true       -- Auto-reload files changed externally (default: false)
opt.autowrite = true
opt.backup = false        -- No backup files (default: true for some)
opt.writebackup = false   -- No write backup (default: true)

-- Indentation settings (Linux kernel style)
opt.expandtab = false     -- Use tabs, not spaces (default: true)
opt.shiftwidth = 0        -- Use tabstop (default: 8)
opt.softtabstop = 0       -- Use tabstop (default: 0)

-- Folding settings
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"

-- File encoding
opt.fileencodings = { 'utf-8', 'gb18030', 'gbk' }

-- Colorscheme and transparency
opt.background = 'dark'
opt.pumblend = 17         -- Popup transparency (default: 0)
opt.winblend = 17         -- Window transparency (default: 0)
opt.winborder = "rounded"

-- Search and display
opt.linebreak = true      -- Break at word boundaries (default: false)
opt.breakindent = true    -- Indent wrapped lines (default: false)

-- Remove = from filename characters
opt.isfname:remove('=')

-- Window and buffer behavior
opt.laststatus = 3        -- Global statusline (default: 2)
opt.switchbuf = 'useopen,usetab'  -- Smart buffer switching

-- Misc improvements
opt.clipboard = 'unnamedplus'  -- Use system clipboard (default: '')
opt.wildmode = "longest,list,full"
opt.completeopt = "menuone,popup,longest"

-- Leader key
vim.g.mapleader = ','

-- Colorscheme
vim.cmd.colorscheme('molokai')
vim.cmd.highlight('Normal guibg=NONE')
vim.cmd.highlight('NonText guibg=NONE')
vim.cmd.highlight('Comment guifg=#808080')
