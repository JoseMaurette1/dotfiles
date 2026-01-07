return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"ramojus/mellifluous.nvim",
		config = function()
			-- Set default theme on startup
			vim.cmd.colorscheme("mellifluous")
		end,
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = 'auto',
		}
	},
}
