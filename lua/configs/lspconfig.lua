local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

vim.api.nvim_create_autocmd("BufWritePre", { command = "OrganizeImports" })

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
  "tsserver",
  "clangd",
  "eslint",
  "jsonls",
  "pylsp",
  "prismals",
  "cssls",
}

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {},
    settings = {},
  }

  if lsp == "tsserver" then
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
  elseif lsp == "pylsp" then
    config.settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            maxLineLength = 88,
          },
        },
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
