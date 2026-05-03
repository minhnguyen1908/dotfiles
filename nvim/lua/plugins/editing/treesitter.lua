-- File: nvim/lua/plugins/editing/treesitter.lua
-- PLUGIN: nvim-treesitter
-- LOGIC: Provides high-performance syntax highlighting and indentation.

return {
	"nvim-treesitter/nvim-treesitter", -- Core plugin repository
	build = ":TSUpdate", -- Logic: Automatically updates parsers on plugin update
	config = function() -- Initialization logic
		-- 1. Standard Parser Configuration

		-- UPDATED: We define a custom class 'ParserConfig' to satisfy Lua-LS strictness.
		-- This logic prevents the 'Fields cannot be injected' warning in image_d4df7e.jpg.
		---@class ParserConfig
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		-- NEW: Injecting the official OpenSCAD repository into our verified class.
		-- Logic: Pointing to the live repo we confirmed earlier.
		parser_config.openscad = {
			install_info = {
				url = "https://github.com/openscad/tree-sitter-openscad", -- The source URL
				files = { "src/parser.c" }, -- The C-source file to compile
				branch = "main", -- The default git branch to pull from
			},
		}

		-- 2. Standard Treesitter Setup
		-- Logic: Configuring the core engine and ensuring our DevOps stack is installed.
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"regex",
				"lua",
				"luadoc",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"sql",
				"go",
				"hcl",
				"terraform", -- CRITICAL: Vital for your AWS SAA studies
				"vim",
				"vimdoc",
				"query",
				"openscad", -- NEW: Added to auto-management list
			},
			sync_install = false, -- Logic: Prevent blocking the UI during installs
			ignore_install = {}, -- Logic: Exclude specific parsers if needed
			auto_install = true, -- Logic: Silently install missing parsers on file open
			highlight = {
				enable = true, -- Logic: Turn on intelligent highlighting
				additional_vim_regex_highlighting = false, -- Logic: Disable old regex engine for speed
			},
			indent = { enable = true }, -- Logic: Enable tree-based indentation
			modules = {}, -- Placeholder for additional modules
		})
	end,
}
