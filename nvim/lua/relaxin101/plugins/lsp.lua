return {
  -- look at :h ins-completion (specifically <C-X> <C-O>
  -- look at :h lsp
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
          -- Unset 'formatexpr'
          vim.bo[args.buf].formatexpr = nil
          -- Unset 'omnifunc'
          vim.bo[args.buf].omnifunc = nil
          -- Unmap K
          vim.keymap.del('n', 'K', { buffer = args.buf })
        end,
      })
    end
  }
}
