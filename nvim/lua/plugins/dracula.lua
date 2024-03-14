return {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        require('dracula').setup(opts)
        vim.cmd.colorscheme 'dracula'
    end,
    opts = {
        transparent = true,
    },
}
