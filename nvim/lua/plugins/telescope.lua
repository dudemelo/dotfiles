return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = { theme = "ivy" },
				git_files = { theme = "ivy" },
				live_grep = { theme = "ivy" },
				diagnostics = { theme = "ivy" },
				oldfiles = { theme = "ivy" },
				buffers = { theme = "ivy" },
				lsp_references = { theme = "ivy" },
				lsp_document_symbols = { theme = "ivy" },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "[S]earch [F]iles without .gitignore" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", function()
			builtin.live_grep({
				additional_args = function()
					return { "--no-ignore", "--hidden", "-F", "--glob", "!.git/*" }
				end,
			})
		end, { desc = "[S]earch by [G]rep without .gitignore" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
			callback = function(event)
				local buf = event.buf
				vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })
				vim.keymap.set(
					"n",
					"gri",
					builtin.lsp_implementations,
					{ buffer = buf, desc = "[G]oto [I]mplementation" }
				)
				vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })
				vim.keymap.set(
					"n",
					"gO",
					builtin.lsp_document_symbols,
					{ buffer = buf, desc = "Open Document Symbols" }
				)
				vim.keymap.set(
					"n",
					"gW",
					builtin.lsp_dynamic_workspace_symbols,
					{ buffer = buf, desc = "Open Workspace Symbols" }
				)
				vim.keymap.set(
					"n",
					"grt",
					builtin.lsp_type_definitions,
					{ buffer = buf, desc = "[G]oto [T]ype Definition" }
				)
			end,
		})

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<C-p>", function()
			builtin.git_files({ show_untracked = true })
		end, { desc = "Search git files" })
	end,
}
