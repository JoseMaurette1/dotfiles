vim.opt.number = true
vim.opt.cursorline = true

-- Block cursor in insert mode
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Fix input delay for keybindings
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- Smooth scrolling
vim.opt.smoothscroll = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Yank feedback (visual flash when copying)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
  end,
})

-- Disable diagnostics for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})







