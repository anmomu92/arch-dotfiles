# General useful settings
import os

c = c
config = config

THEME_PATH = os.path.expandvars("$HOME/.local/state/amm92/system-theme")

# Página de inicio
c.url.start_pages = ["file:///home/anmomu92/.config/qutebrowser/startup/index.html"]
c.url.default_page = 'file:///home/anmomu92/.config/qutebrowser/startup/index.html'

# ----- COMPORTAMIENTO
c.content.autoplay = False
c.content.javascript.enabled = True
c.content.blocking.method = 'adblock'

c.downloads.location.directory = '~/Downloads'

c.editor.command = ['kitty', '-e', 'nvim', '{}']


# ----- ASPECTO
c.zoom.default = "125%"
c.scrolling.smooth = True

c.tabs.show = 'multiple'
c.statusbar.show = 'never'

c.content.pdfjs = True

c.fonts.default_family = 'JetBrainsMono'
c.fonts.web.family.standard = 'JetBrainsMono'
c.fonts.web.family.fixed = 'JetBrainsMono'
c.fonts.web.family.serif = 'JetBrainsMono'
c.fonts.web.family.sans_serif = 'JetBrainsMono'

# Dark mode
# config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "auto")
config.set("colors.webpage.darkmode.policy.images", "never")

# Ajustamos el tema al iniciar
with open(THEME_PATH, "r") as file:
    tema = file.read().strip()

if tema == "light":
    config.set("colors.webpage.darkmode.enabled", False)
else:
    config.set("colors.webpage.darkmode.enabled", True)
