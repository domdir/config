local wezterm = require 'wezterm'
local home_path = os.getenv("HOME")

local launch_menu = {}

table.insert(launch_menu, {
  label = "config",
  cwd = home_path .. "/config",
})

local pfile = io.popen("dir -1 ~/repos")
for dir in pfile:lines() do
  table.insert(launch_menu, {
    label = dir,
    cwd = home_path .. "/repos/" .. dir,
  })
end
pfile:close()

local keys = {
  { key = "c", mods = "LEADER", action=wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "x", mods = "LEADER", action=wezterm.action.CloseCurrentTab{confirm=false} },
  { key = "<", mods = "LEADER", action=wezterm.action.MoveTabRelative(-1) },
  { key = ">", mods = "LEADER", action=wezterm.action.MoveTabRelative(1) },
  { key = "s", mods = "LEADER", action=wezterm.action.SpawnWindow },
  { key = "p", mods = "LEADER", action=wezterm.action.ShowLauncher },
  { key = "z", mods = "LEADER", action=wezterm.action.ShowDebugOverlay },
  { key = "d", mods = "LEADER", action=wezterm.action.SwitchToWorkspace{
    name = "default",
  } },
  { key = "+", mods = "CTRL", action=wezterm.action.IncreaseFontSize },
  { key = "-", mods = "CTRL", action=wezterm.action.DecreaseFontSize },
  { key = "0", mods = "CTRL", action=wezterm.action.ResetFontSize },
  { key = "Space", mods = "CTRL", action=wezterm.action.ActivateCopyMode },
  { key = "c", mods = "CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard") },
}
for i = 1, 5 do
  table.insert(keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i-1),
  })
end
for i, entry in ipairs(launch_menu) do
  if i <= 9 then
    table.insert(keys, {
      key = tostring(i),
      mods = "CTRL",
      action = wezterm.action.SwitchToWorkspace{
        name = entry.label,
        spawn = entry,
      },
    })
  else
    local fi = i - 9
    if fi <= 12 then
      table.insert(keys, {
        key = "F" .. tostring(i),
        mods = "CTRL",
        action = wezterm.action.SwitchToWorkspace{
          name = entry.label,
          spawn = entry,
        },
      })
    end
  end
end

return {
  default_cwd = home_path .. "/repos",
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 18.0,
  color_scheme = "tokyonight-storm",
  launch_menu = launch_menu,
  tab_bar_at_bottom = true,
  leader = { key="z", mods="CTRL", timeout_milliseconds=1000 },
  keys = keys,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_frame = {
    active_titlebar_bg = "#24283b",
    inactive_titlebar_bg = "#24283b",
  },
  colors = {
    tab_bar = {
      inactive_tab_edge = "#9ece6a",
      active_tab = {
        bg_color = "#9ece6a",
        fg_color = "#24283b",
      },
      inactive_tab = {
        bg_color = "#7aa2f7",
        fg_color = "#24283b",
      },
      new_tab = {
        bg_color = "#7aa2f7",
        fg_color = "#24283b",
      },
    },
  },
}
