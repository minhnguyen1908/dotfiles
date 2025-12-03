-- File: lua/plugins/utility/nvim-dap.lua
return {
	{
		-- Main DAP plugin
		"mfussenegger/nvim-dap",
		dependencies = {
			-- A fancy UI for DAP
			"rcarriga/nvim-dap-ui",
			-- Required by dap-ui
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup() -- Setup nvim-dap-go
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Launch package",
						request = "launch",
						program = "${workspaceFolder}",
					},
					{
						type = "go",
						name = "Launch file",
						request = "launch",
						program = "${file}",
					},
				},
			}) -- Setup nvim-dap-go

			-- Auto open/close the UI when debugging
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
