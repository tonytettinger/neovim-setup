return {
  -- Mason for LSP server management
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- Mason LSP config for managing LSP installations
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'tsserver', 'eslint' },
      }
    end,
  },

  -- LSP config
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Lua LS setup
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- TypeScript/JavaScript LS setup
      lspconfig.tsserver.setup {
        capabilities = capabilities,
        settings = {
          typescript = {
            format = {
              enable = true,
            },
          },
          javascript = {
            format = {
              enable = true,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
        filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
      }

      -- ESLint setup
      lspconfig.eslint.setup {
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', '.eslintrc.yaml', '.eslintrc.yml', 'package.json', '.git'),
        settings = {
          format = {
            enable = true,
          },
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = 'separateLine',
            },
            showDocumentation = {
              enable = true,
            },
          },
        },
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
      }
      -- Function to yank diagnostic error to system clipboard
      function YankDiagnosticError()
        vim.diagnostic.open_float() -- Open the floating window with the diagnostic message
        vim.diagnostic.open_float() -- Ensure the floating window is refreshed
        local win_id = vim.fn.win_getid() -- Get the window ID of the floating window
        vim.cmd 'normal! j' -- Move down one row
        vim.cmd 'normal! VG' -- Select everything from that row down
        vim.cmd 'normal! "+y' -- Yank selected text to the system clipboard
        vim.api.nvim_win_close(win_id, true) -- Close the floating window by its ID
      end

      -- Map the function to a key combination
      vim.api.nvim_set_keymap('n', '<leader>e', [[:lua YankDiagnosticError()<CR>]], { noremap = true, silent = true, desc = 'Copy error' })

      -- Key mappings for LSP actions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true, desc = 'Rename symbol' })
    end,
  },

  -- Autocompletion setup
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require 'cmp'
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        }),
      }

      -- Use buffer source for `/`
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' },
        },
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
    end,
  },
}
