return {
    {'williamboman/mason.nvim',
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        lsp_zero.extend_lspconfig()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "html",
                "cssls",
                "emmet_language_server",
                "emmet_ls",

            },
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end
},

{'williamboman/mason-lspconfig.nvim'},

{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

{'neovim/nvim-lspconfig'},

{'hrsh7th/cmp-nvim-lsp'},

{'hrsh7th/nvim-cmp'},

{'L3MON4D3/LuaSnip'},

}
