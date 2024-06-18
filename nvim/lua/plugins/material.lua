return {
    'marko-cerovac/material.nvim',
    branch = 'main',
    lazy = false,
    enabled = false,
    config = function()
        require("material").setup({
            styles = { -- Give comments style such as bold, italic, underline etc.
                comments = { --[[ italic = true ]] },
                strings = { --[[ bold = true ]] },
                keywords = { --[[ underline = true ]] },
                functions = { --[[ bold = true, undercurl = true ]] },
                variables = {},
                operators = {},
                types = {},
            },
        })
        vim.cmd 'colorscheme material'
        vim.g.material_style = "Palenight"
    end
}
