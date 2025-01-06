M = {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require "onedark".setup({
        transparent = true
      })
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {'numToStr/Comment.nvim', opts = {}},
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
    config = function ()
      require('leap').create_default_mappings()
    end
  },
  {
    'meatballs/notebook.nvim',
    config = function ()
      require('notebook').setup()
    end
  },
}


return M
