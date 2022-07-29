local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- window motion
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>o", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>s", "<cmd>w<CR>", opts)
keymap("n", "<C-d>", "<cmd>bd<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", opts)

-- Bufferline
keymap("n", "[b", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "]b", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "cb", "<cmd>BufferLinePickClose<CR>", opts)
keymap("n", "gb", "<cmd>BufferLinePick<CR>", opts)
keymap("n", "cl", "<cmd>BufferLineCloseLeft<CR>", opts)
keymap("n", "cr", "<cmd>BufferLineCloseRight<CR>", opts)

-- Rust
keymap("n", "<leader>rt", "<cmd>RustToggleInlayHints<CR>", opts)
keymap("n", "<leader>rs", "<cmd>RustSetInlayHints<CR>", opts)
keymap("n", "<leader>rf", "<cmd>RustFmt<CR>", opts)
keymap("n", "<leader>rr", "<cmd>RustRun<CR>", opts)
