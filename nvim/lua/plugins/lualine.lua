return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
    },
    opts = {
        options = {
            icons_enabled = true,
            refresh = {
                statusline = 1000,
            },
        },
    },
}
