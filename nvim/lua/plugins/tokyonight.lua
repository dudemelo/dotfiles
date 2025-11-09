return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			styles = {
				keywords = { bold = true },
			},
			on_colors = function(colors)
				colors.bg = "#000000"
			end,
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
