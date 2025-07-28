return {
    "akinsho/toggleterm.nvim",
    version = "*", -- Use the latest stable version
    lazy = false,
    opts = {
        -- Configuration options for ToggleTerm
        size = 20,
        open_mapping = [[<leader>;]], -- Example mapping to toggle the terminal
        direction = "horizontal",     -- or "horizontal", "vertical"
        -- Add more options as needed (e.g., shade_filetypes, highlights)
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end,
}
