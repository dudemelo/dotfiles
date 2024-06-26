return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "css",
            "dockerfile",
            "gitignore",
            "go",
            "java",
            "javascript",
            "jsdoc",
            "html",
            "lua",
            "php",
            "phpdoc",
            "make",
            "markdown",
            "ocaml",
            "python",
            "rust",
            "sql",
            "terraform",
            "tsx",
            "twig",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "yaml",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = {
            enable = true,
            disable = { "ruby" },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup(opts)
    end,
}
