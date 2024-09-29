return {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v4.x',
      lazy = true,
      config = false,
    },
    {
      'williamboman/mason.nvim',
      lazy = false,
      config = true,
    },
  
    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        {'L3MON4D3/LuaSnip'},
      },
    },
  
    -- LSP
    {
      'neovim/nvim-lspconfig',
      cmd = {'LspInfo', 'LspInstall', 'LspStart'},
      event = {'BufReadPre', 'BufNewFile'},
      dependencies = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
      },
      config = function()
        local lsp_zero = require('lsp-zero')
  
        -- lsp_attach is where you enable features that only work
        -- if there is a language server active in the file
        local lsp_attach = function(client, bufnr)
          local opts = {buffer = bufnr}
  
          local map = vim.keymap.set
          map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts , {desc = 'Show documentation'})
          map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts , {desc = 'Goto definition'})
          map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts, {desc = 'Goto declaration'})
          map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts, {desc = 'Goto implementation'})
          map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts, {desc = 'Goto type definition'})
          map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts, {desc = 'Show all references'})
          map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts, {desc = 'Show signature help'})
          map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts, {desc = 'Rename all references'})
          map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts, {desc = 'Format file'})
          map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts, {desc = 'Code action'})
        end
  
        lsp_zero.extend_lspconfig({
          sign_text = true,
          lsp_attach = lsp_attach,
          capabilities = require('cmp_nvim_lsp').default_capabilities()
        })
  
        require('mason-lspconfig').setup({
          ensure_installed = {},
          handlers = {
            -- this first function is the "default handler"
            -- it applies to every language server without a "custom handler"
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          }
        })
      end
    }
  }