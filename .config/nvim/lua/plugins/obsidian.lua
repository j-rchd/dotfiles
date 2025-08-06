return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local opts = {
			-- Path to my obsidian folder
			disable_frontmatter = true,
			workspaces = {
				{
					name = "Main vault",
					path = "~/Documents/obsidian/obsidian-vault",
				},
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			notes_subdir = "Personal/Unsorted",
			new_notes_location = "notes_subdir",
		}
		require("obsidian").setup(opts)
		vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
		-- move file in current buffer to zettelkasten folder
		vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /home/joel/Documents/obsidian/obsidian-vault/Personal/Sorted<cr>:bd<cr>")
		-- delete file in current buffer
		vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")

	end,
}
