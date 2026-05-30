# Main qutebrowser config file

c = c
config = config

# autoconfig
config.load_autoconfig(False)

# load configurations
config.source('themes/gruvbox.py')
config.source('bindings/keybindings.py')
config.source('settings/general.py')
config.source('settings/search_engines.py')
config.source('settings/privacy.py')
config.source('settings/integrations.py')
