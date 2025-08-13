return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			styles = {
				keywords = { bold = true },
			},
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
