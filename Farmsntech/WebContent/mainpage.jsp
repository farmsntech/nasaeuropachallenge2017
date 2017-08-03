<%@page import="com.farmsntech.crop.CropUtils"%>
<%@page import="com.farmsntech.crop.Crop"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
       <script>  
		
		function sendInfo()  
		{  
		var v=document.vinform.canal.value; 
		retrieve(v);
		}
		
		function retrieve(val)  
		{  
		var v=val;
		return v;
		}	
		</script>

<p id="test"></p>
<p id="test2"></p>


<script>
function findpos(){
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
}

</script>
<% int c=1;
int crop=1;
int sid=1;
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script>
	function abc(lat,lon){
		var x = document.getElementById("test2");
	jQuery(document).ready(function($) {
	  $.ajax({
	  url : "https://api.darksky.net/forecast/1458ee77f94c2d50b1d3f7b0a5b8f6c6/"+lat+","+lon,
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp =[parsed_json['daily']['data']['0']['temperatureMin'],
		  	       parsed_json['daily']['data']['0']['temperatureMax'],parsed_json['daily']['data']['0']['precipIntensity'], parsed_json['daily']['data']['1']['temperatureMin'],
		  	            parsed_json['daily']['data']['1']['temperatureMax'],parsed_json['daily']['data']['1']['precipIntensity'], parsed_json['daily']['data']['2']['temperatureMin'],
		  	            parsed_json['daily']['data']['2']['temperatureMax'],parsed_json['daily']['data']['2']['precipIntensity'], parsed_json['daily']['data']['3']['temperatureMin'],
		  	          parsed_json['daily']['data']['3']['temperatureMax'],parsed_json['daily']['data']['3']['precipIntensity'], parsed_json['daily']['data']['4']['temperatureMin'],
		  	      parsed_json['daily']['data']['4']['temperatureMax'],parsed_json['daily']['data']['4']['precipIntensity'], parsed_json['daily']['data']['5']['temperatureMin'],
		  	          parsed_json['daily']['data']['5']['temperatureMax'],parsed_json['daily']['data']['5']['precipIntensity'], parsed_json['daily']['data']['6']['temperatureMin'],
		  	          parsed_json['daily']['data']['6']['temperatureMax'],parsed_json['daily']['data']['6']['precipIntensity']];
		  	var te="mn";
			x.innerHTML=temp;
			var val= 
			 window.location.replace("page.jsp?name="+temp+"&canal="+<%=c%>+"&crop="+<%=crop%>+"&stage="+<%=sid%>);
		  }
	  });
	});
	}
</script>

<form method="get" >
			
		 <% String a = "s"; 
		  List<Crop> list8 = CropUtils.selectCrop(request,response);
		 %> -
		 
		<select name="crop">
			<% 
			for (Crop cp : list8){
			
			     a =cp.getCrop_name(); %>
			     	
			    <option value="<%=cp.getCrop_id() %>"> <%=a %> </option>    
			<%
				}
			%>
		</select> 
		  <br>
			
  <input type="radio" name="canal" value="1" >Yes
  <input type="radio" name="canal" value="0" > No<br></form>
<% 
    String st="<script>document.writeln(temp)</script>";
    int b=1;
   
    %><%
    out.println("value="+st); 
    
%>
    <input type="button" value="Get" onclick='findpos()'>
    <%
       
    %>

</body>
</html>