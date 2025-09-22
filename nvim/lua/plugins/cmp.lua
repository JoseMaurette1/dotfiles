return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
    },
    event = "InsertEnter",
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- Set up transparency for completion menu
        vim.cmd('hi CmpItemAbbr guibg=NONE')
        vim.cmd('hi CmpItemAbbrMatch guibg=NONE')
        vim.cmd('hi CmpItemAbbrMatchFuzzy guibg=NONE')
        vim.cmd('hi CmpItemKind guibg=NONE')
        vim.cmd('hi CmpItemMenu guibg=NONE')
        vim.cmd('hi CmpItemAbbrDeprecated guibg=NONE')
        vim.cmd('hi CmpItemAbbrMatch guibg=NONE')
        vim.cmd('hi CmpItemAbbrMatchFuzzy guibg=NONE')
        vim.cmd('hi CmpItemKindText guibg=NONE')
        vim.cmd('hi CmpItemKindMethod guibg=NONE')
        vim.cmd('hi CmpItemKindFunction guibg=NONE')
        vim.cmd('hi CmpItemKindConstructor guibg=NONE')
        vim.cmd('hi CmpItemKindField guibg=NONE')
        vim.cmd('hi CmpItemKindVariable guibg=NONE')
        vim.cmd('hi CmpItemKindClass guibg=NONE')
        vim.cmd('hi CmpItemKindInterface guibg=NONE')
        vim.cmd('hi CmpItemKindModule guibg=NONE')
        vim.cmd('hi CmpItemKindProperty guibg=NONE')
        vim.cmd('hi CmpItemKindUnit guibg=NONE')
        vim.cmd('hi CmpItemKindValue guibg=NONE')
        vim.cmd('hi CmpItemKindEnum guibg=NONE')
        vim.cmd('hi CmpItemKindKeyword guibg=NONE')
        vim.cmd('hi CmpItemKindSnippet guibg=NONE')
        vim.cmd('hi CmpItemKindColor guibg=NONE')
        vim.cmd('hi CmpItemKindFile guibg=NONE')
        vim.cmd('hi CmpItemKindReference guibg=NONE')
        vim.cmd('hi CmpItemKindFolder guibg=NONE')
        vim.cmd('hi CmpItemKindEnumMember guibg=NONE')
        vim.cmd('hi CmpItemKindConstant guibg=NONE')
        vim.cmd('hi CmpItemKindStruct guibg=NONE')
        vim.cmd('hi CmpItemKindEvent guibg=NONE')
        vim.cmd('hi CmpItemKindOperator guibg=NONE')
        vim.cmd('hi CmpItemKindTypeParameter guibg=NONE')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end,
}
