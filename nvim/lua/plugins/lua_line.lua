return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- 1. Define your custom monochrome color palette
		local colors = {
			black = "#000000",
			dark = "#1c1c1c",
			gray = "#585858",
			light = "#b2b2b2",
			white = "#ffffff",
			none = "NONE", -- Allows terminal background to show through
		}

		-- 2. Map those colors to Lualine's modes
		local custom_monochrome = {
			normal = {
				a = { bg = colors.dark, fg = colors.white, gui = "bold" },
				b = { bg = colors.none, fg = colors.gray },
				c = { bg = colors.none, fg = colors.light },
			},
			insert = {
				-- Invert black and white for Insert mode so it visually pops without using color
				a = { bg = colors.white, fg = colors.black, gui = "bold" },
				b = { bg = colors.none, fg = colors.gray },
				c = { bg = colors.none, fg = colors.light },
			},
			visual = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.none, fg = colors.gray },
				c = { bg = colors.none, fg = colors.light },
			},
			replace = {
				a = { bg = colors.light, fg = colors.black, gui = "bold" },
				b = { bg = colors.none, fg = colors.gray },
				c = { bg = colors.none, fg = colors.light },
			},
			command = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.none, fg = colors.gray },
				c = { bg = colors.none, fg = colors.light },
			},
			inactive = {
				a = { bg = colors.none, fg = colors.dark },
				b = { bg = colors.none, fg = colors.dark },
				c = { bg = colors.none, fg = colors.gray },
			},
		}

		-- 3. Apply the custom theme to your existing minimal layout
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = custom_monochrome, -- We pass your custom table here instead of "auto"
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
