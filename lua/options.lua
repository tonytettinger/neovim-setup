--vim.api.nvim_set_option("clipboard", "unnamed")
vim.cmd 'set expandtab'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
vim.g.mapleader = ' '

--vim.keymap.set({'v', 's','n'}, '<c-i>', ':wincmd i<CR>')
--vim.keymap.set({'v', 's','n'}, '<c-j>', ':wincmd j<CR>')
--vim.keymap.set({'v', 's','n'}, '<c-k>', ':wincmd k<CR>')
--vim.keymap.set({'v', 's','n'}, '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dP', { noremap = true, silent = true })
-- In your Neovim configuration file (e.g., init.lua)
vim.keymap.set('n', '<leader>g', 'ggVG', { noremap = true, silent = true })

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Disable default tmux-navigator mappings
vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_exec(
  [[
function! OpenInChrome()
  let l:file = expand('%:p')
  call system('open -a "Google Chrome" ' . l:file)
endfunction

command! OpenChrome call OpenInChrome()
]],
  false
)

vim.api.nvim_set_keymap('n', '<leader>oc', ':OpenChrome<CR>', { noremap = true, silent = true })
