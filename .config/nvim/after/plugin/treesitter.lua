require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"dart",
		"diff",
		"dockerfile",
		"fish",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"ocaml",
		"proto",
		"pug",
		"python",
		"query",
		"regex",
		"rust",
		"scss",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},
	-- Install parsers asynchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI
	-- installed locally
	auto_install = true,
	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	-- If you need to change the installation directory of the parsers (see ->
	-- Advanced Setup)
	-- Remember to run
	-- vim.opt.runtimepath:append("/some/path/to/store/parsers")!
	-- parser_install_dir = "/some/path/to/store/parsers",

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	},
	-- Incremental selection based on the named nodes from the grammar.
	incremental_selection = {
		enable = true,
		keymaps = {
			-- To disable an individual mapping, set it to `false`
			init_selection = "<Leader>ss",
			node_incremental = "<Leader>si",
			scope_incremental = "<Leader>sc",
			node_decremental = "<Leader>sd",
		},
	},
	-- Indentation based on treesitter for the = operator.
	-- Note: This is an experimental feature.
	indent = {
		enable = true,
	},
	-- Setting this to true will run `:h syntax` and tree-sitter at the same
	-- time. Set this to `true` if you depend on 'syntax' being enabled (like
	-- for indentation).
	-- Using this option may slow down your editor, and you may see some
	-- duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,

	-- Textobjects
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@attribute.outer",
				["ia"] = "@attribute.inner",
				["ac"] = "@comment.outer",
				["ic"] = "@comment.inner",
				["ad"] = "@declaration.outer",
				-- ["id"] = "@declaration.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["am"] = "@media.outer",
				["in"] = "@number.inner",
				-- ["ar"] = "@property.outer",
				["ir"] = "@property.inner",
				["iq"] = "@query.inner",
			},
			-- If you set this to `true` (default is `false`) then any
			-- textobject is extended to include preceding or succeeding
			-- whitespace. Succeeding whitespace has priority in order to act
			-- similarly to eg the built-in `ap`.
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},

	-- Plugins
	-- https://github.com/windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
})

-- Speed up nvim-ts-context-commentstring
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#getting-started
vim.g.skip_ts_context_commentstring_module = true
