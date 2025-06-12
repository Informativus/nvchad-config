local map = vim.keymap.set
local default_input = "com.apple.keylayout.ABC"

local function to_english()
  vim.fn.system { "im-select", default_input }
  vim.notify "Switched to ABC layout"
end

local function switch()
  map("n", "о", to_english)
  map("n", "О", to_english)
  map("n", "л", to_english)
  map("n", "Л", to_english)
  map("n", "д", to_english)
  map("n", "р", to_english)
  map("n", "г", to_english)
  map("n", "п", to_english)
  map("n", "П", to_english)
  map("n", "ф", to_english)
  map("n", "ш", to_english)

  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:n",
    callback = to_english,
  })
end

switch()
