return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		formatters = {
			prettier_md = {
				command = "prettier",
				args = {
					"--stdin-filepath",
					"$FILENAME",
					"--parser",
					"markdown",
					"--print-width",
					"80",
					"--prose-wrap",
					"always",
				},
				stdin = true,
			},
		},
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { "prettier" },
			go = { "gofumpt" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier_md" },
			sql = { "pg_format" },
			terraform = { "terraform_fmt" },
			toml = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
		},
	},
}
