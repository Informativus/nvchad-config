local Popup = require "nui.popup"
local event = require("nui.utils.autocmd").event

local M = {}

function M.replace_words()
  local function create_input_popup(title, callback)
    local popup = Popup {
      enter = true,
      focusable = true,
      border = {
        style = "rounded",
        text = {
          top = title,
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
    vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {})
    vim.api.nvim_buf_set_option(popup.bufnr, "modifiable", true)

    popup:on(event.BufLeave, function()
      popup:unmount()
    end)

    popup:on(event.BufWinLeave, function()
      popup:unmount()
    end)

    vim.api.nvim_buf_set_keymap(popup.bufnr, "i", "<CR>", "", {
      noremap = true,
      silent = true,
      callback = function()
        local input = vim.fn.getline(1)
        popup:unmount()
        if input and input ~= "" then
          callback(input)
        else
          print "Input cannot be empty"
        end
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

  -- Запрос старого слова
  create_input_popup(" Enter Old Word ", function(old_word)
    -- Запрос нового слова
    create_input_popup(" Enter New Word ", function(new_word)
      -- Выполнение команды замены
      vim.cmd(":%s/" .. old_word .. "/" .. new_word .. "/gc")
      print("Replaced '" .. old_word .. "' with '" .. new_word .. "'")
    end)
  end)
end

return M
