local generalSettingsGroup = vim.api.nvim_create_augroup("General settings", { clear = true })

vim.api.nvim_create_user_command(
	"Config",
	":exe 'edit ' . stdpath('config') . '/lua/init.lua'",
	{ bang = true, nargs = 0 }
)
vim.api.nvim_create_user_command(
	"Reload",
	":exe 'source ' . stdpath('config') . '/init.lua'",
	{ bang = true, nargs = 0 }
)

-- Aliases for different file types
vim.api.nvim_create_user_command("JSX", ":set ft = javascript.jsx", {})
vim.api.nvim_create_user_command("JS", ":set ft = javascript", {})
vim.api.nvim_create_user_command("HTML", ":set ft = html", {})
vim.api.nvim_create_user_command("PHP", ":set ft = php", {})
vim.api.nvim_create_user_command("SQL", ":set ft = sql", {})

-- Fold/Unfold saving
local auAutoSaveFolds = vim.api.nvim_create_augroup("AutoSaveFolds", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	group = auAutoSaveFolds,
	pattern = "*.*",
	command = "mkview 1",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = auAutoSaveFolds,
	pattern = "*.*",
	command = "silent! loadview 1",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = generalSettingsGroup,
	pattern = "*.blade.php",
	command = "setlocal ft=html",
})
