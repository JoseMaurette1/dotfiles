vim.g.mapleader = " "

-- File explorer (nvim-tree)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer", silent = true })
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Find current file in explorer", silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer", silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer", silent = true })

-- Window navigation
-- Quick navigation to file tree
vim.keymap.set("n", "<C-h>", function()
  -- If we're already in nvim-tree, move to the last accessed window
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd p')  -- Go to previous window
  else
    vim.cmd('NvimTreeFocus')  -- Focus file tree
  end
end, { desc = "Focus file tree or return to editor", silent = true })

-- Additional window navigation (optional)
vim.keymap.set("n", "<C-l>", function()
  -- If we're in nvim-tree, move to the editor window
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd p')  -- Go to previous window (editor)
  else
    vim.cmd('wincmd l')  -- Move to right window
  end
end, { desc = "Move to right window or editor from file tree", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above", silent = true })

-- Legacy file explorer (netrw) - keeping as backup
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open netrw explorer" })
