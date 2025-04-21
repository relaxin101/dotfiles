-- For filetype "lua" do the following configurations
local set = vim.opt_local
--set.shiftwidth = 2
--set.expandtab = true
set.smartindent = true
-- keymaps for only lua files
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { buffer = true })
vim.keymap.set("n", "<space>x", "<cmd>. lua<CR>", { buffer = true })
vim.keymap.set("v", "<space>x", ":lua<CR>", { buffer = true })
-- Treesitter customization if colors are ugly
-- -> Use :InspectTree to figure out what the token is called
--vim.cmd [[hi @function.builtin.lua guifg=yellow]]
