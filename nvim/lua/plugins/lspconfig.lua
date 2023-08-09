return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true, },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim',       tag = 'legacy', config = true, event = 'LspAttach' },
        'folke/neodev.nvim',
    },
}
