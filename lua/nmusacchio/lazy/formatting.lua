return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        bash = { "shfmt" },
      },
      -- Disabled by default (can be toggled later)
      format_on_save = nil,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Toggle autoformat on save
    vim.keymap.set("n", "<leader>uf", function()
      if conform.format_on_save then
        conform.format_on_save = nil
        vim.notify("Autoformat on save: OFF", vim.log.levels.WARN)
      else
        conform.format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        }
        vim.notify("Autoformat on save: ON", vim.log.levels.INFO)
      end
    end, { desc = "Toggle autoformat on save" })
  end,
}
