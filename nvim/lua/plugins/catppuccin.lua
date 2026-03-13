return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = true,
			},
			styles = {
				keywords = { "bold" },
				types = { "bold" },
			},
			-- color_overrides = {
			-- 	mocha = {
			-- 		-- base = "#000000",
			-- 		-- mantle = "#000000",
			-- 		-- crust = "#000000",
			-- 	},
			-- },
			integrations = {
				copilot_vim = true,
				mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
