vim.keymap.set(
  "v",
  "<Leader>dg",
  "S)idbg!<Esc>",
  { 
    remap = true,
    desc = "Wrap selection in `dbg!`"
  }
)
vim.keymap.set(
  "n",
  "<Leader>dg",
  "?dbg!<Enter>d4llds)",
  {
    remap = true,
    desc = "remove surrounding `dbg!`"
  }
)


vim.keymap.set(
  "v",
  "<Leader>rf",
  "m`<Esc>`<i&<Esc>``l",
  { desc = "Add `&` before expression" }
)
vim.keymap.set(
  "n",
  "<Leader>rf",
  "m`Bi&<Esc>``l",
  { desc = "Add `&` before expression" }
)

vim.keymap.set(
  "v",
  "<Leader>dr",
  "m`<Esc>`<i*<Esc>``l",
  { desc = "Add `&` before expression" }
)
vim.keymap.set(
  "n",
  "<Leader>dr",
  "m`Bi*<Esc>``l",
  { desc = "Add `&` before expression" }
)

vim.keymap.set(
  "v",
  "<Leader>cl",
  "m`<Esc>`>a.clone()<Esc>``",
  { desc = "Add `&` before expression" }
)
vim.keymap.set(
  "n",
  "<Leader>cl",
  "m`ea.clone()<Esc>``",
  { desc = "Add `&` before expression" }
)

vim.keymap.set(
  "n",
  "<Leader>;",
  "m`A;<Esc>``",
  {desc = "Add semicolon to end of line"}
)
