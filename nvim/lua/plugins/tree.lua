return {
	"nvim-tree/nvim-tree.lua",
	-- Devicons dependency removed from here as well

	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
				ignore = false,
			},
			-- This new block forcefully disables all visual icons in the tree
			renderer = {
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end,
}
