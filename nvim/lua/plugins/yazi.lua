---@type LazySpec
return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            "<leader>e",
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
        {
            -- NOTE: this requires a version of yazi that includes
            -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
            '<c-up>',
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
}
