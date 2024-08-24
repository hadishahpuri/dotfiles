return {
    "maxmx03/solarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("solarized").setup({
            enables = {
                editor = true,
                syntax = true,

                -- PLUGINS
                bufferline = true,
                cmp = false, -- disabled
                diagnostic = true,
                indentblankline = true,
                lsp = true,
                lspsaga = false, -- disabled
                navic = true,
                semantic = true,
                telescope = true,
                tree = false, -- disabled
                treesitter = true,
            },
        })
        -- vim.o.background = 'light' -- or 'light'
        -- vim.cmd [[ colorscheme solarized ]]
    end
}
