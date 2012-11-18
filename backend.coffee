Nimbus.Auth.setup("Dropbox", "lejn01o1njs1elo", "2f02rqbnn08u8at", "diary_app")

Entry = Nimbus.Model.setup("Entry", ["title", "text", "time", "url", "author"])

exports = this #this is needed to get around the coffeescript namespace wrap
exports.Entry = Entry