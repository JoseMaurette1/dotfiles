return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('zenbones')

			-- Define distinct colors for better syntax highlighting
			local red = '#E06C75'          -- Red for types
			local orange = '#D19A66'       -- Orange for functions/keywords
			local yellow = '#E5C07B'       -- Yellow for constants/numbers
			local grey = '#ABB2BF'         -- Grey for variables/strings
			local purple = '#C678DD'       -- Purple for booleans/operators
			local muted_grey = '#7D8590'   -- Muted grey for properties/less important

			-- Use autocmd to ensure colors persist
			vim.api.nvim_create_autocmd('ColorScheme', {
				pattern = 'zenbones',
				callback = function()
					-- Treesitter highlights for better syntax differentiation
					vim.api.nvim_set_hl(0, '@keyword', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@keyword.function', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@keyword.conditional', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@keyword.repeat', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@keyword.operator', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@keyword.return', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@type', { fg = red })
					vim.api.nvim_set_hl(0, '@function', { fg = orange })
					vim.api.nvim_set_hl(0, '@function.call', { fg = orange })
					vim.api.nvim_set_hl(0, '@constant', { fg = yellow })
					vim.api.nvim_set_hl(0, '@variable', { fg = grey })
					vim.api.nvim_set_hl(0, '@parameter', { fg = orange })
					vim.api.nvim_set_hl(0, '@include', { fg = orange })
					vim.api.nvim_set_hl(0, '@string', { fg = grey })
					vim.api.nvim_set_hl(0, '@boolean', { fg = purple })
					vim.api.nvim_set_hl(0, '@operator', { fg = purple })
					vim.api.nvim_set_hl(0, '@punctuation', { fg = grey })
					vim.api.nvim_set_hl(0, '@number', { fg = yellow })
					vim.api.nvim_set_hl(0, '@method', { fg = orange })
					vim.api.nvim_set_hl(0, '@property', { fg = muted_grey })

					-- Markdown heading highlighting
					vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = red, bold = true })
					vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = purple, bold = true })
					vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = orange, bold = true })
					vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = yellow, bold = true })
					vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = muted_grey, bold = true })
					vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = grey, bold = true })

					-- Fix nvim-tree highlighting issues
					vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = 'NONE' })
					vim.api.nvim_set_hl(0, 'NvimTreeHighlight', { bg = 'NONE' })
					vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
				end,
			})

			-- Apply colors immediately
			vim.api.nvim_set_hl(0, '@keyword', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@keyword.function', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@keyword.conditional', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@keyword.repeat', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@keyword.operator', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@keyword.return', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@type', { fg = red })
			vim.api.nvim_set_hl(0, '@function', { fg = orange })
			vim.api.nvim_set_hl(0, '@function.call', { fg = orange })
			vim.api.nvim_set_hl(0, '@constant', { fg = yellow })
			vim.api.nvim_set_hl(0, '@variable', { fg = grey })
			vim.api.nvim_set_hl(0, '@parameter', { fg = orange })
			vim.api.nvim_set_hl(0, '@include', { fg = orange })
			vim.api.nvim_set_hl(0, '@string', { fg = grey })
			vim.api.nvim_set_hl(0, '@boolean', { fg = purple })
			vim.api.nvim_set_hl(0, '@operator', { fg = purple })
			vim.api.nvim_set_hl(0, '@punctuation', { fg = grey })
			vim.api.nvim_set_hl(0, '@number', { fg = yellow })
			vim.api.nvim_set_hl(0, '@method', { fg = orange })
			vim.api.nvim_set_hl(0, '@property', { fg = muted_grey })

			-- Markdown heading highlighting
			vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = red, bold = true })
			vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = purple, bold = true })
			vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = orange, bold = true })
			vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = yellow, bold = true })
			vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = muted_grey, bold = true })
			vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = grey, bold = true })

			-- Fix nvim-tree highlighting issues
			vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = 'NONE' })
			vim.api.nvim_set_hl(0, 'NvimTreeHighlight', { bg = 'NONE' })
			vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
		end,
	},
}
