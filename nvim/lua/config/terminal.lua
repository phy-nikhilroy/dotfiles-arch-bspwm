local function toggle_terminal()
	Snacks.terminal.toggle()
end

vim.keymap.set("n", "<leader>t", toggle_terminal, { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>t", toggle_terminal, { desc = "Toggle floating terminal" })
