local null_ls = require("null-ls")

local b = null_ls.builtins
local codeaction = b.code_actions
local completion = b.completion
local format = b.formatting
local lint = b.diagnostics

local sources = {
	-- webdev stuff
	codeaction.eslint,
	lint.stylelint,
	format.prettier,

	-- Shell
	format.shfmt,
	lint.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

null_ls.setup({
	debug = true,
	sources = sources,
})
