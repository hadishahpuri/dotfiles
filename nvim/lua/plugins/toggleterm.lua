return {
    "akinsho/toggleterm.nvim",
    version = "*", -- Use the latest stable version
    lazy = false,
    opts = {
        -- Configuration options for ToggleTerm
        size = 20,
        open_mapping = [[<leader>;]], -- Example mapping to toggle the terminal
        direction = "horizontal",     -- or "horizontal", "vertical"
        insert_mappings = false,
        auto_scroll = false
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end,
}
