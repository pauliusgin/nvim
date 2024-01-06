return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<cr>", 
        { noremap = true, silent = true })
    end,
}
