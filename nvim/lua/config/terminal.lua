vim.keymap.set("n", "<leader>t", function()
	Snacks.terminal.toggle()
end, { desc = "Toggle floating terminal" })
