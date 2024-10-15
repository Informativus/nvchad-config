return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",

    config = function()
      require "configs.conform"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "configs.ufo"
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "",
      }
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "williamboman/mason.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "json",
        "yaml",
        "markdown",
        "proto",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        override = vim.tbl_extend("force", require "nvchad.icons.devicons", {
          [".env.example"] = {
            icon = "",
            color = "#ffc500",
            name = "EnvExample",
          },
          [".env.dev"] = {
            icon = "",
            color = "#ffc500",
            name = "EnvExample",
          },
          [".env.prod"] = {
            icon = "",
            color = "#ffc500",
            name = "EnvExample",
          },
          proto = {
            icon = "",
            color = "#ff007f",
            name = "Proto",
          },
        }),
      }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     local noice_config = require "configs.noice"
  --     require("noice").setup(noice_config)
  --     require("notify").setup {
  --       background_colour = "#000000",
  --     }
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- },
  {
    "echasnovski/mini.icons",
    lazy = false,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  { "tpope/vim-fugitive" },
  { "rbong/vim-flog", dependencies = {
    "tpope/vim-fugitive",
  }, lazy = false },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.g.codeium_disable_bindings = 1
    end,
    event = "BufEnter",
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
}
