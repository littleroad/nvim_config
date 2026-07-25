# Neovim Configuration

## Structure

```
~/.config/nvim/
├── init.lua                     # Entry point: require order matters
├── stylua.toml                  # Formatter config
├── lua/
│   ├── plugins.lua              # Thin packer aggregator
│   └── config/
│       ├── basic.lua            # Editor options, leader, builtins
│       ├── mappings.lua         # Global keymaps
│       └── code_intelligence.lua # LSP, cscope, ctags, Tagbar
```

## Load Order

`init.lua` requires in sequence:
1. `config.basic` — options, leader, disabled builtins
2. `config.mappings` — global keymaps (window, buffer, terminal)
3. `plugins` — packer pins (calls `code_intelligence.pack()`)
4. `config.code_intelligence` — calls `setup()` for FileType activation

## Modules

### basic.lua
- Editor options (tabs, search, scroll, fold)
- `foldenable = false` by default
- Disabled built-in plugins (netrw, gzip, etc.)
- Leader: `,`

### mappings.lua
- `jj` → ESC (insert)
- `Ctrl+hjkl` → window nav
- `]b`/`[b` → buffer nav
- `]t`/`[t` → tab nav
- `<leader>w*` → window splits/close
- `<leader>w` → save, `<leader>q` → quit, `<leader>x` → close buffer

### code_intelligence.lua
- FileType activation for `c`, `cpp`, `objc`, `cuda`, etc.
- **Backends**: clangd (LSP) + cscope (index) + ctags (fallback)
- **LSP maps** (buffer-local): `gd`, `gr`, `gD`, `gi`, `K`, `rn`, `<leader>ca`, `<leader>f`
- **Tagbar**: `tt` to toggle
- **cscope**: `<Leader>c` prefix (via cscope_maps.nvim)

### plugins.lua
Chrome only — feature-owned pins live in their modules:
- `wbthomason/packer.nvim`
- `tomasr/molokai` (colorscheme)
- `tpope/vim-fugitive` (git)
- `code_intelligence.pack(use)` → tagbar, cscope_maps

## Keymaps Reference

| Key | Mode | Action |
|-----|------|--------|
| `jj` | i | ESC |
| `Ctrl+hjkl` | n | Window nav |
| `]b`/`[b` | n | Buffer nav |
| `tt` | n | Tagbar toggle |
| `<leader>w` | n | Save |
| `<leader>q` | n | Quit |
| `<leader>x` | n | Close buffer |
| `<leader>/` | n | Clear search |
| `gd` | n | LSP definition |
| `gr` | n | LSP references |
| `K` | n | LSP hover |
| `rn` | n | LSP rename |
| `<leader>ca` | n | Code action |
| `<leader>f` | n,v | LSP format |
| `<Leader>cs` | n | cscope symbol |
| `<Leader>cg` | n | cscope global |
| `<Leader>cc` | n | cscope calls |
| `<Leader>cd` | n | cscope definition |
