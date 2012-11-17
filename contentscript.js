/*
google.load("feeds", "1");

function initialize() {
	alert("s");
	// alert(this.location);
	
	var feed = new google.feeds.Feed("http://feeds.feedburner.com/TechCrunch/startups");
	//var feed = new google.feeds.Feed(this.location));
	feed.load(function(result) {
		if (!result.error) {
			var container = document.getElementById("feed");
			for (var i = 0; i < result.feed.entries.length; i++) {
				var entry = result.feed.entries[i];
				var div = document.createElement("div");
				div.appendChild(document.createTextNode(entry.title));
				container.appendChild(div);
			}
		}
		console.log(result);
	});
}

google.setOnLoadCallback(initialize);

*/

/*
function onText(data) {
	fetchFeedData1("1");
}

function to()
{
	chrome.extension.sendRequest({'action' : 'fetchFeedData'}, onText);
}

to();

*/