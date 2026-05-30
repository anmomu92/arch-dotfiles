# -----------
# KEYBINDINGS 
# -----------

config = config

# NAVIGATION 
# ----------
# tabs
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')     # previous tab
config.bind('<Ctrl-Tab>', 'tab-next')           # next tab

# scrolling
config.bind('h', 'scroll-page -0.1 0') 
config.bind('l', 'scroll-page 0.1 0')
config.bind('<Ctrl-d>', 'cmd-run-with-count 10 scroll down')
config.bind('<Ctrl-u>', 'cmd-run-with-count 10 scroll up')

# hints
config.bind('gi', 'hint inputs')


# INFORMATION
# -----------
config.bind('zp', 'print')                      # print page
config.bind('gf', 'view-source')                # view page source

# GUI
# ---
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('<Alt-t>', 'config-cycle colors.webpage.darkmode.enabled true false;; colors.webpage.darkmode.preferred_color_scheme dark light')

# Exit passthrough mode
config.bind('<Shift-Escape>', 'mode-leave', mode='passthrough')
