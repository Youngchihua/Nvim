return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier",
        "gopls", "golines", "gofumpt",
        "goimports-reviser", "delve",
        "shellcheck", "luacheck"
      },
    },
  },
  -- 提供代码高亮、缩进和折叠等
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    ft = { "go", "gomod" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    --  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  --require('plugins.outline')
}
