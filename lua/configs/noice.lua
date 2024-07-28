-- configs/noice_config.lua

return {
  cmdline = {
    enabled = true, -- Включает пользовательский интерфейс для командной строки Noice
    view = "cmdline_popup", -- Вид для рендеринга командной строки (всплывающее окно)
    opts = {}, -- Глобальные опции для командной строки
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" }, -- Формат командной строки (начинается с ":")
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" }, -- Формат поиска вниз ("/")
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" }, -- Формат поиска вверх ("?")
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" }, -- Формат фильтрации (":!")
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" }, -- Формат для Lua команд
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" }, -- Формат для команд помощи (":help")
      input = { view = "cmdline_input", icon = "󰥻 " }, -- Формат для ввода
    },
  },
  messages = {
    enabled = true, -- Включает пользовательский интерфейс для сообщений Noice
    view = "notify", -- Вид по умолчанию для сообщений (уведомления)
    view_error = "notify", -- Вид для ошибок
    view_warn = "notify", -- Вид для предупреждений
    view_history = "messages", -- Вид для истории сообщений (":messages")
    view_search = "virtualtext", -- Вид для сообщений поиска. Установите в false, чтобы отключить
  },
  popupmenu = {
    enabled = true, -- Включает пользовательский интерфейс для всплывающего меню Noice
    backend = "nui", -- Бэкенд для отображения завершений командной строки
    kind_icons = {}, -- Иконки для типов элементов завершения
  },
  redirect = {
    view = "popup", -- Вид для перенаправленных команд
    filter = { event = "msg_show" }, -- Фильтр для перенаправления сообщений
  },
  commands = {
    history = {
      view = "split", -- Вид для истории сообщений (разделенный экран)
      opts = { enter = true, format = "details" }, -- Опции для вида истории
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    last = {
      view = "popup", -- Вид для последнего сообщения
      opts = { enter = true, format = "details" }, -- Опции для вида последнего сообщения
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 }, -- Опции фильтра (количество сообщений)
    },
    errors = {
      view = "popup", -- Вид для ошибок
      opts = { enter = true, format = "details" }, -- Опции для вида ошибок
      filter = { error = true }, -- Фильтр для ошибок
      filter_opts = { reverse = true }, -- Опции фильтра (обратный порядок)
    },
    all = {
      view = "split", -- Вид для всех сообщений
      opts = { enter = true, format = "details" }, -- Опции для вида всех сообщений
      filter = {}, -- Фильтр для всех сообщений
    },
  },
  notify = {
    enabled = true, -- Включает использование Noice для уведомлений
    view = "notify", -- Вид для уведомлений
  },
  lsp = {
    progress = {
      enabled = true, -- Включает прогресс LSP
      format = "lsp_progress", -- Формат прогресса LSP
      format_done = "lsp_progress_done", -- Формат завершенного прогресса LSP
      throttle = 1000 / 30, -- Частота обновления сообщений прогресса LSP
      view = "mini", -- Вид для прогресса LSP
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false, -- Переопределяет форматер markdown для LSP
      ["vim.lsp.util.stylize_markdown"] = false, -- Переопределяет стилизацию markdown для LSP
      ["cmp.entry.get_documentation"] = false, -- Переопределяет документацию для cmp
    },
    hover = {
      enabled = true, -- Включает hover для LSP
      silent = false, -- Не отображать сообщение, если hover недоступен
      view = nil, -- Использует настройки по умолчанию
      opts = {}, -- Опции для hover
    },
    signature = {
      enabled = true, -- Включает подсказки для сигнатур
      auto_open = {
        enabled = true, -- Автоматически открывать подсказки сигнатур при вводе триггерного символа
        trigger = true, -- Автоматически показывать подсказки сигнатур при вводе триггерного символа
        luasnip = true, -- Открывать подсказки сигнатур при переходе к узлам вставки Luasnip
        throttle = 50, -- Задержка запроса подсказки сигнатуры
      },
      view = nil, -- Использует настройки по умолчанию
      opts = {}, -- Опции для подсказок сигнатур
    },
    message = {
      enabled = true, -- Включает сообщения от LSP серверов
      view = "notify", -- Вид для сообщений от LSP серверов
      opts = {}, -- Опции для сообщений
    },
    documentation = {
      view = "hover", -- Вид для документации hover и подсказок сигнатур
      opts = {
        lang = "markdown", -- Язык документации
        replace = true, -- Заменяет существующее окно документации
        render = "plain", -- Рендер документации в виде текста
        format = { "{message}" }, -- Формат документации
        win_options = { concealcursor = "n", conceallevel = 3 }, -- Опции окна документации
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, -- Ссылки на справку vim
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- Ссылки markdown
    },
    highlights = {
      ["|%S-|"] = "@text.reference", -- Подсветка ссылок на справку
      ["@%S+"] = "@parameter", -- Подсветка параметров
      ["^%s*(Parameters:)"] = "@text.title", -- Подсветка заголовков параметров
      ["^%s*(Return:)"] = "@text.title", -- Подсветка заголовков возвращаемых значений
      ["^%s*(See also:)"] = "@text.title", -- Подсветка заголовков "См. также"
      ["{%S-}"] = "@parameter", -- Подсветка параметров
    },
  },
  health = {
    checker = true, -- Включает проверку состояния
  },
  presets = {
    bottom_search = false, -- Использовать классическую нижнюю командную строку для поиска
    command_palette = false, -- Размещает командную строку и всплывающее меню вместе
    long_message_to_split = false, -- Длинные сообщения будут отправлены в разделенный экран
    inc_rename = false, -- Включает диалог ввода для переименования с помощью inc-rename.nvim
    lsp_doc_border = false, -- Добавляет границу для документов hover и подсказок сигнатур
  },
  throttle = 1000 / 30, -- Как часто Noice должен проверять обновления интерфейса
  views = {}, -- Пользовательские представления
  routes = {}, -- Маршруты для перенаправления команд
  status = {}, -- Компоненты для строки состояния
  format = {}, -- Настройки форматирования
}
