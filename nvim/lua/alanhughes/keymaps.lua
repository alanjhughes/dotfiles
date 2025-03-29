local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- window motion
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>o", opts)

keymap("n", "<leader>vs", "<C-w>v", opts)
keymap("n", "<leader>hs", "<C-w>s", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>s", "<cmd>w<CR>", opts)
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", opts)

-- trouble
keymap("n", "<leader>xx", "<cmd>Trouble<CR>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<CR>", opts)

-- Bufferline
keymap("n", "[b", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "]b", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "cb", "<cmd>BufferLinePickClose<CR>", opts)
keymap("n", "gb", "<cmd>BufferLinePick<CR>", opts)
keymap("n", "cl", "<cmd>BufferLineCloseLeft<CR>", opts)
keymap("n", "cr", "<cmd>BufferLineCloseRight<CR>", opts)
keymap("n", "co", "<cmd>BufferLineCloseOthers<CR>", opts)
keymap("n", "bd", "<cmd>bdelete<CR>", opts)

-- Cargo
keymap("n", "<leader>cr", "<cmd>Crun<CR>", opts)
keymap("n", "<leader>cb", "<cmd>Cbuild<CR>", opts)
