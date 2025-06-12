vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = "#6e6e6e", blend = 10 })

return {
  show = true,
  handle = {
    text = " ",
    color = nil,
    highlight = "ScrollbarHandle",
    hide_if_all_visible = true,
  },
  marks = {
    Search = { text = { "•" }, color = "#ffe066" },
    Error = { text = { "" }, color = "#ff6666" },
    Warn = { text = { "" }, color = "#ffc66d" },
    Info = { text = { "" }, color = "#66d9ef" },
    Hint = { text = { "" }, color = "#7ce3b2" },
    Misc = { text = { "" }, color = "#caa9fa" },
  },
  excluded_filetypes = { "prompt", "TelescopePrompt", "noice" },
  handlers = {
    cursor = true,
    diagnostic = true,
    gitsigns = true,
    search = true,
  },
}
