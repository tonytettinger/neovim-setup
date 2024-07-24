return {
  {"nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
          autotag = { enable = true }, -- Enable nvim-ts-autotag
        })
    end
  },

  -- Auto-close tags in JSX/HTML
  { 'windwp/nvim-ts-autotag', config = function()
      require('nvim-ts-autotag').setup()
    end }
}

