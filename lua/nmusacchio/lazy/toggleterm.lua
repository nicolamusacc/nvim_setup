return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { mode = { "n", "t" }, "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    { mode = { "n", "t" }, "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
    { mode = { "n", "t" }, "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<cr>", desc = "Toggle vertical terminal" },
  },
  config = function()
    require("toggleterm").setup({
      -- Default terminal size
      size = 15,
      -- Open mapping (optional if you prefer leader keys)
      open_mapping = [[<C-t>]],
      -- Terminal appearance
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- Default direction
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 5,
      },
    })

    -- Optional: enable navigation between terminal & normal mode using Esc
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
