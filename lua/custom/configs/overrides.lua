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
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"diagnostic-languageserver",
		"dockerfile-language-server",
		"eslint-lsp",
		"graphql-language-service-cli",
		"html-lsp",
		"json-lsp",
		"prettier",
		"typescript-language-server",

		-- shell
		"shfmt",
		"shellcheck",
		"bash-language-server",
	},
}

return M
