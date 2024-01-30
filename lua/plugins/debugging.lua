return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-go").setup()
		require("dap-python").setup()
		dapui.setup()

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

		dap.adapters.cpptools = {
			type = "executable",
			name = "cpptools",
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
			args = {},
			attach = {
				pidProperty = "processId",
				pidSelect = "ask",
			},
		}
		dap.configurations.c = {
			{
				name = "Launch",
				type = "cpptools",
				request = "launch",
				program = "${workspaceFolder}/main",
				cwd = "${workspaceFolder}",
				stopOnEntry = true,
				args = {},
				runInTerminal = false,
			},
		}
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dr", dap.continue, {})
	end,
}
