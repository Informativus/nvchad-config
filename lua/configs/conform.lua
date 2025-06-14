local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    python = { "black" },
    sql = { "sql_formatter" },
    go = { "goimports" },
  },

  format_on_save = {
    timeout_ms = 500,
  },
}

require("conform").setup(options)
