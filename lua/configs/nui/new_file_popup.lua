local Popup = require "nui.popup"
local event = require("nui.utils.autocmd").event

local M = {}

function M.create_file_modal()
  local popup = Popup {
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " Create New File ",
        top_align = "center",
      },
    },
    position = "50%",
    size = {
      width = 40,
      height = 1,
    },
    win_options = {
      winblend = 0,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }

  popup:mount()

  -- Вставка текста для ввода
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {})
  vim.api.nvim_buf_set_option(popup.bufnr, "modifiable", true)

  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  popup:on(event.BufWinLeave, function()
    popup:unmount()
  end)

  -- Обработчик клавиши Enter
  vim.api.nvim_buf_set_keymap(popup.bufnr, "i", "<CR>", "", {
    noremap = true,
    silent = true,
    callback = function()
      local file_name = vim.fn.getline(1)

      if file_name and file_name ~= "" then
        vim.cmd("edit " .. file_name)
        print("File created: " .. file_name)
      else
        print "No file name provided"
      end
      popup:unmount()
    end,
  })

  vim.api.nvim_buf_set_keymap(popup.bufnr, "n", "<Esc>", "", {
    noremap = true,
    silent = true,
    callback = function()
      popup:unmount()
    end,
  })
end

return M
