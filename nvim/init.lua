require"relaxin101"

--- testing shit

-------------- Quickfix
local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, opts)

--local api = require "nvim-tree.api"
vim.keymap.set('n', '<leader>ft',':NvimTreeToggle<cr>', opts)
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
