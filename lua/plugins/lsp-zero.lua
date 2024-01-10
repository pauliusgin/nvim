return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true })<cr>", opts)
                vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opts)
                vim.keymap.set(
                    "n",
                    "<leader>df",
                    vim.diagnostic.open_float,
                    { desc = "Open floating diagnostic message" }
                )
            end)

            lsp_zero.extend_lspconfig()

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "html",
                    "cssls",
                    "emmet_language_server",
                    "emmet_ls",
                },
                automatic_installation = true,
                handlers = {
                    lsp_zero.default_setup,
                },
            })

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer",  keyword_length = 3 },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                matching = {
                    disallow_fuzzy_matching = true,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                view = {
                    docs = {
                        auto_open = false,
                    },
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-d>"] = function()
                        if cmp.visible_docs() then
                            cmp.close_docs()
                        else
                            cmp.open_docs()
                        end
                    end,
                }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")["lua_ls"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["tsserver"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["html"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["cssls"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["emmet_language_server"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["emmet_ls"].setup({
                capabilities = capabilities,
            })
        end,
    },

    { "williamboman/mason.nvim" },

    { "williamboman/mason-lspconfig.nvim" },

    { "neovim/nvim-lspconfig" },

    { "hrsh7th/cmp-nvim-lsp" },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    { "saadparwaiz1/cmp_luasnip" },

    { "hrsh7th/cmp-path" },

    { "hrsh7th/cmp-cmdline" },

    { "hrsh7th/cmp-buffer" },

    { "hrsh7th/nvim-cmp" },
}
