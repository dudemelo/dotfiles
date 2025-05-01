vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.termguicolors = true

-- vim.opt.guicursor = "" -- block cursor always
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
	.. ",a:blinkwait400-blinkoff400-blinkon400-Cursor/lCursor"
	.. ",sm:block-blinkwait400-blinkoff400-blinkon400"

vim.opt.number = true -- @todo is this needed since I only use relative?
vim.opt.relativenumber = true
vim.opt.mouse = "" -- disable mouse mode
vim.opt.showmode = false -- mode is already in the statusline
vim.schedule(function() -- same as above but with a delay
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true -- save undo history to file
vim.opt.ignorecase = true -- ignore case when searching unless a capital letter is used
vim.opt.smartcase = true
vim.opt.signcolumn = "yes" -- sign column always visible
vim.opt.updatetime = 300 -- reduce the time to save swap files
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete
vim.opt.splitright = true -- open new split to the right
vim.opt.splitbelow = true -- open new split below
vim.opt.list = false -- enable listchars
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split" -- show live preview of substitution
vim.opt.cursorline = true -- highlight the current line
vim.opt.scrolloff = 10 -- keep 10 lines above and below the cursor
vim.opt.wrap = false -- don't wrap based on the window size

-- highlight search results but clear on <Esc>
vim.opt.hlsearch = true
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- disable space key in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

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
		vim.highlight.on_yank()
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
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- ocnfigured and install plugins
require("lazy").setup({
	"tpope/vim-sleuth", -- detect tabstop and shiftwidth
	{ "numToStr/Comment.nvim", opts = {} }, -- gc to comment visual lines
	{ import = "plugins" },
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb", -- @todo what is this about?
	{ "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" } },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
