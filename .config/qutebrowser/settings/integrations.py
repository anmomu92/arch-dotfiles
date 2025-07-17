# External integrations
config = config

# Watch videos in mpv
config.bind(',m', 'hint links spawn mpv --ontop --autofit=20% {hint-url}')
config.bind('M', 'spawn mpv --ontop --autofit=20% {url}')

# Download with aria2c
config.bind(',d', 'spawn --output-messages=both aria2c {url}')

# Open current page in external terminal browser (e.g. w3m)
config.bind(',w', 'hint links spawn kitty -e w3m {hint-url}')
config.bind('W', 'spawn kitty -e w3m {url}')

# Open a url in readability
config.bind(',r', 'hint links spawn --userscript readability {hint-url}')
config.bind('R', 'spawn --userscript readability')
config.bind(',a', 'hint links spawn --detach qutebrowser --target=tab https://archive.is/{hint-url}')
config.bind('A', 'spawn --detach qutebrowser --target=tab https://archive.is/{hint-url}')


# External integrations - advanced

# Use yt-dlp for video downloads
config.bind(',y', 'hint links spawn kitty -e yt-dlp {hint-url}')
config.bind('Y', 'spawn kitty -e yt-dlp {url}')

# Open PDFs in zathura
config.bind(',z', 'hint links spawn zathura {hint-url}')

# Open page in Firefox (fallback browser)
config.bind(',f', 'spawn firefox {url}')
