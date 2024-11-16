local M = {}

local create_new_file = "lua require('configs.nuiNewFilePopup').create_file_modal()"
M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
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
  Normal = { bg = "none" },
  NormalFloat = { bg = "none" },
  FloatBorder = { bg = "none" },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "██╗██╗   ██╗ █████╗ ███╗   ██╗    ██████╗  ██████╗ ██████╗  ██████╗ ██╗   ██╗",
    "██║██║   ██║██╔══██╗████╗  ██║    ██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗██║   ██║",
    "██║║██╗ ██╔╝███████║██╔██╗ ██║    ██████╔╝██║   ██║██████╔╝██║   ██║║██╗ ██╔╝",
    "██║╚██║ ██║ ██╔══██║██║╚██╗██║    ██╔═══╝ ██║   ██║██╔═══╝ ██║   ██║╚██║ ██║ ",
    "██║ ╚████╔╝ ██║  ██║██║ ╚████║    ██║     ╚██████╔╝██║     ╚██████╔╝ ╚████╔╝ ",
    "╚═╝  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝      ╚═════╝ ╚═╝      ╚═════╝   ╚═══╝  ",
    "                                                                             ",
    "                         󱐋 Powered By  neovim                               ",
  },
  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  New File (Modal)", keys = "Spc c f", cmd = create_new_file },
    { txt = "  Bookmarks", keys = "Spc f i", cmd = "Telescope marks" },
    { txt = "  Quit", keys = "Spc c Q", cmd = "qa" },
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
