from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import subprocess
import multiprocessing
from libqtile import hook
import time

@hook.subscribe.startup_once
def autostart_once():
    subprocess.run('/home/dzly/.screenlayout/home.sh')
    subprocess.run(['picom', '-b', '--backend', 'glx'])
    subprocess.Popen(['copyq'])
    subprocess.Popen(['xscreensaver', '--no-splash'])

@lazy.function
def load_translate(qtile):
    pass

mod = "mod4"
# terminal = '/usr/bin/kitty --listen-on=unix:/tmp/"$(date +%s%N)"'
terminal = f'/usr/bin/kitty --listen-on=unix:@{time.time()}'

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes

    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "q", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"), desc="Rofi Power menuQtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    # Screen Switching
    Key([mod], "F1", lazy.to_screen(1), desc="Switch to screen 1"),
    Key([mod], "F2", lazy.to_screen(0), desc="Switch to screen 0"),
    Key([mod], "F3", lazy.to_screen(2), desc="Switch to screen 2"),

    # Application Launching
    Key([mod], "F7", lazy.spawn("pulsemixer --change-volume +5"), desc="Increase volume"),
    Key([mod], "F8", lazy.spawn("pulsemixer --change-volume -5"), desc="Decrease volume"),
    Key([mod], "F9", lazy.spawn("playerctl -p spotify play-pause"), desc="Pause volume"),
    Key([mod], "F10", lazy.spawn("playerctl -p spotify previous"), desc="Decrease volume"),
    Key([mod], "F11", lazy.spawn("playerctl -p spotify next"), desc="Decrease volume"),

    # opacity
    Key([mod], "o", lazy.spawn("/home/dzly/.config/picom_opaque.sh"), desc="Toggle opacity"),
    Key([mod, "shift"], "o", lazy.spawn("/home/dzly/.config/picom_off.sh"), desc="Toggle opacity"),

    # Screen shot
    Key([mod, "shift"], "s", lazy.spawn("pulsemixer --change-volume -5"), desc="Decrease volume"),
    # Rofi
    # Key([mod], "f", lazy.spawn("zsh -c 'rofi -show combi -combi-modes 'filebrowser,window,run,ssh' -modes combi'"), desc="Rofi Find command"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "d", lazy.spawn("zsh -c 'rofi -show run'"), desc="Rofi run command"),
    Key([mod], "a", lazy.spawn("/home/dzly/.virtualenvs/dzly-cuxo/bin/rofi-copyq"), desc="Rofi run command"),

    # Screen shot
    Key([mod], "s", lazy.spawn("deepin-screenshot"), desc="Rofi run command"),

    # Lock screena
    Key([mod], "l", lazy.spawn("gdmflexiserver -ls"), desc="Lock screen"),

    # Translate function
    # Key([mod], "t", lazy.function(load_translate), desc="Translate"),
    Key([mod], "t", lazy.spawn("zsh -c 'xsel | xclip -i -selection clipboard && qtile run-cmd --float kitty -o confirm_os_window_close=0 --hold -e gtt'" ), desc="Translate"),

]


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(visible_groups=['2', '5', '8']),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            30,
            background="#ff0000.0",
            opacity=0.8
        ),
        wallpaper='~/.config/qtile/cyber2.jpg',
        wallpaper_mode='stretch'
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(visible_groups=['1', '4', '7']),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            30,
            background="#000000",
            opacity=1.0
        ),
        wallpaper='~/.config/qtile/cyber3.jpg',
        wallpaper_mode='stretch'
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(visible_groups=['3', '6', '9']),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            30,
            background="#ff0000.0",
            opacity=0.8
        ),
        wallpaper='~/.config/qtile/cyber1.jpg',
        wallpaper_mode='stretch'
    ),
]


groups = [Group(i) for i in "123456789"]

def get_screen_num(i):
    screen_num = 0
    if i in "258":
        screen_num = 0
    if i in "147":
        screen_num = 1
    if i in "369":
        screen_num = 2
    return screen_num

def switch_to_group_and_screen(i):
    def _inner(qtile):
        screen_num = get_screen_num(i)
        if qtile.current_screen != screen_num:
            qtile.focus_screen(screen_num)
        qtile.groups_map[i].cmd_toscreen()
    return _inner

def go_to_group_and_move_window(i):
    def _inner(qtile):
        screen_num = get_screen_num(i)
        qtile.current_window.togroup(i, switch_group=False)
        qtile.focus_screen(screen_num)
        qtile.groups_map[i].cmd_toscreen()
    return _inner

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.function(switch_to_group_and_screen(i.name)),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.function(go_to_group_and_move_window(i.name)),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=1,
                   margin=8, margin_on_single=[10, 30, 10, 30]),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class='deepqt'),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
