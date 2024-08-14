return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false, -- Show hidden files
            hide_by_name = {
              -- Example: add more files or directories to hide by name
              -- '.git',
              -- 'node_modules',
            },
            hide_by_pattern = {
              -- Example: hide files matching a pattern
              -- '*.meta',
            },
            always_show = {
              -- Example: force display of specific files regardless of other settings
              -- '.gitignore',
            },
            never_show = {
              -- Example: hide specific files or directories regardless of other settings
              -- 'thumbs.db',
              -- '.DS_Store',
            },
          },
        },
        event_handlers = {
          {
            event = 'file_open_requested',
            handler = function()
              require('neo-tree.command').execute { action = 'close' }
            end,
          },
        },
        window = {
          mappings = {
            ['y'] = function(state)
              local node = state.tree:get_node()
              local filepath = node.path
              local filename = node.name
              -- Copy the filename to the clipboard
              vim.fn.setreg('+', filename)
              vim.notify('Copied filename: ' .. filename)
            end,
            ['Y'] = function(state)
              local node = state.tree:get_node()
              local filepath = node.path
              -- Copy the full path to the clipboard
              vim.fn.setreg('+', filepath)
              vim.notify('Copied path: ' .. filepath)
            end,
          },
        },
      }
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>', {})
    end,
  },
}
