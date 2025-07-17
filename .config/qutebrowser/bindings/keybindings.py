# Useful keybindings
config = config

config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
config.bind('<Ctrl-Tab>', 'tab-next')

# Scrolling
config.bind('h', 'scroll-page -0.1 0')
config.bind('l', 'scroll-page 0.1 0')
config.bind('<Ctrl-d>', 'cmd-run-with-count 10 scroll down')
config.bind('<Ctrl-u>', 'cmd-run-with-count 10 scroll up')

# Navigation & utilities
config.bind('<Ctrl-f>', 'search')
config.bind('gi', 'hint inputs')
config.bind('gf', 'view-source')

# Tabs
# config.bind('xx', 'tab-close')
config.bind('X', 'undo')
config.bind('<Ctrl-Shift-T>', 'undo')

# Print page
config.bind('zp', 'print')

# Normal mode
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('<Alt-t>', 'config-cycle colors.webpage.darkmode.enabled true false;; colors.webpage.darkmode.preferred_color_scheme dark light')

# Exit passthrough mode
config.bind('<Shift-Escape>', 'mode-leave', mode='passthrough')
