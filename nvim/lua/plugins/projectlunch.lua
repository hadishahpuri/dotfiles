return {
    'sheodox/projectlaunch.nvim',
    branch = 'main',
    lazy = false,
    config = function()
        local projectlaunch = require('projectlaunch')
        vim.keymap.set('n', "<leader>ll", projectlaunch.toggle_main_menu,
            { noremap = true, expr = false, buffer = false })
    end,
}
