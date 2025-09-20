return {
    'windwp/nvim-ts-autotag',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    ft = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
        'xml',
        'php',
        'markdown',
        'astro',
        'glimmer',
        'handlebars',
        'hbs'
    },
    config = function()
        require('nvim-ts-autotag').setup({
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = {
                    'html',
                    'javascript',
                    'typescript',
                    'javascriptreact',
                    'typescriptreact',
                    'svelte',
                    'vue',
                    'tsx',
                    'jsx',
                    'rescript',
                    'xml',
                    'php',
                    'markdown',
                    'astro',
                    'glimmer',
                    'handlebars',
                    'hbs'
                },
                skip_tags = {
                    'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input',
                    'link', 'meta', 'param', 'source', 'track', 'wbr'
                }
            }
        })
    end
}
