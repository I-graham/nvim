local map = vim.keymap.set

map({ 'n', 'v', 'i' }, '<C-[>', '<Esc>')
map('i', 'jk', '<ESC>')

vim.keymap.set('n', ',', ';')
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<M-J>', '<Cmd>m+1<CR>')
vim.keymap.set('n', '<M-K>', '<Cmd>m-2<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('c', '<CR>', function()
  return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>'
end, { expr = true })

vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'gj', 'j')
vim.keymap.set('i', '<C-j>', '<C-o>gj')
vim.keymap.set('n', '<C-o>', '<C-o>zz')

vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
vim.keymap.set({ 'n', 'v' }, 'gk', 'k')
vim.keymap.set('i', '<C-k>', '<C-o>gk')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

vim.keymap.set({ 'n', 'v' }, '<M-j>', '<cmd>cnext<CR>zz')
vim.keymap.set({ 'n', 'v' }, '<M-k>', '<cmd>cprev<CR>zz')
vim.keymap.set({ 'n', 'v' }, '<M-d>', vim.diagnostic.setqflist, { desc = 'Open diagnostics in Quickfix' })

vim.opt.clipboard = ''
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, 'd', [["_d]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set({ 'n', 'v' }, 'dd', [["_dd]])
vim.keymap.set({ 'n', 'v' }, 'dd', [["_dd]])

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<CR>')

-- Paste without copying
vim.keymap.set('x', '<leader>P', [["_dP]])
vim.keymap.set({ 'n', 'x' }, '<leader>p', [["+p]])

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

map("n", "<Leader>tkm", "<cmd>lua vim.cmd('Telescope keymaps')<CR>")

-- Projects:
vim.keymap.set('n', '<leader>cd', '<cmd>CdProject<CR>')

-- Tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- Leap
map({ 'n', 'x', 'o' }, 'f', '<Plug>(leap)')
map({ 'n', 'x', 'o' }, '<leader>f', 'f')
