/*
 *  How to see historical entries in a feed.  Usually a feed only returns x number
 *  of results, and you want more.  Since the Google Feeds API caches feeds, you can
 *  dig into the history of entries that it has cached.  This, paired with setNumEntries,
 *  allows you to get more entries than normally possible.
 */

google.load("feeds", "1");

var gPageUrl = "", gPageDomain = "", gPageTitle = "";

//TODO-call from background.html
//init("http://techcrunch.com","iUrl", "Gillmor Gang: Sinofsky Falls");

function init(iDomain,iUrl, iTitle) {

	//TODO-init global paramaters from input
	gPageUrl = iUrl;
	gPageDomain = iDomain;
	gPageTitle = iTitle;
	OnLoad();
}

function findDone(result) {
	// Make sure we didn't get an error.
	if (!result.error) {
		// Get content div
		var html = '';

		// Loop through the results and print out the title of the feed and link to
		// the url.
		var rssUrl;
		/*
		for (var i = 0; i < result.entries.length; i++) {
			var entry = result.entries[i];
			if (i == 0)	rssUrl = entry.url;
		}
		*/
		var entry = result.entries[0];
		rssUrl = entry.url;
		
		console.log("rssUrl:" + rssUrl);

		getRssFromHistorical(rssUrl);
	}
}

// Our callback function, for when a feed is loaded.
function feedLoaded(result) {
	if (!result.error) {
		var flag=0;
		var arr = gPageTitle.split(' ');
		var tmpArr;
		var noMatchStr = "";
		for (var i = 0; i < result.feed.entries.length; i++) {
			var entry = result.feed.entries[i];
			
			noMatchStr+=i+':'+entry.title+' url:'+entry.link;
			
			var tmpArr = entry.title.split(' ');
			var min = (arr.length<tmpArr.length?arr.length:tmpArr.length);
			
			var count=0;
			for(var j=0; j<arr.length; j++) {
			  for(var k=0; k<tmpArr.length ; k++) {
			    if(arr[j]==tmpArr[k])count++;
			  }  
			}
			if ((min/2)<=count)  {
				console.log("******match start*******");
				console.log(entry.title);
				console.log(entry.content);
				console.log(entry.link);
				console.log("******match end*******");
				flag=1;
				i=1000;
			}
			//console.log(entry);
		}
		if (flag==0)
		{
			console.log("no match");
			console.log(noMatchStr);
			console.log("no match");
		}
	}
}

function getRssFromHistorical(iRssUrl) {
	// Create a feed instance that will grab Digg's feed.
	var feed = new google.feeds.Feed(iRssUrl);

	feed.includeHistoricalEntries();
	// tell the API we want to have old entries too
	feed.setNumEntries(250);
	// we want a maximum of 250 entries, if they exist

	// Calling load sends the request off.  It requires a callback function.
	feed.load(feedLoaded);
}

function OnLoad() {
	// The page to lookup a feed on.
	var query = 'site:' + gPageDomain + ' ' + gPageTitle;
	console.log("query:" + query);
	// Go find it!  Call lookupDone when the search is complete.
	google.feeds.findFeeds(query, findDone);
}

//google.setOnLoadCallback(OnLoad); 