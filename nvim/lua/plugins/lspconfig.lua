return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.lsp.set_log_level("OFF")
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				local builtin = require("telescope.builtin")
				map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
				map("gr", builtin.lsp_references, "[G]oto [R]eferences")
				map("gI", builtin.lsp_implementations, "[G]oto [I]mplementations")
				map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinitions")
				map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					-- local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })
					-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					--     buffer = event.buf,
					--     group = highlight_augroup,
					--     callback = vim.lsp.buf.document_highlight,
					-- })
					-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					--     buffer = event.buf,
					--     group = highlight_augroup,
					--     callback = vim.lsp.buf.clear_references,
					-- })
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			clangd = {},
			intelephense = {},
			dockerls = {},
			gopls = {},
			hadolint = {},
			html = { filetypes = { "html", "twig", "hbs" } },
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			-- markdownlint = {},
			phpactor = {},
			prettier = {},
			pyright = {},
			rust_analyzer = {},
			stylua = {},
			terraformls = {},
			tflint = {},
			yamlls = {},
		}

		-- ensure servers and tools above are installed
		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		local gdscript_config = {
			capabilities = capabilities,
			settings = {},
		}
		require("lspconfig").gdscript.setup(gdscript_config)
	end,
}
