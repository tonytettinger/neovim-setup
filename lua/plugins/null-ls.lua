-- ~/.config/nvim/lua/plugins/null-ls.lua
return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- Existing formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,

        -- Adding ESLint for diagnostics, completion, and code actions
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end
          })
        end
      end,
    }

    -- Keymap for manual formatting
    vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format({ async = true }) end, {})
  end,
}

