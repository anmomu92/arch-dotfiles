# Privacy-focused settings
c = c
config = config

c.content.cookies.accept = 'no-3rdparty'
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
c.content.webgl = False
c.content.canvas_reading = False
c.content.notifications.enabled = False
c.content.geolocation = False
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.desktop_capture = False

# Toggleable privacy mode

# Toggle 3rd-party cookies
config.bind('<Ctrl-P>', 'config-cycle content.cookies.accept no-3rdparty all ;; message-info "Toggled cookie policy"')

# Toggle geolocation
config.bind('<Ctrl-G>', 'config-cycle content.geolocation false true ;; message-info "Toggled geolocation"')

# Toggle canvas reading
config.bind('<Ctrl-C>', 'config-cycle content.canvas_reading false true ;; message-info "Toggled canvas reading"')
