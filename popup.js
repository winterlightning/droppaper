function makeVisible (elementId) {
  document.getElementById(elementId).style.visibility = 'visible';
  document.getElementById(elementId).style.display = 'block';
}
function initSearch() {
  
  chrome.windows.getCurrent(function (currentWindow) {
    chrome.tabs.query({active: true, windowId: currentWindow.id},
                      function(activeTabs) {
                      	
		chrome.tabs.executeScript(null, { file: "jquery-1.7.2.min.js" }, function() {
		    chrome.tabs.executeScript(null, { file: "find_and_replace.js" });
		});                      	
                      	
    });
  });  
  
}
chrome.extension.onRequest.addListener(function(words) {
	var container = document.getElementById("content");
	var div = document.createElement("div");
	div.appendChild(document.createTextNode("test"));
	console.log("test");
	container.appendChild(div);
	
});

window.onload = function() {
  document.getElementById('login').onclick = initSearch;
  document.getElementById('save').onclick = closeWindow;

};


chrome.windows.getCurrent(function (currentWindow) {
   chrome.tabs.query({active: true, windowId: currentWindow.id},
   	function(activeTabs) {
   		var container = document.getElementById("content");
   		container.appendChild(activeTabs);
    	console.log(activeTabs);
   	});
});  