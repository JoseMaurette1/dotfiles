return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()
	local builtin = require('telescope.builtin')
	
	-- Set up transparency for telescope
	vim.cmd('hi TelescopeNormal guibg=NONE')
	vim.cmd('hi TelescopeBorder guibg=NONE')
	vim.cmd('hi TelescopePromptNormal guibg=NONE')
	vim.cmd('hi TelescopePromptBorder guibg=NONE')
	vim.cmd('hi TelescopePromptTitle guibg=NONE')
	vim.cmd('hi TelescopePreviewTitle guibg=NONE')
	vim.cmd('hi TelescopeResultsTitle guibg=NONE')
	vim.cmd('hi TelescopeSelection guibg=NONE')
	vim.cmd('hi TelescopeSelectionCaret guibg=NONE')
	vim.cmd('hi TelescopeMultiSelection guibg=NONE')
	vim.cmd('hi TelescopePreviewNormal guibg=NONE')
	vim.cmd('hi TelescopePreviewBorder guibg=NONE')
	vim.cmd('hi TelescopeResultsNormal guibg=NONE')
	vim.cmd('hi TelescopeResultsBorder guibg=NONE')
	
	-- Configure telescope with dropdown theme
	require('telescope').setup({
		defaults = {
			layout_config = {
				width = 0.8,
				height = 0.8,
			},
			border = true,
			borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			color_devicons = true,
			use_less = true,
			set_env = { ['COLORTERM'] = 'truecolor' },
		},
		pickers = {
			find_files = {},
			live_grep = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
			},
			buffers = {},
			help_tags = {},
		},
	})
	
	local themes = require('telescope.themes')
	
	vim.keymap.set('n', '<leader>ff', function() builtin.find_files(themes.get_dropdown()) end, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(themes.get_dropdown()) end, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', function() builtin.buffers(themes.get_dropdown()) end, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', function() builtin.help_tags(themes.get_dropdown()) end, { desc = 'Telescope help tags' })
    end

}
