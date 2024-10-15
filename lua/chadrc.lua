---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },

  telescope = {
    style = "bordered",
    layout_config = {
      prompt_position = "bottom",
      width = 0.8,
      height = 0.6,
      preview_cutoff = 120,
    },
  },
  cmp = {
    lspkind_text = true,
    style = "default",
    format_colors = {
      tailwind = false,
    },
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
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

  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f g", cmd = "Telescope oldfiles" },
  },
}

M.base46 = {
  theme = "chadracula-evondev",
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
