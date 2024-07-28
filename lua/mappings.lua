require "nvchad.mappings"

local map = vim.keymap.set

map("n", ":", ":", { desc = "CMD enter command mode" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })
-- Закрыть текущее окно без сохранения
map("n", "<leader>cq", "<cmd>:wq<cr>", { desc = "Quit with save" })
-- Закрыть все вкладки
map("n" , "<leader>cQ", "<cmd>:qa!<cr>", { desc = "Quit All" })
-- Переместить выделенный текст вверх
map("x", "<S-k>", ":move '<-2<CR>gv-gv", { desc = "Move Selected Text Up" })
-- Переместить выделенный текст вниз
map("x", "<S-j>", ":move '>+1<CR>gv-gv", { desc = "Move Selected Text Down" })
-- Дублирования выделенного текста в визуальном режиме
map('v', '<leader>d', 'y`>pgv', opts, { desc = "Duplicate Selected Text" })
-- Дублирование строки на следующую
map('n', '<leader>d', '<cmd>t.<CR>', opts, { desc = "Duplicate Line" })

-- Trouble

map("n", "<leader>qx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>qX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>qc", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Code Actions (Trouble)" })
map("n", "<leader>ql", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>qL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>qQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Tests
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

-- Debug
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Debug UI" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Start" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })

-- Git
map("n", "<leader>gl", ":Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>gt", ":DiffviewToggleFile<CR>", { desc = "Git File History" })

-- Terminal
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
-- Visual Multi

local function visual_cursors_with_delay()
-- Execute the vm-visual-cursors command. 7
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
-- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).1
  vim. cmd('sleep 200m')
-- Press 'A' in normal mode after the delay. vim.cmd( 'silent! execute "normal! A"'):
  vim.cmd('silent! execute "normal! A"')
end

map("n", "<leader>ma", "<Plug>(VM-Select-All)", { desc = "Select All" })
map("n", "<leader>mr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start Regex Search" })
map("n", "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "VM Add Cursor At Pos" })
map("v", "<leader>mv", visual_cursors_with_delay, { desc = "Visual Cursors" })
map("n", "<leader>mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mappings" })


-- Ufo

map('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
map('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
-- Basic

map("i", "jj", "<ESC>")
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })


-- Переход к реализации
map("n", "gr", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to Implementation" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
