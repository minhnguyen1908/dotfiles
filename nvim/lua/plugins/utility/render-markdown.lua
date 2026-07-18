-- File: lua/plugins/utility/render-markdown.lua
-- Configures markdown visual rendering cleanly without mixing keymap logic

return {
	-- Main plugin declaration for modern markdown rendering[cite: 1]
	"MeanderingProgrammer/render-markdown.nvim", --[cite: 1]
	-- Standard requirements for processing nodes and icons[cite: 1]
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, --[cite: 1]
	-- Lazy load when opening markdown buffers[cite: 1]
	ft = { "markdown" }, --[cite: 1]
	config = function()
		-- Initializes rendering plugin configurations[cite: 1]
		require("render-markdown").setup({
			-- Keep your default aesthetic alignments here
		})

		-- NOTE: The buffer-local 'gd' keymap has been safely migrated
		-- to the centralized lua/keymaps.lua file via Autocommands!
	end,
}
