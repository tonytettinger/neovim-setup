return {
  {
    'MaximilianLloyd/ascii.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local ascii = require 'ascii'

      local dashboard = require 'alpha.themes.dashboard'
      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#4682b4' })
      dashboard.section.header.opts.hl = 'DashboardHeader' -- Apply the custom highlight group

      dashboard.section.header.val = ascii.art.text.neovim.ogre

      dashboard.section.buttons.val = {
        dashboard.button('r', '  Recently opened files', ':Telescope oldfiles<CR>'),
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep<CR>'),
        dashboard.button('b', '  Bookmarks', ':Telescope marks<CR>'),
        dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua<CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      }

      dashboard.section.footer.val = 'Happy coding, Tony!'

      alpha.setup(dashboard.opts)
      -- Custom command to open dashboard
      vim.api.nvim_create_user_command('Dashboard', function()
        alpha.start(false, require('alpha').default_config)
      end, {})

      -- Keybinding to open dashboard
      vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })
    end,
  },
}
