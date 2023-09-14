vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazyPath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazyPath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazyPath,
    }
end
vim.opt.rtp:prepend(lazyPath)

require('lazy').setup({
    { import = 'plugins' },
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',
    'github/copilot.vim',
    { 'numToStr/Comment.nvim', config = true },
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
            show_current_context = true,
        }
    },
})

vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.o.mouse = ''
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.backup = false
vim.o.swapfile = false
vim.o.completeopt = 'menuone,preview'
vim.o.termguicolors = true
vim.o.scrolloff = 20

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Leader>ex', ':Ex<CR>', { desc = 'Ex mode' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Moves line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Moves line up' })
vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { desc = 'Format' })
-- run the current go file
vim.keymap.set('n', '<Leader>go', ':!cd %:p:h; go run %:t<CR>', { desc = 'Run the current Go file' })
vim.keymap.set('n', '<Leader>gt', ':!cd %:p:h; go test %:p:h<CR>', { desc = 'Run the tests for the current Go file' })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
})
