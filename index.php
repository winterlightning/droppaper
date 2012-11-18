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
<script>
  var Entry, exports;

  Nimbus.Auth.setup("Dropbox", "q5yx30gr8mcvq4f", "qy64qphr70lwui5", "droppaper");

  Entry = Nimbus.Model.setup("Entry", ["title", "text", "creation_time", "url"]);

  Nimbus.Auth.authorized_callback = function() {
    if (Nimbus.Auth.authorized()) {
      return Entry.sync_all(function() {
        return log("working synced app");
      });
    }
  };
</script>

    <title>Modern UI CSS</title>



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
			<a href="javascript:Nimbus.Auth.authorize();">Get Connected</a>
        </div>
    </div>
</div>


</body>
</html>