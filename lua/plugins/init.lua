return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- format on save enabled
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript",
        "tsx", "json", "markdown", "markdown_inline",
        "bash", "scss", "yaml"
      },
    },
  },
}
