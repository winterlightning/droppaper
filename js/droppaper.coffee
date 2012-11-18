Nimbus.Auth.setup("Dropbox", "q5yx30gr8mcvq4f", "qy64qphr70lwui5", "droppaper")

Entry = Nimbus.Model.setup("Entry", ["title", "text", "creation_time", "url"])

Nimbus.Auth.authorized_callback = ->
  if Nimbus.Auth.authorized()
    Entry.sync_all ->
      log "working synced app"
      location.reload()

window.auth = ()-> 
  Nimbus.Auth.authorize()

window.validate = ()->
  Nimbus.Auth.initialize()

window.sync_entry = ->
  console.log("syncing")
  if Nimbus.Auth.authorized()
    Entry.sync_all( ()->
      location.reload()
      #window.store.loadData(get_entry_from_spine(), false)
      #window.list.refresh()
    )


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
          <a onclick="window.auth()" style="font-size: 30px; cursor: pointer;">Authorize</a><br />
          <a onclick="window.validate()" style="font-size: 30px; cursor: pointer;">Validate</a><br />
          <a onclick="window.sync_entry()" style="font-size: 30px; cursor: pointer;">Sync All</a>
          
        </div>
      </div>"""
  $("#flip").append(end)

jQuery ($) ->
  #code for intialization should go here
  window.render_entries()
  setTimeout("$('#flip').flips()", 1000)
  

exports = this #this is needed to get around the coffeescript namespace wrap
exports.Entry = Entry

