return {
	{
		-- Automatically add closing pair when opening a bracket etc
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		-- Surround text object with a given character
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup({
			-- the only thing I want to change is the mapping for replace
			-- the rest is default
			mappings = {
				replace = 'sc',
				}
			})
		end,
	},
	{
		-- Comment out lines from Normal and Visual mode
		"echasnovski/mini.comment",
		version = "*",
		config = function()
			require("mini.comment").setup()
		end,
	},
}
