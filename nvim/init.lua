vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.termguicolors = true -- enables true color
vim.o.laststatus = 2 -- always show status line
vim.o.number = true -- @todo is this needed since I only use relative?
vim.o.relativenumber = true
vim.o.mouse = "" -- disable mouse mode
vim.o.showmode = true -- mode is already in the statusline
vim.schedule(function() -- sync clipboard with OS
	vim.o.clipboard = "unnamedplus"
end)
vim.o.breakindent = true
vim.o.undofile = true -- save undo history to file
vim.o.ignorecase = true -- ignore case on search unless there's a uppercase letter
vim.o.smartcase = true
vim.o.signcolumn = "yes" -- sign column always visible
vim.o.updatetime = 300 -- reduce the time to save swap files
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
vim.o.splitright = true -- open new split to the right
vim.o.splitbelow = true -- open new split below
vim.o.list = true
vim.opt.listchars = { lead = "·", nbsp = "␣", tab = "» ", trail = "·" }
vim.o.inccommand = "split" -- show live preview of substitution
vim.o.cursorline = false -- highlight the current line
vim.o.scrolloff = 5 -- lines to keep above and below to start scrolling
vim.o.wrap = false -- don't wrap based on the window size

-- highlight search results but clear on <Esc>
vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = true,
	virtual_lines = false,
	jumps = { float = true },
})

-- shortcut to return to the file explorer
vim.keymap.set("n", "<leader>ex", "<Cmd>Explore<CR>")

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves line up" })

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- organize imports on save a go file
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Organize imports on save a go file",
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})

-- install lazy.nvim plugin manager
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- ocnfigured and install plugins
require("lazy").setup({
	{
		"NMAC427/guess-indent.nvim",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_enabled = false
		end,
	},
	{ import = "plugins" },
})
