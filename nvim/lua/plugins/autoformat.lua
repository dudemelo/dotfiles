return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            c = { "clang_format" },
            cpp = { "clang_format" },
            css = { "prettier" },
            go = { "gofumpt" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            terraform = { "terraform_fmt" },
            toml = { "prettier" },
            typescript = { "prettier" },
            yaml = { "prettier" },
        },
    },
}
