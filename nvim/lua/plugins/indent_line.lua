return {
	{
		"nvimdev/indentmini.nvim",
		config = function()
			require("indentmini").setup({ only_current = true })
			vim.cmd.highlight("IndentLineCurrent guifg=#4c4f69")
		end,
	},
}
