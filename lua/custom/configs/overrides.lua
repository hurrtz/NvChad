-- overriding default plugin configs!

local M = {}

M.treesitter = {
	ensure_installed = {
		"css",
		"bash",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"scss",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
}

M.nvimtree = {
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},

	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.mason = {
  ensure_installed = {
    -- LSP servers
    "lua-language-server",
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "json-lsp",
    "eslint-lsp",
    "bash-language-server",
    "dockerfile-language-server",
    "graphql-language-service-cli",
    
    -- Formatters
    "stylua",
    "prettier",
    "shfmt",
    
    -- Linters/Diagnostics
    "shellcheck",
  },
}

return M
