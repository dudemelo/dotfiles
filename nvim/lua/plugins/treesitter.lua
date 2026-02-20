return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local filetypes = {
			"bash",
			"c",
			"css",
			"diff",
			"dockerfile",
			"gitignore",
			"go",
			"java",
			"javascript",
			"jsdoc",
			"helm",
			"html",
			"lua",
			"php",
			"phpdoc",
			"make",
			"markdown",
			"markdown_inline",
			"ocaml",
			"python",
			"query",
			"rust",
			"sql",
			"terraform",
			"tsx",
			"twig",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		}
		require("nvim-treesitter").install(filetypes)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
