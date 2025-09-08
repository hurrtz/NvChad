local options = {
  formatters_by_ft = {
    -- Web Development
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    
    -- Lua
    lua = { "stylua" },
    
    -- Shell scripting
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },
  
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  
  formatters = {
    -- Custom formatter configurations
    prettier = {
      prepend_args = { "--single-quote", "--jsx-single-quote" },
    },
    
    stylua = {
      prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    },
    
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

return options
