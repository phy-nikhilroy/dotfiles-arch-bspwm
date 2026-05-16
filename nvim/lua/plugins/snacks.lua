return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		terminal = {
			enabled = true,
			win = {
				position = "float",
				width = 0.8,
				height = 0.8,
				border = "rounded",
			},
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
				keys = {
					{ icon = ">", key = "f", desc = "Find File",    action = ":lua require('fzf-lua').files()" },
					{ icon = ">", key = "r", desc = "Recent Files", action = ":lua require('fzf-lua').oldfiles()" },
					{ icon = ">", key = "g", desc = "Grep Text",    action = ":lua require('fzf-lua').live_grep()" },
					{ icon = ">", key = "n", desc = "New File",     action = ":ene | startinsert" },
					{ icon = ">", key = "q", desc = "Quit",         action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "recent_files", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
