local options = {
  filters = {
    custom = { ".DS_Store" },
    dotfiles = false, -- Отображать скрытые файлы (начинающиеся с точки)
  },
  disable_netrw = true, -- Отключить встроенный в Neovim file explorer (netrw)
  hijack_netrw = true, -- Заменить netrw на nvim-tree
  hijack_cursor = true, -- Перемещать курсор в nvim-tree при открытии файлов
  hijack_unnamed_buffer_when_opening = false, -- Не заменять неименованный буфер при открытии файлов
  sync_root_with_cwd = true, -- Синхронизировать корневую директорию с текущей рабочей директорией
  update_focused_file = {
    enable = true, -- Обновлять файл в дереве при изменении рабочей директории
    update_root = false, -- Не обновлять корневую директорию
  },
  view = {
    adaptive_size = false, -- Выключить адаптивный размер окна
    side = "left", -- Располагать дерево слева
    width = 23, -- Ширина окна дерева
    preserve_window_proportions = true, -- Сохранять пропорции окна
  },
  git = {
    enable = true, -- Включить поддержку Git
    ignore = false, -- Отображать игнорируемые Git файлы
  },
  filesystem_watchers = {
    enable = true, -- Включить наблюдение за файловой системой
  },
  actions = {
    open_file = {
      resize_window = true, -- Изменять размер окна при открытии файла
    },
  },
  renderer = {
    root_folder_label = false, -- Не показывать метку корневой папки
    highlight_opened_files = "none", -- Не подсвечивать открытые файлы
    indent_markers = {
      enable = true, -- Показывать отступы в дереве файлов
    },
    icons = {
      show = {
        file = true, -- Показывать иконки файлов
        folder = true, -- Показывать иконки папок
        folder_arrow = true, -- Показывать стрелки для папок
        git = true, -- Показывать иконки Git состояний
      },
      glyphs = {
        default = "󰈚", -- Иконка по умолчанию
        symlink = "", -- Иконка символической ссылки
        folder = {
          default = "", -- Иконка папки по умолчанию
          empty = "", -- Иконка пустой папки
          empty_open = "", -- Иконка открытой пустой папки
          open = "", -- Иконка открытой папки
          symlink = "", -- Иконка символической ссылки для папки
          symlink_open = "", -- Иконка открытой символической ссылки для папки
          arrow_open = "", -- Иконка открытой папки с стрелкой
          arrow_closed = "", -- Иконка закрытой папки с стрелкой
        },
        git = {
          unstaged = "✗", -- Иконка незафиксированных изменений Git
          staged = "✓", -- Иконка зафиксированных изменений Git
          unmerged = "", -- Иконка неразрешенных конфликтов Git
          renamed = "➜", -- Иконка переименованных файлов Git
          untracked = "★", -- Иконка непроиндексированных файлов Git
          deleted = "", -- Иконка удаленных файлов Git
          ignored = "◌", -- Иконка игнорируемых файлов Git
        },
      },
    },
  },
}

return options
