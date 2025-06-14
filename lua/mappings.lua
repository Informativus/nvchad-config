require "nvchad.mappings"

local map = vim.keymap.set
local wk = require "which-key"
local new_file_popup = require "configs.nui.new_file_popup"
local replace_word_in_file = require "configs.nui.replace_word_in_file"

wk.add {
  { "<leader>w", "<cmd>w<CR>", desc = "Save" },
}

wk.add {
  { "<leader>p", group = "Check Huck" },
}

wk.add {
  { "<leader>r", group = "Refactoring" },
}

wk.add {
  { "<leader>d", group = "Dublicate" },
}

wk.add({
  { "<leader>ri", "<cmd>OrganizeImports<cr>", desc = "Organize Imports" },
  { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  {
    "<leader>rp",
    function()
      replace_word_in_file.replace_words()
    end,
    desc = "Replace text",
  },
}, { mode = "n" })

map("n", "<S-j>", "5j", { desc = "Move 5 lines down" })
map("n", "<S-k>", "5k", { desc = "Move 5 lines up" })

-- Code
wk.add {
  { "<leader>c", group = "Code" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<leader>cq", "<cmd>wq<cr>", desc = "Quit with save" },
  { "<leader>cQ", "<cmd>qa<cr>", desc = "Quit all with check save" },
}

-- Tmux
wk.add({
  { "<c-l>", "<cmd>:TmuxNavigateRight<cr>", desc = "Tmux Right" },
  { "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", desc = "Tmux Left" },
  { "<c-k>", "<cmd>:TmuxNavigateUp<cr>", desc = "Tmux Up" },
  { "<c-j>", "<cmd>:TmuxNavigateDown<cr>", desc = "Tmux Down" },
}, { mode = { "n", "t", "v" } })

-- Move selected text up
map("v", "<S-k>", ":m .-2<CR>gv-gv", { desc = "Move Selected Text Up" })

-- Move selected text down
map("v", "<S-j>", ":move '>+1<CR>gv-gv", { desc = "Move Selected Text Down" })

-- Go to implementation
wk.add({
  { "gr", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
}, { mode = "n" })

-- telescope
wk.add({
  { "<leader>f", group = "telescope" },
  { "<leader>ft", "<cmd>TodoTrouble<CR>", desc = "Find Todo" },
  { "<leader>fi", "<cmd>Telescope marks<CR>", desc = "Search marks in Project" },
}, { mode = { "n", "v", "i" } })

-- Duplicate Line
wk.add({
  { "<leader>d", "<cmd>t.<cr>", desc = "Duplicate Line" },
}, { mode = "n" })

map("v", "<leader>dl", "y'>pgv", { desc = "Duplicate Selected Lines" })

-- Trouble
wk.add {
  { "<leader>q", group = "Trouble" },
  { "<leader>qx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble Diagnostics" },
  { "<leader>qX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Buffer Diagnostics" },
  { "<leader>qc", "<cmd>Trouble code_actions<cr>", desc = "Trouble Code Actions" },
  { "<leader>ql", "<cmd>Trouble lsp_definitions<cr>", desc = "Trouble LSP Definitions" },
  { "<leader>qL", "<cmd>Trouble loclist<cr>", desc = "Trouble Location List" },
  { "<leader>qQ", "<cmd>Trouble quickfix<cr>", desc = "Trouble Quickfix List" },
}

-- Test
wk.add {
  { "<leader>t", group = "Test" },
  {
    "<leader>tt",
    function()
      require("neotest").run.run()
    end,
    desc = "Test Nearest",
  },
  {
    "<leader>tf",
    function()
      require("neotest").run.run(vim.fn.expand "%")
    end,
    desc = "Test File",
  },
  { "<leader>to", "<cmd>Neotest output<CR>", desc = "Show test output" },
  { "<leader>ts", "<cmd>Neotest summary<CR>", desc = "Show test summary" },
}

-- Git
wk.add {
  { "<leader>g", group = "Git" },
  { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Git Log" },
}

wk.add({
  {
    "<C-]>",
    function()
      require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
    end,
    desc = "Toggle Terminal Vertical",
  },
  {
    "<C-\\>",
    function()
      require("nvchad.term").toggle { pos = "sp", size = 0.4 }
    end,
    desc = "Toggle Terminal Horizontal",
  },
  {
    "<C-f>",
    function()
      require("nvchad.term").toggle { pos = "float" }
    end,
    desc = "Toggle Terminal Float",
  },
}, { mode = "n" })

wk.add({
  {
    "<C-]>",
    function()
      require("nvchad.term").toggle { pos = "vsp" }
    end,
    desc = "Toggle Terminal Vertical",
  },
  {
    "<C-\\>",
    function()
      require("nvchad.term").toggle { pos = "sp" }
    end,
    desc = "Toggle Terminal Horizontal",
  },
  {
    "<C-f>",
    function()
      require("nvchad.term").toggle { pos = "float" }
    end,
    desc = "Toggle Terminal Float",
  },
}, { mode = "t" })

wk.add {
  { "<leader>c", group = "" },
  {
    "<leader>cf",
    function()
      new_file_popup.create_file_modal()
    end,
    desc = "Create new file",
  },
}

-- Visual Multi
local function visual_cursors_with_delay()
  print "Visual multi"
  vim.cmd 'silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"'
  vim.cmd "sleep 200m"
  vim.cmd 'silent! execute "normal! A"'
end

wk.add({
  { "<leader>m", group = "Visual Multi" },
  { "<leader>ms", "<Plug>(VM-Select-All)", desc = "Select All" },
  { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mappings" },
  { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "VM Add Cursor At Pos" },
  { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
}, { mode = "n" })

map("v", "<leader>mv", visual_cursors_with_delay, { desc = "Visual Cursors" })

-- Ufo
wk.add {
  { "zR", require("ufo").openAllFolds, desc = "Open all folds" },
  { "zM", require("ufo").closeAllFolds, desc = "Close all folds" },
}

-- lsp-lens
wk.add({
  { "<leader>l", group = "LSP-Lens" },
  { "<leader>lu", "<cmd>Telescope lsp_references<cr>", desc = "LSP Usages (References)" },
  { "<leader>lo", "<cmd>LspLensToggle<cr>", desc = "On/off LSP Lens" },
}, { mode = "n" })

-- Codeium
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
map("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
map("i", "<c-f>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
map("i", "<c-s>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
map("i", "<c-w>", function()
  return vim.fn["codeium#AcceptNextWord"]()
end, { expr = true, silent = true })

-- LSP
wk.add {
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to Declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
}

-- Barbar
wk.add {
  { "<leader>z", group = "Buffers" },
  { "<leader>z1", "<cmd>BufferGoto 1<cr>", desc = "Go to 1 tab" },
  { "<leader>z2", "<cmd>BufferGoto 2<cr>", desc = "Go to 2 tab" },
  { "<leader>z3", "<cmd>BufferGoto 3<cr>", desc = "Go to 3 tab" },
  { "<leader>zp", "<cmd>BufferPin<cr>", desc = "Pin tab" },
  { "<leader>zx", "<cmd>lua require('nvchad.tabufline').closeAllBufs()<CR>", desc = "Close All Buffers" },
}

-- Tabs
wk.add({
  { "<Tab>", ":BufferNext<CR>", desc = "Next Buffer (Tab Forward)" },
  { "<S-Tab>", ":BufferPrevious<CR>", desc = "Previous Buffer (Tab Backward)" },
}, { mode = "n" })

map("n", "<leader>th", function()
  require("nvchad.themes").open { border = true }
end, {})

map("n", "n", function()
  vim.cmd "normal! n"
  require("hlslens").start()
end)

map("n", "*", function()
  vim.cmd "normal! *"
  require("hlslens").start()
end)

local function runUp()
  -- If you want to use this functionality, you need to install im-select on your device.
  require "configs.switch-language"
end

runUp()
