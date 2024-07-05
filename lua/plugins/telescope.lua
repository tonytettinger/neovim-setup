return {'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fr', builtin.current_buffer_fuzzy_find, {})
    end 
  }               