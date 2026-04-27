-- File: nvim/lua/plugins/editing/treesitter.lua
-- PLUGIN 1: nvim-treesitter for intelligent syntax highlighting and indentation.
-- This uses a parsing engine for more accurate and robust highlighting than traditional regex.
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Command to run after installation to download language parsers.
	config = function()
		-- We use the configs module to handle the setup call
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- Line-by-line: List of languages to install parsers for.
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
				"terraform",
				"vim",
				"vimdoc",
				"query",
				"openscad", -- New: Added for your 3D blueprint workflow
			},
			sync_install = false, -- New: Explicitly set to false to satisfy type checker warnings
			ignore_install = {}, -- New: Explicitly provided empty table for the type checker
			auto_install = true, -- Automatically install missing parsers when entering buffer.
			highlight = {
				enable = true, -- Enable syntax highlighting.
				additional_vim_regex_highlighting = false, -- New: Set to false for better performance
			},
			indent = { enable = true }, -- Enable smart indentation.
			modules = {}, -- New: Explicitly provided empty table for 'modules' requirement
		})
	end,
}
