local M = {}

M.setup = function()
  local SymbolKind = vim.lsp.protocol.SymbolKind

  require("lsp-lens").setup {
    enable = false,
    include_declaration = false,
    ignore_filetype = {
      "prisma",
      "markdown",
      "yaml",
      "toml",
      "json",
      "jsonc",
    },
    sections = {
      definition = false,
      references = true,
      implements = true,
      git_authors = false,
    },
    target_symbol_kinds = {
      SymbolKind.Function,
      SymbolKind.Method,
      SymbolKind.Interface,
    },
    wrapper_symbol_kinds = {
      SymbolKind.Class,
      SymbolKind.Struct,
    },
  }
end

return M
