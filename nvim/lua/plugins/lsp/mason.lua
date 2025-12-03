-- Manages the installation of LSP servers, linters, and formatters.
return {
	"mason-org/mason.nvim",
	config = function()
		require("mason").setup({
			ensure_installed = {
				"stylua",
				"sql-formatter",
				"prettierd",
				"gofumpt",
				"goimports-reviser",
				"delve",
			},
		})
	end,
}
