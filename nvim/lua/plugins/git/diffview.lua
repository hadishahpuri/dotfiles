return {
    'sindrets/diffview.nvim',
    branch = 'main',
    cmd = 'DiffviewOpen',
    config = function()
        require 'diffview'.setup({
            diff_binaries = false,
            use_icons = true,
            watch_index = true,
            icons = { -- Only applies when use_icons is true.
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
            },
            view = {
                default = {
                    -- Config for changed files, and staged files in diff views.
                    layout = "diff2_horizontal",
                    disable_diagnostics = false,
                    winbar_info = false
                },
                merge_tool = {
                    -- Config for conflicted files in diff views during a merge or rebase.
                    layout = "diff3_mixed",
                    disable_diagnostics = true,
                    winbar_info = true
                },
            }
        })
    end
}
