local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local b = null_ls.builtins

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local sources = {
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	-- Diagnostics
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
	b.diagnostics.curlylint,
	b.diagnostics.fish,
	b.diagnostics.gitlint,
	b.diagnostics.jsonlint,
	b.diagnostics.markdownlint.with({
		-- MD013 - Line length
		-- https://github.com/DavidAnson/markdownlint/blob/main/doc/md013.md
		extra_args = { "--disable MD013" },
	}),
	b.diagnostics.puglint,
	b.diagnostics.pylint,
	b.diagnostics.selene,
	with_diagnostics_code(b.diagnostics.shellcheck),
	b.diagnostics.stylelint,
	b.diagnostics.tidy,
	b.diagnostics.tsc,
	-- Formatting
	b.formatting.fish_indent,
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.formatting.fixjson,
	-- Use Prettier (non-daemon) for everything not JavaScript
	b.formatting.prettier.with({
		filetypes = {
			"astro",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"markdown",
			"svelte",
			"typescript",
			"typescriptreact",
			"vue",
			"yaml",
		},
	}),
	-- Use prettierd for everything JavaScript
	-- b.formatting.prettierd.with({
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"json",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 	},
	-- }),
	b.formatting.rustfmt.with({
		extra_args = { "--edition=2021" },
	}),
	b.formatting.shfmt,
	b.formatting.stylelint,
	b.formatting.stylua,
	b.formatting.tidy,
	b.formatting.trim_newlines,
	b.formatting.trim_whitespace.with({
		-- This is all to avoid trimming whitespace in Markdown files
		filetypes = {
			"astro",
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"scss",
			"svelte",
			"svg",
			"typescript",
			"typescriptreact",
			"vue",
			"yaml",
		},
	}),
	-- Hover
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#hover
	b.hover.dictionary,
	-- Completions
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#completion
	b.completion.spell,
}

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		debug = false,
		sources = sources,
		on_attach = on_attach,
	})
end

return M
