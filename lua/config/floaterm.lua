local g = vim.g

g.floaterm_width = 0.8
g.floaterm_height = 0.8


local toggle_modes = {'n', 't'}
local mappings = {
  { toggle_modes, '<M-i>', "<cmd>FloatermToggle<CR>", },
  { toggle_modes, '<M-t>', "<cmd>FloatermNew<CR>", },
  { toggle_modes, '<M-n>', "<cmd>FloatermNew<CR>", },
  { toggle_modes, '<M-p>', "<cmd>FloatermPrev<CR>", },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end