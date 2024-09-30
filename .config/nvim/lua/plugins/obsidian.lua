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
	end,
}
