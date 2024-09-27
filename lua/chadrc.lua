-- @type ChadrcConfig
local M = {}

M.ui = {
  theme = "chadracula-evondev",
  transparency = true,
  statusline = {
    theme = "vscode_colored",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "██╗██╗   ██╗ █████╗ ███╗   ██╗    ██████╗  ██████╗ ██████╗  ██████╗ ██╗   ██╗",
      "██║██║   ██║██╔══██╗████╗  ██║    ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗██║   ██║",
      "██║║██╗ ██╔╝███████║██╔██╗ ██║    ██████╔╝██║   ██║██████╔╝██║   ██║║██╗ ██╔╝",
      "██║╚██║ ██║ ██╔══██║██║╚██╗██║    ██╔═══╝ ██║   ██║██╔═══╝ ██║   ██║╚██║ ██║ ",
      "██║ ╚████╔╝ ██║  ██║██║ ╚████║    ██║     ╚██████╔╝██║     ╚██████╔╝ ╚████╔╝ ",
      "╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝      ╚═════╝ ╚═╝      ╚═════╝   ╚═══╝  ",
    },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
}

M.mason = {
  pkgs = {
    "html",
    "ts_ls",
    "clangd",
    "eslint",
    "jsonls",
    "pyright",
    "prismals",
    "yamlls",
    "cssls",
  },
}

return M
