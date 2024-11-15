local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    python = { "black" },
    sql = { "sql-formatter" },
  },

  format_on_save = {
    timeout_ms = 500,
  },
}

require("conform").setup(options)
