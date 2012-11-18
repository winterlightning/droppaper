Nimbus.Auth.setup("Dropbox", "lejn01o1njs1elo", "2f02rqbnn08u8at", "diary_app")

Entry = Nimbus.Model.setup("Entry", ["title", "text", "time", "url", "author"])

Entry.deleteAll()

Entry.create( { 
  "title":"Japanese Prime Minister Noda with NASA Administrator Bolden <span>Published May 3, 2012</span>"
  "text": "Thundercats adipisicing marfa wes"
  "author": "Chad Smith"
  "url": "http://onetwothree.net" }
)

Entry.create({
  "title":"two", 
  "text": "Thundercats adipisicing marfa wes anderson farm-to-table, +1 vero yr ennui messenger bag occaecat williamsburg cosby sweater anim tattooed. Farm-to-table umami direct trade viral cosby sweater Austin. Magna tattooed irure, DIY do placeat helvetica sapiente laboris. Put a bird on it jean shorts wolf enim, viral authentic hoodie bespoke master cleanse proident. Ea pour-over swag wayfarers, Austin thundercats letterpress mollit 8-bit excepteur forage elit. Cupidatat minim dolore laborum whatever. Farm-to-table nihil tattooed, letterpress helvetica vegan semiotics pariatur pop-up. Helvetica ex godard selvage, sriracha echo park ut portland forage cardigan. Retro readymade williamsburg cliche laboris pinterest. Mollit aliqua direct trade, tumblr vegan lo-fi shoreditch semiotics sed 8-bit. Incididunt keffiyeh PBR cray, assumenda yr butcher nisi. Mustache brunch kogi, farm-to-table small batch odio fugiat consequat fap esse quinoa. Iphone banh mi brunch jean shorts sartorial, letterpress culpa direct trade master cleanse banksy fap whatever quinoa biodiesel. Portland eiusmod minim nihil Austin, sartorial aesthetic occupy tofu sriracha pitchfork seitan." 
  "author": "Chad Smith",
  "url": "http://onetwothree.net"
  }
)

Entry.create({
  "title":"three", 
  "text": "Thundercats adipisicing marfa wes anderson farm-to-table, +1 vero yr ennui messenger bag occaecat williamsburg cosby sweater anim tattooed. Farm-to-table umami direct trade viral cosby sweater Austin. Magna tattooed irure, DIY do placeat helvetica sapiente laboris. Put a bird on it jean shorts wolf enim, viral authentic hoodie bespoke master cleanse proident. Ea pour-over swag wayfarers, Austin thundercats letterpress mollit 8-bit excepteur forage elit. Cupidatat minim dolore laborum whatever. Farm-to-table nihil tattooed, letterpress helvetica vegan semiotics pariatur pop-up. Helvetica ex godard selvage, sriracha echo park ut portland forage cardigan. Retro readymade williamsburg cliche laboris pinterest. Mollit aliqua direct trade, tumblr vegan lo-fi shoreditch semiotics sed 8-bit. Incididunt keffiyeh PBR cray, assumenda yr butcher nisi. Mustache brunch kogi, farm-to-table small batch odio fugiat consequat fap esse quinoa. Iphone banh mi brunch jean shorts sartorial, letterpress culpa direct trade master cleanse banksy fap whatever quinoa biodiesel. Portland eiusmod minim nihil Austin, sartorial aesthetic occupy tofu sriracha pitchfork seitan." 
  "author": "Chad Smith",
  "url": "http://onetwothree.net" 
})

window.render_entry = (x) ->
  """  
  <div class="box w-50 h-50 box-b-r">
    <h3>#{ x.title }<span>#{ x.author }</span></h3>
    <p>#{x.text}</p>
  </div>
  """

window.render_entries= () ->
  counter = 0
  box = ""
  for x in Entry.all()
    console.log(x)
    if counter % 4 is 0
      box = box + """<div class="f-page" style="display:none;">
        <div class="f-title">
          <a></a> 
          <h2>Your DropPaper</h2>
          <a href=""></a>
        </div>"""
    
    box = box + window.render_entry(x)
    
    if counter % 4 is 3 or counter is Entry.all().length-1
      box = box+"</div>"
      console.log("BOX: ", box)
      $("#flip").append( box )
      
      box = ""
    
    console.log("counter", counter)  
    counter = counter + 1
  
  end = """<div class="f-page f-cover-back">
      <div id="codrops-ad-wrapper">
          
        </div>
      </div>"""
  $("#flip").append(end)

jQuery ($) ->
  #code for intialization should go here
  window.render_entries()
  setTimeout("$('#flip').flips()", 1000)
  

exports = this #this is needed to get around the coffeescript namespace wrap
exports.Entry = Entry

