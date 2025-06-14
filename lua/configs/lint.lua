local lint = require "lint"

local revive_config_path = vim.fn.getcwd() .. "/.revive.toml"

lint.linters.revive = {
  cmd = "revive",
  stdin = false,
  args = {
    "-config",
    revive_config_path,
    "./...",
  },
  ignore_exitcode = true,
  parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
    source = "revive",
  }),
}

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  python = { "pylint" },
  go = { "revive" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
