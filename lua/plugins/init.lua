return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Override nvim-treesitter to track the main branch for Neovim 0.12+
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   branch = "main",
  --   opts = {
  --     ensure_installed = {
  --       "vim", "lua", "vimdoc",
  --       "html", "css", "cpp", "python", "markdown", "markdown_inline"
  --     },
  --   },
  -- },
  {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
      "html", "css", "cpp", "python", "markdown", "markdown_inline"
    },
  },
},
}
