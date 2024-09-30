-- vim.opt.termguicolors = false
vim.opt.termguicolors = true
vim.cmd([[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]])

-- I like relative line numbers
vim.cmd("set relativenumber")
-- Set some simple configurations for tab size (set to 4)
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")

-- set leader to space
vim.g.mapleader = " "

-- Map moving between panes to alt
vim.keymap.set("n", "<a-h>", "<c-w>h", {})
vim.keymap.set("n", "<a-j>", "<c-w>j", {})
vim.keymap.set("n", "<a-k>", "<c-w>k", {})
vim.keymap.set("n", "<a-l>", "<c-w>l", {})

-- Center the screen after scrolling up/down with Ctrl-u/d
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- yank line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Set conceallevel for Markdown files
vim.opt_local.conceallevel = 1

-- Command to use and format the note template when creating a new note in obsidian
-- Formats by removing the date from the title and replacing hyphens with spaces
local function note_function()
	vim.cmd("ObsidianTemplate note")
	vim.schedule(function()
		vim.cmd("normal! G")
		vim.cmd("normal! dd")

		local line = vim.fn.getline(".")
		local new_line = vim.fn.substitute(line, [[\(# \)[^_]*_]], [[\1]], "")
		new_line = vim.fn.substitute(new_line, "-", " ", "g")
		vim.fn.setline(".", new_line)

		-- vim.cmd([[silent! s/\(# \)[^_]*_/\\1/]])
		-- vim.cmd([[try | silent! s/-/ /g | catch | endtry]])
	end)
end
vim.keymap.set("n", "<leader>on", note_function)

-- Keymap to move obsidian notes into a new directory if accepted in review
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' ~/Documents/obsidian/obsidian-vault/Personal/Sorted<cr>:bd<cr>")
-- Keymap to delete notes if they are not accepted during review
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")

-- Remove the mouse and arrow keys
vim.cmd("set mouse=")

vim.cmd("noremap <Up> <Nop>")
vim.cmd("noremap <Down> <Nop>")
vim.cmd("noremap <Left> <Nop>")
vim.cmd("noremap <Right> <Nop>")
