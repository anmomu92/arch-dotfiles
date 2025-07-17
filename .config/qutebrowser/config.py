# To avoid false errors caught by linters
c = c
config = config

config.load_autoconfig()

# Load modular config
config.source('themes/gruvbox.py')
config.source('bindings/keybindings.py')
config.source('settings/general.py')
config.source('settings/search_engines.py')
config.source('settings/privacy.py')
config.source('settings/integrations.py')
