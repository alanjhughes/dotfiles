local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"typescript",
		"javascript",
		"rust",
		"json",
		"css",
		"html",
		"bash",
		"lua",
		"vim",
		"ruby",
		"prisma",
		"python",
		"cpp",
		"kotlin",
		"swift",
	},
	sync_install = false,
	ignore_install = { "" },
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
