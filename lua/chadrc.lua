---@type ChadrcConfig
local M = {}

M = {
  ui = {
    statusline = {
      theme = "vscode_colored",
    },
    telescope = {
      style = "bordered",
      prompt_position = "bottom",
    },
  },

  base46 = {
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
    Normal = { bg = "none" },
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
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
      "                                                                             ",
    },
    buttons = {
      { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
      { txt = "  New File", keys = "Spc n f", cmd = ":ene <BAR> startinsert<CR>" },
      { txt = "  Bookmarks", keys = "Spc b m", cmd = "Telescope marks" },
      { txt = "  Load Session", keys = "Spc s l", cmd = "SessionLoad" },
      { txt = "  Quit", keys = "Spc q q", cmd = ":qa<CR>" },
    },
  },

  mason = {
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
  },
}

return M
