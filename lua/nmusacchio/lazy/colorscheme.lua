return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte", -- latte, frappe, macchiato, mocha
      transparent_background = false, -- set true for transparent background
      term_colors = true,
      no_italic = true,
      no_bold = false,
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
