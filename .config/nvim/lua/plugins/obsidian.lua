return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local opts = {
			-- Path to my obsidian folder
			dir = "~/Documents/obsidian/obsidian-vault"
			}
		require("obsidian").setup(opts)
	end,
}
