# Integration with different external apps

config = config

# mpv
config.bind(',m', 'hint links spawn mpv --ontop --autofit=20% {hint-url}')
config.bind('M', 'spawn mpv --ontop --autofit=20% {url}')

# readability
config.bind(',r', 'hint links spawn --userscript readability {hint-url}')
config.bind('R', 'spawn --userscript readability')
config.bind(',a', 'hint links spawn --detach qutebrowser --target=tab https://archive.is/{hint-url}')
config.bind('A', 'spawn --detach qutebrowser --target=tab https://archive.is/{hint-url}')

# yt-dlp
config.bind(',y', 'hint links spawn kitty -e yt-dlp {hint-url}')
config.bind('Y', 'spawn kitty -e yt-dlp {url}')

# zathura
config.bind(',z', 'hint links spawn zathura {hint-url}')

# fallback browser
config.bind(',f', 'spawn firefox {url}')
config.bind(',f', 'spawn brave {url}')
