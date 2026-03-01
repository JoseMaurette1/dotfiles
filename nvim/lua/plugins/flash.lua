return {
  -- Flash - enhanced motions and search
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash'
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter'
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash'
      },
    },
    config = function()
      require('flash').setup({
        labels = 'abcdefghijklmnopqrstuvwxyz',
        search = {
          mode = 'fuzzy',
        },
      })
    end,
  },
}
