require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls", -- TypeScript/JavaScript (updated from tsserver)
  "eslint",
  "jsonls",
  "bashls",
  "lua_ls",
}

vim.lsp.enable(servers)

-- Custom server configurations
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "config" .. "/lua",
        }
      }
    }
  }
}

-- read :h vim.lsp.config for changing options of lsp servers
