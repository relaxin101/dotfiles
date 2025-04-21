M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require "catppuccin".setup {
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true
      }
      vim.cmd.colorscheme "catppuccin"
    end
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat'
    },
    config = function()
      require('leap').create_default_mappings()
    end
  },
}


return M
