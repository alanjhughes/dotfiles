local snip_status_ok, telescope = pcall(require, "telescope")
if not snip_status_ok then
	return
end

telescope.setup()
