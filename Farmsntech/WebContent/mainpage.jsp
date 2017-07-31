<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p id="test"></p>
<p id="test2"></p>

<script>
(function(){
	var x = document.getElementById("test");
	
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
    function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude;
	var lat = position.coords.latitude;
	var lon = position.coords.longitude;
	abc(lat,lon);
	}
	
})();

</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
	function abc(lat,lon){
		var x = document.getElementById("test2");
	jQuery(document).ready(function($) {
	  $.ajax({
	  url : "https://api.darksky.net/forecast/1458ee77f94c2d50b1d3f7b0a5b8f6c6/"+lat+","+lon,
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp = parsed_json['currently']['temperature'];
			alert(temp);
			x.innerHTML=temp;
		  }
	  });
	});
	}
</script>
</body>
</html>