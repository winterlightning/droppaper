Nimbus.Auth.setup("Dropbox", "q5yx30gr8mcvq4f", "qy64qphr70lwui5", "droppaper")

Entry = Nimbus.Model.setup("Entry", ["title", "text", "creation_time", "url"])

Nimbus.Auth.authorized_callback = ->
  if Nimbus.Auth.authorized()
    Entry.sync_all ->
      log "working synced app"


exports = this #this is needed to get around the coffeescript namespace wrap
exports.Entry = Entry