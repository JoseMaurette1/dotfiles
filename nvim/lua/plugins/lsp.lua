return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keybindings for LSP
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Go to definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        
        -- Go to declaration
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        
        -- Show hover information
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        
        -- Go to implementation
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        
        -- Show signature help
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        
        -- Rename symbol
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        
        -- Code action
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        
        -- Show references
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        
        -- Format document
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        
        -- Show diagnostics in floating window
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        
        -- Go to previous diagnostic
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        
        -- Go to next diagnostic
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end

      -- TypeScript/JavaScript LSP
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "typescript.tsx"
        },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
        capabilities = capabilities,
        on_attach = on_attach,
      }
      vim.lsp.enable("ts_ls")

      -- Lua LSP (for Neovim config editing)
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
      vim.lsp.enable("lua_ls")

      -- Suppress eslint's broken pull-diagnostics circular JSON crash
      vim.lsp.handlers["textDocument/diagnostic"] = function(err, result, ctx, config)
        if err then return end
        vim.lsp.diagnostic.on_diagnostic(err, result, ctx, config)
      end

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
