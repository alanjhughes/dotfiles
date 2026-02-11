return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      update_debounce = 100,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end)

        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end)
        map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hb", ":Gitsigns blame_line<CR>")
        map("v", "<leader>hb", ":Gitsigns blame_line<CR>")
        map("n", "<leader>td", gs.toggle_deleted)
        map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
}
