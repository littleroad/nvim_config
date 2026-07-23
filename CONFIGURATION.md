# Neovim Configuration Documentation

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── stylua.toml                 # Lua code formatter settings
├── CONFIGURATION.md            # This documentation
└── lua/
    ├── config/
    │   ├── utils.lua          # Utility functions
    │   ├── basic.lua          # Basic settings (migrated from vimrc)
    │   ├── plugins.lua        # Plugin manager
    │   ├── mappings.lua       # Key mappings
    │   ├── autocmds.lua       # Autocommands
    │   ├── ctags.lua          # Ctags navigation (alternative to cscope)
    │   └── plugin_lsp.lua     # LSP configuration with plugins
    └── package/
        └── my_plugins/
            ├── start/          # Auto-loaded plugins
            │   ├── nvim-lspconfig/
            │   ├── gruvbox/
            │   ├── vim-polyglot/
            │   └── vim-cpp-modern/
            └── opt/             # Optional plugins
                └── nerdtree/
```

## 🎯 Custom Configuration Summary

### **1. Basic Settings (lua/config/basic.lua)**

**Migrated from vimrc:**
- Line numbers: `set number`
- Tab settings: `tabstop=8`, `noexpandtab`
- Encoding: UTF-8, GB18030, GBK support
- Mouse support: `set mouse=a`
- Search: `hlsearch`, `incsearch`, `ignorecase`, `smartcase`
- Folding: Syntax-based, disabled by default
- File formats: Unix, DOS
- Leader key: `,`

**Performance optimizations:**
- Disabled unused built-in plugins
- `lazyredraw`, optimized timeouts
- `undofile` for persistent undo
- No swap files, backup disabled

### **2. Key Mappings (lua/config/mappings.lua)**

**Movement & Navigation:**
- `jj` → `ESC` (insert mode)
- `Ctrl+hjkl` → Window navigation
- `]b`/`[b` → Next/previous buffer
- `]t`/`[t` → Next/previous tab

**Window Management:**
- `<leader>wv` → Vertical split
- `<leader>ws` → Horizontal split
- `<leader>wq` → Close window
- `<leader>wo` → Close other windows

**Quick Actions:**
- `<leader>w` → Save file
- `<leader>q` → Quit nvim
- `<leader>x` → Close buffer
- `<leader>/` → Clear search highlights

**C/C++ Development:**
- `tt` → Toggle taglist (legacy from vimrc)

### **3. Autocommands (lua/config/autocmds.lua)**

**File Management:**
- Auto-save on focus lost/buffer leave
- Remove trailing whitespace on save
- Auto-create directories when saving
- Jump to last cursor position
- Highlight yanked text

**Filetype-Specific Settings:**
- **Python:** `tabstop=8`, `shiftwidth=4`, `expandtab=true`
- **C:** `tabstop=8`, `shiftwidth=8`, `noexpandtab`
- **C++:** Same as C, with `//` comments
- **Make:** No expandtab, 8-space tabs
- **Lua/YAML/JSON:** 2-space indentation
- **Markdown:** Word wrap, 2-space indentation

**Kernel Development:**
- Auto-detect kernel source trees
- Set appropriate indentation for kernel code

### **4. Plugin Management (lua/config/plugins.lua)**

**Essential Plugins:**
- **nvim-lspconfig** - LSP client configuration
- **gruvbox** - Dark color scheme
- **vim-polyglot** - Enhanced syntax highlighting
- **vim-cpp-modern** - Improved C++ syntax
- **nerdtree** - File explorer (optional)

### **5. LSP Configuration (lua/config/plugin_lsp.lua)**

**Linux Kernel Support:**
- clangd LSP server with kernel-specific flags
- Auto-detection of kernel source trees
- compile_commands.json support
- Architecture-specific include paths
- Kernel defines: `-DKERNEL`, `-D__KERNEL__`

**LSP Features:**
- `gd` → Go to definition
- `gr` → Find references
- `K` → Hover information
- `<leader>ca` → Code actions
- `<leader>cr` → Rename symbol
- `[d`/`]d` → Navigate diagnostics

### **6. Ctags Alternative (lua/config/ctags.lua)**

**Navigation (alternative to cscope):**
- `Ctrl+]` → Jump to tag definition
- `Ctrl+t` → Go back in tag stack
- `<leader>tg` → Go to definition
- `<leader>tp` → Go back
- `<leader>tl` → List all tags

**Search Features:**
- `<leader>fr` → Find references (uses ripgrep if available)
- `<leader>fd` → Find definitions
- `<leader>fc` → Find function calls

## 🎮 Available Commands

### **LSP Commands:**
- `:LspInfo` - Show LSP server information
- `:LspKernelSetup` - Configure kernel LSP
- `:LspKernelStatus` - Show kernel LSP status
- `:LspCompileCommands` - Create compile_commands.json

### **Plugin Commands:**
- `:NERDTree` - Open file explorer
- `:TagsGenerate` - Generate ctags
- `:TagsShow` - Show tag stack

### **Navigation Commands:**
- `:tag <name>` - Jump to tag
- `:tselect` - Select from multiple tags

## 🚀 Workflow for Linux Kernel Development

### **Initial Setup:**
1. `cd /home/luke/workspace/linux`
2. `nvim` (plugins auto-install on first run)
3. `:LspKernelSetup` (generates compile_commands.json)

### **Daily Development:**
- Open kernel files → LSP auto-activates
- Use `gd` to jump to function definitions
- Use `gr` to find all references
- Use `<leader>fr` to search for function usage
- Use `:LspKernelStatus` to check configuration

### **Alternative Navigation (if LSP fails):**
- Generate tags: `:TagsGenerate`
- Navigate: `<leader>tg` (go to def), `<leader>fr` (find refs)

## 🎨 Colorscheme

- **Primary:** Gruvbox (dark theme)
- **Fallback:** Default with custom highlights
- **Auto-selected:** Based on plugin availability

## 🔧 Customization

### **Add New Key Mappings:**
Edit `lua/config/mappings.lua`:
```lua
utils.map('n', '<leader>h', '<cmd>help<CR>')
```

### **Add New Autocmds:**
Edit `lua/config/autocmds.lua`:
```lua
utils.autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    vim.opt_local.expandtab = true
  end
})
```

### **Add New Plugins:**
Edit `lua/config/plugins.lua`:
```lua
{
  url = 'https://github.com/plugin/repo',
  name = 'plugin-name'
}
```

## 📊 Migration Summary

**From vimrc:**
- ✅ All basic settings migrated
- ✅ All key mappings preserved
- ✅ All autocmds converted to Lua
- ✅ Filetype-specific settings maintained
- ✅ Leader key preserved (`,`)

**Enhancements Added:**
- ✅ Modern Lua configuration
- ✅ Plugin management system
- ✅ LSP support for kernel development
- ✅ Better search capabilities
- ✅ Performance optimizations
- ✅ Better error handling

## 🚀 Features

- **Fast startup** - Minimal, optimized configuration
- **Kernel-aware** - Specific settings for Linux kernel development
- **Plugin-free** - Works without any external plugins if needed
- **Modern** - Uses Lua API instead of deprecated Vimscript
- **Organized** - Clean, modular structure