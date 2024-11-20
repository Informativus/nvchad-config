local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local function setup_lsp_config(lsp, config)
  if lsp == "ts_ls" or lsp == "typescript-language-server" then
    config.commands = {
      OrganizeImports = {
        function()
          local params = {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = "",
          }
          vim.lsp.buf.execute_command(params)
        end,
        description = "Organize Imports",
      },
    }
    vim.api.nvim_create_user_command("OrganizeImports", config.commands.OrganizeImports[1], {})
  elseif lsp == "lua_ls" then
    config.settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    }
  elseif lsp == "pyright" then
    config.settings = {
      python = {
        analysis = {
          autoImportCompletion = true,
          typeCheckingMode = "strict",
        },
      },
    }
  elseif lsp == "eslint" then
    config.cmd = { "vscode-eslint-language-server", "--stdio" }
  elseif lsp == "sqlls" then
    config.settings = {
      sql = {
        completion = {
          enabled = true,
        },
        format = {
          enabled = true,
          provider = "sql-formatter",
        },
      },
    }
  elseif lsp == "yamlls" then
    config.settings = {
      yaml = {
        schemas = {
          kubernetes = "/*.yaml",
        },
      },
    }
  elseif lsp == "dockerls" or lsp == "dockerfile-language-server" then
    config.filetypes = { "dockerfile" }
  elseif lsp == "graphql" then
    config.filetypes = { "graphql", "gql", "js", "ts" }
  end
end

local servers = {
  "html",
  "ts_ls",
  "clangd",
  "eslint",
  "jsonls",
  "lua_ls",
  "pyright",
  "prismals",
  "cssls",
  "yamlls",
  "dockerls",
  "graphql",
  "sqlls",
}

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {},
    settings = {},
  }
  setup_lsp_config(lsp, config)
  lspconfig[lsp].setup(config)
end

require("mason").setup {
  ensure_installed = {
    "black",
    "pylint",
    "eslint_d",
    "prettier",
    "stylua",
    "sql-formatter",
    "yamllint",
  },
}
