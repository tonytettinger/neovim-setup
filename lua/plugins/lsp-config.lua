return {
  { "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
       ensure_installed = {"lua_ls", "tsserver", "eslint"}
      })
    end
},
  {"neovim/nvim-lspconfig",
     config = function()
     local lspconfig = require("lspconfig")
     local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Lua LS setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      -- TypeScript/JavaScript LS setup
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            format = {
              enable = true
            }
          },
          javascript = {
            format = {
              enable = true
            }
          },
          completions = {
            completeFunctionCalls = true
          }
        },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
      })

      -- ESLint setup
      lspconfig.eslint.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", "package.json", ".git"),
        settings = {
          format = {
            enable = true
          },
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine"
            },
            showDocumentation = {
              enable = true
            }
          },
        },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      })

     vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
     vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
     end
  }
}
