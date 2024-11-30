local M = {}

local function set_buffer_colors()
  local colors = {
    buffer_current_lighter = { fg = "#DAD2AD", bg = "#1F1F28" },
    buffer_current_mod = { fg = "#E46876", bg = "#1F1F28" },
    buffer_current_sign = { fg = "#7E9CD8", bg = "#1F1F28" },

    buffer_inactive = { fg = "#727169", bg = "#16161D" },
    buffer_inactive_mod = { fg = "#957FB8", bg = "#16161D" },
    buffer_inactive_sign = { fg = "#6A9589", bg = "#16161D" },

    buffer_visible = { fg = "#DAD2AD", bg = "#16161D" },
    buffer_visible_mod = { fg = "#E46876", bg = "#1F1F28" },

    buffer_tabpage_fill = { fg = "#727169", bg = "#1F1F28" },

    buffer_inactive_icon = { fg = "#727169", bg = "#16161D" },
  }

  local set_hl = vim.api.nvim_set_hl
  set_hl(0, "BufferCurrentLighter", colors.buffer_current_lighter)
  set_hl(0, "BufferCurrentMod", colors.buffer_current_mod)
  set_hl(0, "BufferCurrentSign", colors.buffer_current_sign)

  set_hl(0, "BufferInactive", colors.buffer_inactive)
  set_hl(0, "BufferInactiveMod", colors.buffer_inactive_mod)
  set_hl(0, "BufferInactiveSign", colors.buffer_inactive_sign)

  set_hl(0, "BufferVisible", colors.buffer_visible)
  set_hl(0, "BufferVisibleMod", colors.buffer_visible_mod)

  set_hl(0, "BufferTabpageFill", colors.buffer_tabpage_fill)

  set_hl(0, "BufferInactiveIcon", colors.buffer_inactive_icon)
end

M.setup = function()
  vim.g.barbar_auto_setup = false

  require("barbar").setup {
    animation = true,
    auto_hide = true,
    tabpages = true,
    clickable = true,
    exclude_ft = {},
    exclude_name = {},
    focus_on_close = "left",
    hide = { extensions = false, inactive = false },
    highlight_alternate = false,
    highlight_inactive_file_icons = true,
    highlight_visible = true,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = "",
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
        [vim.diagnostic.severity.HINT] = { enabled = true },
      },
      filetype = { enabled = true },
      separator = { left = "▎", right = "" },
      separator_at_end = true,
      modified = { button = "●" },
      pinned = { button = "", filename = true },
      preset = "default",
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = true },
      inactive = { button = "×" },
      visible = { modified = { buffer_number = false } },
    },
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    minimum_length = 0,
    semantic_letters = true,
    sidebar_filetypes = {
      NvimTree = true,
      undotree = { text = "undotree", align = "center" },
      ["neo-tree"] = { event = "BufWipeout" },
      Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
    },
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
    no_name_title = "New File",
    sort = { ignore_case = true },
  }

  set_buffer_colors()
end

return M
