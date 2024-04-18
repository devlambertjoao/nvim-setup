return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  event = { "VeryLazy" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- Ruby
        null_ls.builtins.formatting.rubocop,
        -- JS
        null_ls.builtins.formatting.prettierd,
      },
    })

    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "rubocop",
        "prettierd",
      },
    })
  end,
}
