local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window motion
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-q>", "<C-w>o", opts)

-- Splits
map("n", "<leader>vs", "<C-w>v", opts)
map("n", "<leader>hs", "<C-w>s", opts)

-- Indent in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Misc
map("i", "jk", "<ESC>", opts)
map("n", "<leader>s", "<cmd>w<CR>", opts)
map("n", "<C-a>", "gg<S-v>G", opts)
