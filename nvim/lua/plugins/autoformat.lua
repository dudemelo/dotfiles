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
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                -- lsp_format = "fallback",
            }
        end,
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
            typescript = { "prettier" },
            yaml = { "prettier" },
        },
        formatters = {
            clang_format = function()
                return {
                    args = { "--style", "{ColumnLimit: 0}" },
                }
            end,
        },
    },
}
