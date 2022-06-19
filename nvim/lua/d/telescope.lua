local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {}

telescope.load_extension("fzf")
telescope.load_extension("harpoon")
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")
