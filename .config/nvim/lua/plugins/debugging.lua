return {
	{"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local pydebug = require("dap-python")
		local venv_path = os.getenv("VIRTUAL_ENV")
		if venv_path then
			pydebug.setup(venv_path .."/bin/python3")
		else
			pydebug.setup()
		end
		dapui.setup({})

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
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>dr", dap.restart, {})
		vim.keymap.set("n", "<Leader>ds", dap.close, {})
		vim.keymap.set("n", "<Leader>dd", dap.disconnect, {})
		vim.keymap.set("n", "<Leader>duc", dapui.close, {})

	end,
	},
}

