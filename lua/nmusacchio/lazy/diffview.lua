
-- ~/.config/nvim/lua/plugins/diffview.lua
return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- highlight moved lines
      use_icons = true,        -- requires nvim-web-devicons
      icons = {                -- only override the icons you want
        folder_closed = "",
        folder_open = "",
      },
    })
  end,
}
