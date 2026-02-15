vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>", { desc = "Use jj to escape from insert mode", silent = true })
vim.keymap.set("i", "<CapsLock>", "<Esc>", { desc = "Use CapsLock to escape from insert mode", silent = true })

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

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal", silent = true })

-- OpenCode terminal (uses terminal ID 2)
vim.keymap.set("n", "<leader>c", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local opencode = Terminal:new({
    cmd = "opencode",
    direction = "float",
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })
  opencode:toggle()
end, { desc = "Toggle OpenCode", silent = true })

-- Legacy file explorer (netrw) - keeping as backup
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open netrw explorer" })

-- Theme switcher
local themes = { "zenbones", "mellifluous"}
local current_theme_index = 1

vim.keymap.set("n", "<leader>th", function()
    current_theme_index = current_theme_index % #themes + 1
    local theme = themes[current_theme_index]
    vim.cmd.colorscheme(theme)
    print("Switched to: " .. theme)
end, { desc = "Cycle through themes" })
