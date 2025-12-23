-- Basic nvim configuration

local opt = vim.opt

-- Performance optimizations
opt.updatetime = 300      -- Faster updates (default: 4000)
opt.timeoutlen = 500      -- Key sequence timeout (default: 1000)
opt.ttimeoutlen = 50      -- Key code timeout (default: -1)

-- Display settings
opt.number = true         -- Show line numbers (default: false)
opt.signcolumn = 'yes'    -- Always show sign column (default: 'auto')
opt.cursorline = true     -- Highlight current line (default: false)
opt.scrolloff = 5         -- Keep 5 lines visible (default: 0)
opt.sidescrolloff = 5     -- Keep 5 columns visible (default: 0)

-- File handling
opt.mouse = 'a'           -- Enable mouse (default: '')
opt.swapfile = false      -- No swap files (default: true)
opt.autoread = true       -- Auto-reload files changed externally (default: false)
opt.undofile = true       -- Persistent undo (default: false)
opt.backup = false        -- No backup files (default: true for some)
opt.writebackup = false   -- No write backup (default: true)

-- Indentation settings (Linux kernel style)
opt.expandtab = false     -- Use tabs, not spaces (default: true)
opt.shiftwidth = 0        -- Use tabstop (default: 8)
opt.softtabstop = 0       -- Use tabstop (default: 0)

-- Folding settings
opt.foldenable = false    -- Disable folding (default: true)

-- File encoding
opt.fileencodings = { 'utf-8', 'gb18030', 'gbk' }

-- Colorscheme and transparency
opt.background = 'dark'
opt.termguicolors = true  -- True color support (default: false for some terms)
opt.pumblend = 17         -- Popup transparency (default: 0)
opt.winblend = 17         -- Window transparency (default: 0)

-- Search and display
opt.linebreak = true      -- Break at word boundaries (default: false)
opt.breakindent = true    -- Indent wrapped lines (default: false)
opt.matchpairs:append('<:>')  -- HTML tag matching

-- Remove = from filename characters
opt.isfname:remove('=')

-- Window and buffer behavior
opt.laststatus = 3        -- Global statusline (default: 2)
opt.switchbuf = 'useopen,usetab'  -- Smart buffer switching

-- Command line completion
opt.wildmode = 'longest:full,list,full'  -- Better completion
opt.wildignore = {        -- Ignore patterns
  '*.o', '*.obj', '*.dll', '*.exe', '*.so', '*.dylib',
  '*.pyc', '*.pyo', '*.pyd', '__pycache__',
  '.DS_Store', '*.aux', '*.bbl', '*.blg', '*.fls',
  '*.fdb_latexmk', '*.synctex.gz', '*.xdv'
}

-- Misc improvements
opt.clipboard = 'unnamedplus'  -- Use system clipboard (default: '')
opt.confirm = true        -- Confirm unsaved changes (default: false)
opt.shortmess = 'filnxtToOFc'  -- Reduce messages (default: 'filnxtToOS')

-- Leader key
vim.g.mapleader = ','

-- Enable filetype detection and syntax
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

-- Simple colorscheme setup
vim.defer_fn(function()
  vim.cmd('colorscheme kolor')
  -- Basic transparency
  vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
end, 100)
