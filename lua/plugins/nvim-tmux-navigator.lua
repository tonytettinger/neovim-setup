return {
    'christoomey/vim-tmux-navigator',
    vim.keymap.set('n', 'C-j', ':TmuxNavigateLeft<CR>'),
    vim.keymap.set('n', 'C-l', ':TmuxNavigateUp<CR>'),
    vim.keymap.set('n', 'C-k', ':TmuxNavigateDown<CR>'),
    vim.keymap.set('n', 'C-;', ':TmuxNavigateRight<CR>')
  }

