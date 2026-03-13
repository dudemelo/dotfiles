return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
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
			"make",
			"markdown",
			"markdown_inline",
			"ocaml",
			"php",
			"phpdoc",
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

		-- Install parsers asynchronously (no-op if already installed).
		require("nvim-treesitter").install(parsers)

		-- Enable treesitter highlighting via Neovim's built-in support.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(event)
				pcall(vim.treesitter.start, event.buf)
			end,
		})
	end,
}
