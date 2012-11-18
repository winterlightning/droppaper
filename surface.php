<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
    <meta name="description" content="Modern UI CSS">
    <meta name="keywords" content="windows 8, modern style, modern ui, style, modern, css, framework">

    <link href="css/modern.css" rel="stylesheet">
    <link href="css/theme-dark.css" rel="stylesheet">
    <link href="css/modern-responsive.css" rel="stylesheet">

    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/google-analytics.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/github.info.js"></script>
    <script src="js/tile-slider.js"></script>
	
	
	<script src="http://nimbusbase.com/static/nimbus.min.js"></script>

    <title>Modern UI CSS</title>

    <style>
        body {
            background: #1d1d1d;
        }
		
		#allTiles1,
		#allTiles2,
		#allTiles3,
		#allTiles4,
		#allTiles5,
		#allTiles6,
		#allTiles7,
		#allTiles8 {
			display:none;
		}
    </style>

    <script>
        function Resize(){
            var tiles_area = 0;
            $(".tile-group").each(function(){
                tiles_area += $(this).outerWidth() + 80;

            });

            $(".tiles").css("width", 120 + tiles_area + 20);

            $(".page").css({
                height: $(document).height() - 20,
                width: $(document).width()
            });
        }

        function AddMouseWheel(){
            $("body").mousewheel(function(event, delta){
                var scroll_value = delta * 50;
                if (!jQuery.browser.chrome) {
                    document.documentElement.scrollLeft -= scroll_value;
                } else {
                    this.scrollLeft -= scroll_value;
                }
                return false;
            });
        }

        $(function(){

            Resize();
            AddMouseWheel();

        })

		
		function bigger(id) {	
			$('#'+id).animate({
				width: "100%",
				height: "100%"
				},
				1000, 'linear', function() {
					$('#back_'+id).show();
			});
			
		}

		function smaller(id) {	
			$('#'+id).animate({
				width: "310px",
				height: "150px"
				},
				500, 'linear', function() {
				$('#back_'+id).hide();
			});
		}
		

		var allTiles = "";
		var colorsArr = ["bg-color-green","bg-color-pink","bg-color-greenDark","bg-color-pinkDark","bg-color-blueDark","bg-color-darken","bg-color-purple","bg-color-yellow","bg-color-greenLight","bg-color-blue","bg-color-orange","bg-color-orangeDark","bg-color-red"];
		
		
		var obj;
		var k;
		var countBack=0;
		var currentInsert = 0;
		
		
		
		  var Entry, exports;

		  Nimbus.Auth.setup("Dropbox", "q5yx30gr8mcvq4f", "qy64qphr70lwui5", "droppaper");

		  Entry = Nimbus.Model.setup("Entry", ["title", "text", "creation_time", "url"]);

		  Nimbus.Auth.authorized_callback = function() {
			if (Nimbus.Auth.authorized()) {
			  return Entry.sync_all(function() {
					getDataFromEntryAll(Entry.all());
					return log("working synced app");
			  });
			}
		  };

		
		function getDataFromEntryAll(arr)
		{
			for (var i=0 ; i<=arr.length ; i++) {

					var localCountBack = countBack;
					obj = arr[i];
					k = Math.floor(Math.random()*colorsArr.length+1);
					currentInsert = Math.floor(countBack / 6);
					if (countBack % 6 == 0)
					{
						//"</div><div class=\"tile-group\" id=\"allTiles"+currentInsert+"\">";
						$("#allTiles" + currentInsert).show();
					}
					$("#allTiles" + currentInsert).append("<div class=\"tile double "+colorsArr[k]+"\" data-role=\"tile-slider\" data-param-period=\"3000\" onClick=\"bigger('b"+localCountBack+"')\" id=\"b"+localCountBack+"\"><div class=\"tile-content\"><div class=\"place-right place-top\" id=\"back_b"+localCountBack+"\" style=\"display:none;\"><a href=\"javaScript:smaller('b"+localCountBack+"')\" class=\"back-button big page-back\"></a></div><h3 id=\"clickmeBtn\">"+obj.title+"</h3><p>"+obj.text+"</p></div></div>");
					countBack++;

			}
		}
		
		$(document).ready(function() {
			getDataFromEntryAll(Entry.all());
			
			if (Nimbus.Auth.authorized())
			{
					$("#connect").hide();
			}
		});							

    </script>
</head>
<body class="modern-ui" onresize="Resize()">
<div class="page secondary fixed-header">
    <div class="page-header ">
        <div class="page-header-content">
            <div class="user-login">
                <a href="#">
                    <img src="../dp/images/droppaper.png" width="64" height="64" />
                </a>
            </div>

            <h1>Drop Paper</h1>
        </div>
    </div>

		
    <div class="page-region">
        <div class="page-region-content tiles">
            <div class="tile-group" id="allTiles0"><div id="connect" style="position:absolute"><a href="javascript:Nimbus.Auth.authorize();"><h2>Get Connected</h2></a></div></div>
            <div class="tile-group" id="allTiles1"></div>
            <div class="tile-group" id="allTiles2"></div>
            <div class="tile-group" id="allTiles3"></div>
            <div class="tile-group" id="allTiles4"></div>
            <div class="tile-group" id="allTiles5"></div>
        </div>
    </div>
</div>

</body>
</html>