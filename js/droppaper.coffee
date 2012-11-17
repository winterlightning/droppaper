Nimbus.Auth.setup("Dropbox", "lejn01o1njs1elo", "2f02rqbnn08u8at", "diary_app")

Entry = Nimbus.Model.setup("Entry", ["title", "text", "time", "url", "author"])

instance = Entry.create("title":"Japanese Prime Minister Noda with NASA Administrator Bolden <span>Published May 3, 2012</span>", 
  "text": "Thundercats adipisicing marfa wes anderson farm-to-table, +1 vero yr ennui messenger bag occaecat williamsburg cosby sweater anim tattooed. Farm-to-table umami direct trade viral cosby sweater Austin. Magna tattooed irure, DIY do placeat helvetica sapiente laboris. Put a bird on it jean shorts wolf enim, viral authentic hoodie bespoke master cleanse proident. Ea pour-over swag wayfarers, Austin thundercats letterpress mollit 8-bit excepteur forage elit. Cupidatat minim dolore laborum whatever. Farm-to-table nihil tattooed, letterpress helvetica vegan semiotics pariatur pop-up. Helvetica ex godard selvage, sriracha echo park ut portland forage cardigan. Retro readymade williamsburg cliche laboris pinterest. Mollit aliqua direct trade, tumblr vegan lo-fi shoreditch semiotics sed 8-bit. Incididunt keffiyeh PBR cray, assumenda yr butcher nisi. Mustache brunch kogi, farm-to-table small batch odio fugiat consequat fap esse quinoa. Iphone banh mi brunch jean shorts sartorial, letterpress culpa direct trade master cleanse banksy fap whatever quinoa biodiesel. Portland eiusmod minim nihil Austin, sartorial aesthetic occupy tofu sriracha pitchfork seitan." 
  "author": "Chad Smith",
  "url": "http://onetwothree.net" 
)