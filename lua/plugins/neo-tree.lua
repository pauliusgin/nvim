return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                width = 30,
                mappings = {
                    ["z"] = "close_all_nodes",
                    ["Z"] = "expand_all_nodes",
                    ["s"] = "open_vsplit",
                    ["S"] = "open_split",
                    ["."] = "set_root",
                    ["H"] = "toggle_hidden",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_hidden = true, -- fow Windows
                    hide_by_name = {
                        "undo",
                    },
                },
            },
        })
    end,
}
