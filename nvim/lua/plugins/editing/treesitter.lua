-- PLUGIN 1: nvim-treesitter for intelligent syntax highlighting and indentation.
-- This uses a parsing engine for more accurate and robust highlighting than traditional regex.
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Command to run after installation to download language parsers.
	config = function()
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
				"terraform",
				"vim",
				"vimdoc",
				"query",
			}, -- List of languages to install parsers for.
			auto_install = true, -- Automatically install missing parsers when entering buffer.
			highlight = { enable = true }, -- Enable syntax highlighting.
			indent = { enable = true }, -- Enable smart indentation.
		})
	end,
}
