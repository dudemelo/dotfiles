return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = true,
				shade = "light",
				percentage = 0.20,
			},
			integrations = {
				cmp = true,
				copilot_vim = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				mason = true,
				treesitter = true,
			},
			styles = {
				keywords = { "bold" },
				types = { "bold" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
