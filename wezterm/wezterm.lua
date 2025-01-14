local wezterm = require("wezterm")
local act = wezterm.action
local topbarColor = "#24273a"
local pallete = {
    "#D8EFD3",
    "#95D2B3",
    "#55AD9B",
    "#F1F8E8",
}

wezterm.on("update-status", function(window, pane)
    local window_dims = window:get_dimensions()
    local is_big_window = window_dims.pixel_width > 700
    local is_medium_window = window_dims.pixel_width > 500

    update_right(window, pane, is_big_window, is_medium_window)
    update_left(window, pane, is_big_window, is_medium_window)
end)

function update_right(window, pane, is_medium_window, is_big_window)
    local cells = {}
    local elements = {}
    local num_cells = 0
    local is_ssh = not (not pane:get_user_vars().SSH_ENV or pane:get_user_vars().SSH_ENV == "")
    local seperator = utf8.char(0xe0b6)

    local bg_colors = {
        pallete[2],
        pallete[3],
    }

    local fg_colors = {
        pallete[3],
        pallete[4],
    }

    -- Ssh Hostname
    if is_ssh then
        table.insert(cells, "󱘖 " .. pane:get_user_vars().SSH_ENV)
    end

    -- Datetime
    if is_big_window then
        local date = wezterm.strftime("%Y/%m/%d")
        table.insert(cells, date)
    end

    -- An entry for each battery (typically 0 or 1 battery)
    for _, b in ipairs(wezterm.battery_info()) do
        table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
    end

    while #cells > 0 do
        local cell = table.remove(cells, 1)
        push_to_topbar(elements, cell, num_cells, bg_colors, fg_colors, seperator, #cells == 0, true)
        num_cells = num_cells + 1
    end
    window:set_right_status(wezterm.format(elements))
end

function update_left(window, pane, is_medium_window, is_big_window)
    local cells = {}
    local elements = {}
    local num_cells = 0
    local seperator = utf8.char(0xe0ba)
    local bg_colors = {
        pallete[2],
    }

    local fg_colors = {
        pallete[4],
    }

    -- Title
    table.insert(cells, pane:get_title())

    while #cells > 0 do
        local cell = table.remove(cells, 1)
        push_to_topbar(elements, cell, num_cells, bg_colors, fg_colors, seperator, #cells == 0, false)
        num_cells = num_cells + 1
    end

    window:set_left_status(wezterm.format(elements))
end

function push_to_topbar(elements, text, num_cells, bg_colors, fg_colors, seperator, is_last, add_to_left)
    local cell_no = num_cells + 1
    if add_to_left then
        table.insert(elements, { Foreground = { Color = bg_colors[cell_no] } })
        table.insert(elements, { Text = seperator })
    end
    table.insert(elements, { Foreground = { Color = fg_colors[cell_no] } })
    table.insert(elements, { Background = { Color = bg_colors[cell_no] } })
    table.insert(elements, { Text = " " .. text .. " " })
    if not add_to_left then
        table.insert(elements, { Background = { Color = topbarColor } })
        table.insert(elements, { Foreground = { Color = bg_colors[cell_no] } })
        table.insert(elements, { Text = utf8.char(0xe0b4) })
    end
end

return {
    automatically_reload_config = true,
    color_scheme = "catppuccin-frappe",
    font = wezterm.font("maple mono"),
    colors = {
        tab_bar = {
            background = topbarColor,
        },
    },
    font_size = 12,
    font_rules = {
        {
            intensity = 'Bold',
            italic = true,
            font = wezterm.font {
                family = 'maple mono',
                weight = 'Bold',
                style = 'Italic',
            }
        },
        {
            intensity = 'Normal',
            italic = true,
            font = wezterm.font {
                family = 'maple mono',
                style = 'Italic',
            }
        },
    },
    line_height = 1.4,
    use_fancy_tab_bar = false,
    show_tabs_in_tab_bar = false,
    show_new_tab_button_in_tab_bar = false,
    warn_about_missing_glyphs = false,
    bidi_enabled = true,
    enable_kitty_keyboard = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    inactive_pane_hsb = {
        hue = 0.5,
        saturation = 0.9,
        brightness = 0.3,
    },

    keys = {
        { key = "j",   mods = "META", action = act.SendKey({ key = "DownArrow" }) },
        { key = "k",   mods = "META", action = act.SendKey({ key = "UpArrow" }) },
        { key = "F11", mods = "",     action = "ToggleFullScreen" },
        { key = "0",   mods = "CTRL", action = act.PaneSelect },
    },

    set_environment_variables = {
        VTE_VERSION = "6003",
    },

    quick_select_patterns = {
        "[^\\s]*[0-9]\\.[^\\s]*",
    },
    enable_wayland = false,
    -- window_background_opacity = 0.9
}
