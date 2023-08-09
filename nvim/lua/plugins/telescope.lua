return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                local telescope = require('telescope')
                telescope.setup {
                    defaults = {
                        mappings = {
                            i = {
                                ['<C-u>'] = false,
                                ['<C-d>'] = false,
                            }
                        },
                    },
                }

                pcall(telescope.load_extension, 'fzf')

                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<Leader>?', builtin.oldfiles, { desc = 'Find recently opned files' })
                vim.keymap.set('n', '<Leader><Space>', builtin.buffers,
                    { desc = 'Find existing buffers' })
                vim.keymap.set('n', '<Leader>/', function()
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                        winblend = 10,
                        previewer = false,
                    })
                end, { desc = 'Fuzzily search in current buffer' })

                vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search git files' })
                vim.keymap.set('n', '<Leader>sf', builtin.find_files, { desc = 'Search files' })
                vim.keymap.set('n', '<Leader>sh', builtin.help_tags, { desc = 'Search help' })
                vim.keymap.set('n', '<Leader>sw', builtin.grep_string, { desc = 'Search current word' })
                vim.keymap.set('n', '<Leader>sg', builtin.live_grep, { desc = 'Search by grep' })
                vim.keymap.set('n', '<Leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
                return vim.fn.executable 'make' == 1
            end
        },
    },
}
