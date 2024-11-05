return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				PATH = "append",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "Q", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set('gr', require('telescope.builtin').lsp_references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local venv = os.getenv("PYENV_VERSION")
			if venv then
				local venv_path = os.getenv("HOME") .. "/.pyenv/versions/" .. venv
				PY_PATH = venv_path .. "/bin/python3"
			else
				PY_PATH = os.getenv("HOME") .. "/.pyenv/shims/python3"
			end
			local null_ls = require("null-ls")
			null_ls.setup({
				debug = true,
				sources = {
					null_ls.builtins.diagnostics.pylint.with({
						env = function(PY_PATH)
							return { PYTHONPATH = PY_PATH }
						end,
					}),
					null_ls.builtins.diagnostics.mypy.with({
						extra_args = function()
                			return { "--python-executable", PY_PATH }
            			end,
					}
					),
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.stylua,
				},
			})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
		end,
	},
}
