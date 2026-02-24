return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = "<C-a>",
                -- jump_prev = "[[",
                -- jump_next = "]]",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
        config = function()
            require("copilot").setup({})
        end,
    },
}
