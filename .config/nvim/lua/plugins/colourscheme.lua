return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			custom_highlights = {
				TelescopeBorder = { fg = "#1e66f5" },
			},
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
