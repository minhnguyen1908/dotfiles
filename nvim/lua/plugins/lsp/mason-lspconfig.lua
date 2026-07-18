-- File: lua/plugins/lsp/mason-lspconfig.lua
-- Bridges mason.nvim with the nvim-lspconfig plugin, making it easier to set up LSP servers.
return {
	-- Specifies the primary modern plugin repository for mason-lspconfig
	"mason-org/mason-lspconfig.nvim",
	-- Declares prerequisite plugins that must load before this one can initialize
	dependencies = {
		-- Installs the core mason manager plugin and initializes it with default empty options
		{ "mason-org/mason.nvim", opts = {} },
		-- Installs the standard collection of quickstart configurations for the Neovim LSP client
		"neovim/nvim-lspconfig",
	},
	-- Defines the configuration options passed directly into the plugin's setup function
	opts = {
		-- A hardcoded list of language servers that Mason will automatically download and update
		ensure_installed = {
			"dockerls", -- Dockerfile language server
			"docker_compose_language_service", -- Docker Compose configuration language server
			"lua_ls", -- Lua language server for your Neovim configuration hacking
			"bashls", -- Bash/Zsh shell script language server
			"jsonls", -- JSON structured data language server
			"yamlls", -- YAML language server for Kubernetes manifests and Ansible playbooks
			"pyright", -- Python static type checker and language server
			"html", -- HTML structure language server
			"cssls", -- CSS style sheet language server
			"marksman", -- Marksman LSP providing cross-file anchor links navigation
			"sqlls", -- SQL language server for Oracle and MS SQL Server database scripting
			"ts_ls", -- TypeScript/JavaScript language server
			"texlab", -- LaTeX document management server
			"gopls", -- Go language server for high-performance automation tools
			"terraformls", -- Terraform IaC language server for your cloud infrastructure
			"openscad_lsp", -- OpenSCAD language server for custom split keyboard designs
		},

		-- NEW / UPDATED SECTION: Clean, modern handlers block executed natively by the plugin setup
		handlers = {
			-- The default fallback handler function automatically invoked for every installed server
			function(server_name)
				-- Safely initializes the language server using the modern lspconfig reference
				require("lspconfig")[server_name].setup({})
			end,

			-- Dedicated override handler targeting marksman for clean anchor links functionality
			["marksman"] = function()
				-- Safely configures marksman without invoking legacy framework pathways
				require("lspconfig").marksman.setup({
					-- Ready for workspace configuration or custom on_attach hooks if needed
				})
			end,
		},
	},
}
