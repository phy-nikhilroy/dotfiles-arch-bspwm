return {
	{
		"marcinjahn/gemini-cli.nvim",
		dependencies = { "folke/snacks.nvim" },
		cmd = "Gemini",
		keys = {
			{ "<leader>ag", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini AI" },
			{ "<leader>aa", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
		},
		config = function()
			require("gemini_cli").setup({
				gemini_cmd = "gemini",
				auto_reload = true,
			})
		end,
	},
}
