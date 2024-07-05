return {
    'nvim-lualine/lualine.nvim',
    name = "lualine",
    config = function()
      local configs = require('lualine')
      configs.setup({
        theme="dracula"
      })
    end
}
