vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.termguicolors = true

-- disable sql complete
vim.g.loaded_sql_completion = 1
vim.g.omni_sql_no_default_mappings = 1

vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
	.. ",a:blinkwait400-blinkoff400-blinkon400-Cursor/lCursor"
	.. ",sm:block-blinkwait400-blinkoff400-blinkon400"

vim.o.number = true -- @todo is this needed since I only use relative?
vim.o.relativenumber = true
vim.o.mouse = "" -- disable mouse mode
vim.o.showmode = false -- mode is already in the statusline
vim.schedule(function() -- same as above but with a delay
	vim.o.clipboard = "unnamedplus"
end)
vim.o.breakindent = true
vim.o.undofile = true -- save undo history to file
vim.o.ignorecase = true -- ignore case when searching unless a capital letter is used
vim.o.smartcase = true
vim.o.signcolumn = "yes" -- sign column always visible
vim.o.updatetime = 300 -- reduce the time to save swap files
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
vim.o.splitright = true -- open new split to the right
vim.o.splitbelow = true -- open new split below
vim.o.inccommand = "split" -- show live preview of substitution
vim.o.cursorline = true -- highlight the current line
vim.o.scrolloff = 10 -- keep 10 lines above and below the cursor
vim.o.wrap = false -- don't wrap based on the window size

-- highlight search results but clear on <Esc>
vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

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
	checker = { enabled = true },
	spec = {
		{ import = "plugins" },
	},
	-- "tpope/vim-sleuth", -- detect tabstop and shiftwidth
	-- { "numToStr/Comment.nvim", opts = {} }, -- gc to comment visual lines
	-- "tpope/vim-fugitive",
})
