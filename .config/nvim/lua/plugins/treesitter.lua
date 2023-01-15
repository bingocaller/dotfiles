require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages

	-- List of parsers to ignore installing
	ignore_install = {
		"agda",
		"beancount",
		"bibtex",
		"blueprint",
		"c_sharp",
		"clojure",
		"commonlisp",
		"cooklang",
		"cuda",
		"d",
		"devicetree",
		"dot",
		"eex",
		"elixir",
		"elm",
		"elvish",
		"embedded_template",
		"erlang",
		"fennel",
		"foam",
		"fortran",
		"fusion",
		"gdresource",
		"gdscript",
		"gleam",
		"glimmer",
		"glsl",
		"godotResource",
		"godot_resource",
		"gomod",
		"gowork",
		"hack",
		"haskell",
		"hcl",
		"heex",
		"hjson",
		"hlsl",
		"hocon",
		"java",
		"jsonnet",
		"julia",
		"kotlin",
		"lalrpop",
		"latex",
		"ledger",
		"menhir",
		"meson",
		"nickel",
		"ninja",
		"nix",
		"norg",
		"org",
		"pascal",
		"perl",
		"php",
		"phpdoc",
		"pioasm",
		"prisma",
		"ql",
		"qmljs",
		"query",
		"r",
		"racket",
		"rasi",
		"rego",
		"rnoweb",
		"scala",
		"slint",
		"solidity",
		"rst",
		"sparql",
		"supercollider",
		"surface",
		"sxhkdrc",
		"teal",
		"tiger",
		"tlaplus",
		"turtle",
		"twig",
		"v",
		"vala",
		"verilog",
		"wgsl",
		"yang",
		"zig",
	},

	-- Core modules
	indent = { enable = true },
	highlight = {
		enable = true, -- false will disable the whole extension
		use_languagetree = true,

		-- custom_captures = {
		--     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
		--     ["foo.bar"] = "Identifier",
		-- },

		-- disable = { "c", "rust" },  -- list of language that will be disabled

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	-- Plugins
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
	},
	-- https://github.com/windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
})
