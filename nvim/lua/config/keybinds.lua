vim.g.mapleader = " "

-- File explorer (nvim-tree)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Legacy file explorer (netrw) - keeping as backup
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open netrw explorer" })
