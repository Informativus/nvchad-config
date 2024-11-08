local M = {}

M.setup = function()
  -- Инициализация wilder.nvim с настройками
  require("wilder").setup {
    modes = { ":", "/", "?" }, -- Модальные ключи для поиска и команд (некоторые из них, как `:`, `/`, и `?` работают в командной строке)
    next_key = "<Tab>", -- Клавиша для перехода к следующему элементу
    prev_key = "<S-Tab>", -- Клавиша для перехода к предыдущему элементу
    accept_key = "<Down>", -- Клавиша для принятия выбранного элемента
    reject_key = "<Up>", -- Клавиша для отклонения выбора
    use_vim_remote_plugin = false, -- Не использовать внешний плагин Vim
    num_workers = 4, -- Количество рабочих процессов (для параллельной работы)
  }

  local wilder = require "wilder" -- Загружаем основной модуль wilder

  -- Настройки подсветки для найденных элементов
  local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.basic_highlighter(),
  }

  -- Настройка рендеринга (вывод результатов поиска)
  local render_popup = {
    mode = "float", -- Режим отображения: плавающая панель
    highlighter = highlighters, -- Применяем указанные highlighter'ы
    left = { -- Левый блок рендеринга
      "  ",
      wilder.popupmenu_devicons(), -- Иконки для элементов
      wilder.popupmenu_buffer_flags {
        flags = " a + ",
        icons = { ["+"] = "", a = "", h = "+" },
      },
    },
    right = { -- Правый блок рендеринга
      "  ",
      wilder.popupmenu_scrollbar(), -- Полоса прокрутки
    },
    highlights = { -- Настройка цветов
      border = "Normal", -- Цвет рамки
      selected = "PmenuSel", -- Цвет выбранного элемента
      accent = "PmenuSel", -- Цвет акцента
      default = "Pmenu", -- Цвет обычных элементов
    },
    border = "rounded", -- Закругленные углы
    pumblend = 0, -- Прозрачность
    min_height = 0, -- Минимальная высота
    max_height = "50%", -- Максимальная высота
    min_width = "25%", -- Минимальная ширина
    max_width = "25%", -- Максимальная ширина
  }

  -- Создаем измененные настройки для отображения с бордерами и палитрой
  local render_popup_border = vim.tbl_deep_extend("force", render_popup, {})
  local render_popup_palette = vim.tbl_deep_extend("force", render_popup, {
    min_width = "50%", -- Ширина для палитры
    max_width = "50%", -- Максимальная ширина для палитры
    prompt_position = "bottom", -- Позиция подсказки внизу
    margin = "25%", -- Отступ
  })

  -- Рендеринг для поиска
  local render_search = wilder.popupmenu_renderer(wilder.popupmenu_border_theme(render_popup_border))

  -- Установка рендерера для разных команд
  wilder.set_option(
    "renderer",
    wilder.renderer_mux {
      [":"] = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme(render_popup_palette)), -- Для команд ":"
      ["/"] = render_search, -- Для поиска "/"
      substitute = render_search, -- Для подмены
    }
  )
end

return M
