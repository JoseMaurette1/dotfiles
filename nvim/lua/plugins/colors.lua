return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('zenbones')

			-- Apply mellifluous colors to zenbones after colorscheme loads
			local mel_red = '#D88860'      -- Red from mellifluous
			local mel_brown = '#D4D4A8'    -- Brown/Khaki from mellifluous
			local mel_yellow = '#E8E6B8'   -- Yellow from mellifluous (for strings)

			-- Use autocmd to ensure colors persist
			vim.api.nvim_create_autocmd('ColorScheme', {
				pattern = 'zenbones',
				callback = function()
					-- Override syntax highlighting groups
					vim.api.nvim_set_hl(0, 'Keyword', { fg = mel_red, bold = true })
					vim.api.nvim_set_hl(0, 'Type', { fg = mel_brown })
					vim.api.nvim_set_hl(0, 'Function', { fg = mel_red })
					vim.api.nvim_set_hl(0, 'Constant', { fg = mel_brown })
					vim.api.nvim_set_hl(0, 'Identifier', { fg = mel_red })
					vim.api.nvim_set_hl(0, 'Statement', { fg = mel_red })
					vim.api.nvim_set_hl(0, 'Include', { fg = mel_brown }) -- imports
					vim.api.nvim_set_hl(0, 'String', { fg = mel_yellow }) -- quoted strings
					vim.api.nvim_set_hl(0, '@keyword', { fg = mel_red, bold = true })
					vim.api.nvim_set_hl(0, '@type', { fg = mel_brown })
					vim.api.nvim_set_hl(0, '@function', { fg = mel_red })
					vim.api.nvim_set_hl(0, '@constant', { fg = mel_brown })
					vim.api.nvim_set_hl(0, '@include', { fg = mel_brown }) -- treesitter imports
					vim.api.nvim_set_hl(0, '@string', { fg = mel_yellow }) -- treesitter strings

					-- Fix nvim-tree highlighting issues
					vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = 'NONE' })
					vim.api.nvim_set_hl(0, 'NvimTreeHighlight', { bg = 'NONE' })
					vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
				end,
			})

			-- Apply colors immediately
			vim.api.nvim_set_hl(0, 'Keyword', { fg = mel_red, bold = true })
			vim.api.nvim_set_hl(0, 'Type', { fg = mel_brown })
			vim.api.nvim_set_hl(0, 'Function', { fg = mel_red })
			vim.api.nvim_set_hl(0, 'Constant', { fg = mel_brown })
			vim.api.nvim_set_hl(0, 'Identifier', { fg = mel_red })
			vim.api.nvim_set_hl(0, 'Statement', { fg = mel_red })
			vim.api.nvim_set_hl(0, 'Include', { fg = mel_brown }) -- imports
			vim.api.nvim_set_hl(0, 'String', { fg = mel_yellow }) -- quoted strings
			vim.api.nvim_set_hl(0, '@keyword', { fg = mel_red, bold = true })
			vim.api.nvim_set_hl(0, '@type', { fg = mel_brown })
			vim.api.nvim_set_hl(0, '@function', { fg = mel_red })
			vim.api.nvim_set_hl(0, '@constant', { fg = mel_brown })
			vim.api.nvim_set_hl(0, '@include', { fg = mel_brown }) -- treesitter imports
			vim.api.nvim_set_hl(0, '@string', { fg = mel_yellow }) -- treesitter strings

			-- Fix nvim-tree highlighting issues
			vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = 'NONE' })
			vim.api.nvim_set_hl(0, 'NvimTreeHighlight', { bg = 'NONE' })
			vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
		end,
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
