vim.opt.number = true
-- vim.opt.cursorline = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Fix input delay for keybindings
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- Disable diagnostics for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})







