require("harpoon").setup({
	global_settings = {
		save_on_change = true,
		excluded_filetypes = { "*.o" },
		enter_on_sendcmd = true,
		tmux_autoclose_windows = true,
		mark_branch = true,
	},
	menu = { width = vim.api.nvim_win_get_width(0) - 4 },
})
