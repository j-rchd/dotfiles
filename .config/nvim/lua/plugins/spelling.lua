return {
	"nvim-telescope/telescope.nvim",
	opts = function(_, opts)
		vim.opt.spell = true

		-- Replace word under cursor with 'text', stay in normal mode
		local function replace_word_in_normal_mode(word)
			-- select inner word and replace
			local keys = "ciw" .. word
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys .. "<Esc>", true, false, true), "n", false)
		end

		-- Toggle spell check
		local function toggle_spell_check()
			vim.opt.spell = not vim.opt.spell:get()
			print("Spell checking: " .. (vim.opt.spell:get() and "ON" or "OFF"))
		end

		-- Replace the current word with the best suggestion
		local function replace_with_best_suggestion()
			local word = vim.fn.expand("<cword>")
			local suggestions = vim.fn.spellsuggest(word, 1)
			if #suggestions > 0 then
				local best = suggestions[1]
				replace_word_in_normal_mode(best)
				print("Replaced '" .. word .. "' with '" .. best .. "'")
			else
				print("No spelling suggestions found for: " .. word)
			end
		end

		-- Spell check suggestions using Telescope
		local function spell_suggest()
			local word = vim.fn.expand("<cword>")
			local suggestions = vim.fn.spellsuggest(word, 10)
			if #suggestions == 0 then
				print("No suggestions")
				return
			end

			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local conf = require("telescope.config").values

			pickers
				.new({}, {
					prompt_title = "Spelling Suggestions",
					finder = finders.new_table({ results = suggestions }),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						local function replace_word()
							local entry = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							if entry and entry[1] then
								replace_word_in_normal_mode(entry[1])
							end
						end

						map("i", "<CR>", replace_word)
						map("n", "<CR>", replace_word)
						return true
					end,
				})
				:find()
		end

		-- Keymaps
		vim.keymap.set("n", "<leader>zs", spell_suggest, { desc = "Telescope spell suggestions" })
		vim.keymap.set("n", "<leader>zb", replace_with_best_suggestion, { desc = "Replace word with best suggestion" })
		vim.keymap.set("n", "<leader>zo", toggle_spell_check, { desc = "Toggle spell check" })
	end,
}
