require "nvchad.mappings"

local map = vim.keymap.set
local wk = require("which-key")

wk.register({
  ["w"] = { "<cmd>w<CR>", "Save" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  p = { name = "Hide element" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  r = { name = "Reset"}
}, { prefix = "<leader>", mode = "n" })

wk.register({
  c = { name = "Code" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["cx"] = { "<cmd>lua require('nvchad.tabufline').closeAllBufs()<CR>", "Close All Buffers" },
  ["cq"] = { "<cmd>:wq<cr>", "Quit with save" },
  ["cQ"] = { "<cmd>:qa<cr>", "Quit all with check save" },
}, { prefix = "<leader>", mode = "n" })

-- Tmux

wk.register({
  ["<c-l>"] = { "<cmd>:TmuxNavigateRight<cr>", "Tmux Right" },
  ["<c-h>"] = { "<cmd>:TmuxNavigateLeft<cr>", "Tmux Left" },
  ["<c-k>"] = { "<cmd>:TmuxNavigateUp<cr>", "Tmux Up" },
  ["<c-j>"] = { "<cmd>:TmuxNavigateDown<cr>", "Tmux Down" },
}, { mode = { "n", "t", "v" } })

-- Move Lines

wk.register({
  ["<S-k>"] = { ":m .-2<CR>==", "Move Line Up" },
  ["<S-j>"] = { ":m .+1<CR>==", "Move Line Down" },
}, { mode = "v" })

wk.register({
  f = { name = "telescope" },
}, { prefix = "<leader>", mode = "n" })

wk.register({ 
  ["ft"] = { "<cmd>TodoTrouble<CR>", "Find Todo" },
}, { prefix = "<leader>", mode = {"n", "v", "i"} })

wk.register({
  ["d"] = { "<cmd>t.<cr>", "Duplicate Line" },
}, { prefix = "<leader>", mode = "n" })

-- Trouble
wk.register({
  q = { name = "Trouble" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["qx"] = { "<cmd>Trouble diagnostics toggle<cr>", "Trouble Diagnostics" },
  ["qX"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Trouble Buffer Diagnostics" },
  ["qc"] = { "<cmd>Trouble code_actions<cr>", "Trouble Code Actions" },
  ["ql"] = { "<cmd>Trouble lsp_definitions<cr>", "Trouble LSP Definitions" },
  ["qL"] = { "<cmd>Trouble loclist<cr>", "Trouble Location List" },
  ["qQ"] = { "<cmd>Trouble quickfix<cr>", "Trouble Quickfix List" },
}, { prefix = "<leader>", mode = "n" })

-- Tests
wk.register({
  t = { name = "Test" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["tt"] = { function() 
    require("neotest").run.run()
  end, "Test Nearest" },
  ["tf"] = { function() 
      require("neotest").run.run(vim.fn.expand "%")
    end, "Test File" },
  ["to"] = { "Neotest output<CR>", "Show test output" },
  ["ts"] = { "Neotest summary<CR>", "Show test summary" },
}, { prefix = "<leader>", mode = "n" })

-- Debug

wk.register({
  d = { name = "Debug" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["du"] = { function() 
    require("dapui").toggle()
  end, "Toggle Debug UI" },
  ["db"] = { function() 
    require("dap").toggle_breakpoint()
  end, "Toggle Breakpoint" },
  ["ds"] = { function() 
    require("dap").continue()
  end, "Start" },
  ["dn"] = { function() 
    require("dap").step_over()
  end, "Step Over" },
}, { prefix = "<leader>", mode = "n" })

-- Git

wk.register({
  g = { name = "Git" },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["gl"] = { ":Flog<CR>", "Git Log" },
  ["gf"] = { ":DiffviewFileHistory<CR>", "Git File History" },
  ["gc"] = { ":DiffviewOpen HEAD~1<CR>", "Git Last Commit" },
  ["gt"] = { ":DiffviewToggleFile<CR>", "Git File History" },
}, { prefix = "<leader>", mode = "n" })

-- Terminal

wk.register({
  ["<C-]>"] = {
    function()
      require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
    end,
    "Toggle Terminal Vertical"
  },
  ["<C-\\>"] = {
    function()
      require("nvchad.term").toggle { pos = "sp", size = 0.4 }
    end,
    "Toggle Terminal Horizontal"
  },
  ["<C-f>"] = {
    function()
      require("nvchad.term").toggle { pos = "float" }
    end,
    "Toggle Terminal Float"
  },
}, { mode = {"n", "t"} }) -- Регистрация для нормального режима

-- Visual Multi

wk.register({
  m = { name = "Visual Multi" }
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["ms"] = { "<Plug>(VM-Select-All)", "Select All" },
  ["mo"] = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mappings" },
  ["mp"] = { "<Plug>(VM-Add-Cursor-At-Pos)", "VM Add Cursor At Pos" },
  ["mr"] = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search" }
}, { prefix = "<leader>", mode = "n" })

wk.register({
  ["mv"] = { visual_cursors_with_delay, "Visual Cursors" }
}, { prefix = "<leader>", mode = "v" })

local function visual_cursors_with_delay()
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  vim.cmd('sleep 200m')
  vim.cmd('silent! execute "normal! A"')
end

-- Ufo

wk.register({
  ["zR"] = { require('ufo').openAllFolds, "Open all folds" },
  ["zM"] = { require('ufo').closeAllFolds, "Close all folds" }
}, { mode = "n" })

-- Basic

wk.register({
  ["jj"] = { "<ESC>", "Escape" },
}, { mode = "i" })

wk.register({
  ["<C-g>"] = {
    function()
      return vim.fn["codeium#Accept"]()
    end, "Accept Codeium Suggestion"
  }
}, { mode = "i" })
-- LSP

wk.register({
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
})

-- Переход к реализации
wk.register({
  ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
}, { prefix = "<leader>", mode = "n" })
