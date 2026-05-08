return {
	{
		"marcinjahn/gemini-cli.nvim",
		dependencies = {
			"folke/snacks.nvim", -- Add this missing piece
		},
		cmd = "Gemini",
		keys = {
			{ "<leader>ag", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini AI" },
			{ "<leader>aa", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
		},
		config = function()
			-- Initializing Snacks is required for the terminal to work
			require("snacks").setup({
				terminal = { enabled = true },
			})

			require("gemini_cli").setup({
				gemini_cmd = "gemini",
				auto_reload = true,
			})
		end,
	},
}
