return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>sf", builtin.find_files)
      vim.keymap.set("n", "<space>sh", builtin.help_tags)
      vim.keymap.set("n", "<space>so", builtin.builtin)
      vim.keymap.set("n", "<space>sc", function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath('config')
        })
        require('telescope.builtin').find_files(opts)
      end)
      vim.keymap.set("n", "<space>sp", function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
        })
        require('relaxin101.telescope.multigrep').setup(opts)
      end)
    end,
  },
}
