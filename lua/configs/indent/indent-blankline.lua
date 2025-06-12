local indent_highlight_colors = {
  IndentBlue = "#1e2a3b",
  IndentRosewater = "#3b2c30",
  IndentFlamingo = "#3a2a2a",
  IndentPeach = "#3a2f22",
  IndentGreen = "#253a25",
  IndentTeal = "#243a37",
  IndentMauve = "#332a45",
  IndentPink = "#3a2b35",
}

for name, color in pairs(indent_highlight_colors) do
  vim.api.nvim_set_hl(0, name, { fg = color })
end

return {
  indent = {
    char = "│",
    highlight = vim.tbl_keys(indent_highlight_colors),
  },
  scope = {
    enabled = false,
  },
}
