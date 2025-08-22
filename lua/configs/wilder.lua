local M = {}

M.setup = function()
  local wilder = require "wilder"

  wilder.setup {
    modes = { ":", "/", "?" },
    next_key = "<Tab>",
    prev_key = "<S-Tab>",
    accept_key = "<Down>",
    reject_key = "<Up>",
    use_vim_remote_plugin = false,
    num_workers = 4,
  }

  local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.basic_highlighter(),
  }

  local render_popup = {
    mode = "float",
    highlighter = highlighters,
    left = {
      "  ",
      wilder.popupmenu_devicons(),
      wilder.popupmenu_buffer_flags {
        flags = " a + ",
        icons = { ["+"] = "", a = "", h = "+" },
      },
    },
    right = {
      "  ",
      wilder.popupmenu_scrollbar(),
    },
    highlights = {
      border = "Normal",
      selected = "PmenuSel",
      accent = "PmenuSel",
      default = "Pmenu",
    },
    border = "rounded",
    pumblend = 0,
    min_height = 0,
    max_height = "50%",
    min_width = "25%",
    max_width = "25%",
  }

  local render_popup_border = vim.tbl_deep_extend("force", render_popup, {})
  local render_popup_palette = vim.tbl_deep_extend("force", render_popup, {
    min_width = "50%",
    max_width = "50%",
    prompt_position = "bottom",
    margin = "25%",
  })

  local render_search = wilder.popupmenu_renderer(wilder.popupmenu_border_theme(render_popup_border))

  -- Здесь ключевой момент: отключаем popup для ':'
  wilder.set_option(
    "renderer",
    wilder.renderer_mux {
      [":"] = nil, -- nil или wilder.renderer_mux.none — popup не показывается
      ["/"] = render_search,
      substitute = render_search,
    }
  )
end

return M
