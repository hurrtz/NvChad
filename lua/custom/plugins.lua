local overrides = require("custom.configs.overrides")

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("custom.configs.lspconfig")
    end
  },
  
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("custom.configs.conform"),
  },
  
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter
  },
  
  {
    "mason-org/mason.nvim",
    opts = overrides.mason
  }
}
