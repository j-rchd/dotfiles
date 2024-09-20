-- This file is for configuratiobs of plugins related to moving through the file system
-- e.g Telescope, neotree etc
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("dap")
			local builtin_tel = require("telescope.builtin")
			-- Keymapping
			-- Fuzzy find files in project
			vim.keymap.set("n", "<C-f>", builtin_tel.find_files, {})
			-- Grep through project
			vim.keymap.set("n", "<leader>fg", builtin_tel.live_grep, {})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- Treesitter config
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "python", "markdown", "markdown_inline" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- File tree explorer
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>")
		end,
	},
}
