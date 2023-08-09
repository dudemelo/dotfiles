return {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function(_, opts)
        require('dracula').setup(opts)
        vim.cmd.colorscheme 'dracula'
    end,
    opts = {
        transparent_bg = true,
    },
}
