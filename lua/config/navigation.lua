-- navigation tools

vim.defer_fn(function()
  -- Setup cscope_maps.nvim if available
  local ok, cscope_maps = pcall(require, 'cscope_maps')
  if ok then
    cscope_maps.setup({
      disable_maps = false,  -- Enable default keymaps
      skip_input_prompt = false,
      prefix = "<Leader>c",  -- Leader-c prefix for cscope commands

      -- Database settings
      db_file = "./cscope.out",
      db_root = vim.fn.getcwd(),
    })

    print('cscope_maps.nvim loaded with database')
    -- Auto-add cscope database if present
    if vim.fn.filereadable('cscope.out') == 1 then
      vim.cmd('Cscope add cscope.out')
      print('cscope available - use <Leader>cs (symbol), <Leader>cg (global), <Leader>cc (calls), <Leader>cd (definition)')
    else
      print('cscope_maps.nvim loaded - no cscope database')
    end

  elseif vim.fn.executable('ctags') == 1 then
    -- Fallback to ctags if cscope_maps not available
    vim.opt.tags = './tags;'
    print('ctags available - use <C-]> to jump, <C-t> to return')
  end

  -- LSP with native vim.lsp.config if clangd available
  if vim.fn.executable('clangd') == 1 then
    vim.defer_fn(function()
      vim.lsp.config('clangd', {
        cmd = { 'clangd' },
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	  vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	  vim.keymap.set({ "n", "v" }, "<leader>f", function()
		  vim.lsp.buf.format({ async = true })
	  end, opts)
        end,
        -- capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities()
      })
      vim.lsp.enable('clangd')
      print('LSP configured with clangd')

      require'cmp'.setup {
        sources = {
          { name = 'nvim_lsp' }
        }
      }
    end, 1000)
  end
end, 500)
