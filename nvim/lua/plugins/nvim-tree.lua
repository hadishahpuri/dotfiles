return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    branch = 'master',
    keys = {
        { '<Leader>e', '<cmd>NvimTreeFindFileToggle<CR>' },
        { '<C-Right>', '<cmd>NvimTreeResize +5<CR>' },
        { '<C-Left>',  '<cmd>NvimTreeResize -5<CR>' },
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end
}
