local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

local servers = {
  "html",
  "ts_ls",
  "clangd",
  "eslint",
  "jsonls",
  "pyright",
  "prismals",
  "cssls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {},
    settings = {},
  }

  if lsp == "ts_ls" then
    config.commands.OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
    vim.api.nvim_create_user_command("OrganizeImports", organize_imports, {})
  elseif lsp == "lua_ls" then
    config.settings.Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  elseif lsp == "pyright" then
    -- Конфигурация для Pyright
    config.settings = {
      pyright = {
        autoImportCompletion = true,
        typeCheckingMode = "strict",
        pythonVersion = "3.12",
      },
    }
  elseif lsp == "eslint" then
    config.cmd = { "vscode-eslint-language-server", "--stdio" }
  end

  lspconfig[lsp].setup(config)
end

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

local linters = {
  "black",
  "pylint",
  "eslint_d",
  "prettier",
  "stylua",
  "sql-formatter",
}

for _, linter in ipairs(linters) do
  require("mason").setup {
    ensure_installed = { linter },
  }
end
