return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local pydebug = require("dap-python")
		local venv_path = os.getenv("PYENV_VERSION")
		if venv_path then
			local py_path = os.getenv("HOME") .. "/.pyenv/versions/"
			pydebug.setup(py_path .. venv_path .. "/bin/python3")
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
	end,
}
