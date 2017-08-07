<%@page import="com.farmsntech.crop.CropUtils"%>
<%@page import="com.farmsntech.crop.Crop"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Loading main css file -->
    <link rel="stylesheet" href="style.css">

    <!-- Custom CSS -->
    <link href="csspredict/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="csspredict/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->




    <style>
        .btn-round-lg {
            border-radius: 22.5px;
        }
        
        .btn-round {
            border-radius: 25px;
        }
        
        .btn-round-sm {
            border-radius: 15px;
        }
        
        .btn-round-xs {
            border-radius: 11px;
            padding-left: 10px;
            padding-right: 10px;
        } 
        
        
        .dropbtn {
    background-color: #009ad8;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
.bg-1{
    background-image: url("images/farm.jpg");
}
.selectWrapper{
  border-radius:36px;
  display:inline-block;
  overflow:hidden;
  background:#cccccc;
  border:1px solid #cccccc;
}
.selectBox{
  width:140px;
  height:40px;
  border:0px;
  outline:none;
}

    </style>

</head>
<body>
    

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
		  	       parsed_json['daily']['data']['0']['temperatureMax'],25*24*parsed_json['daily']['data']['0']['precipIntensity'], parsed_json['daily']['data']['1']['temperatureMin'],
		  	            parsed_json['daily']['data']['1']['temperatureMax'],25*24*parsed_json['daily']['data']['1']['precipIntensity'], parsed_json['daily']['data']['2']['temperatureMin'],
		  	            parsed_json['daily']['data']['2']['temperatureMax'],25*24*parsed_json['daily']['data']['2']['precipIntensity'], parsed_json['daily']['data']['3']['temperatureMin'],
		  	          parsed_json['daily']['data']['3']['temperatureMax'],25*24*parsed_json['daily']['data']['3']['precipIntensity'], parsed_json['daily']['data']['4']['temperatureMin'],
		  	      parsed_json['daily']['data']['4']['temperatureMax'],25*24*parsed_json['daily']['data']['4']['precipIntensity'], parsed_json['daily']['data']['5']['temperatureMin'],
		  	          parsed_json['daily']['data']['5']['temperatureMax'],25*24*parsed_json['daily']['data']['5']['precipIntensity'], parsed_json['daily']['data']['6']['temperatureMin'],
		  	          parsed_json['daily']['data']['6']['temperatureMax'],25*24*parsed_json['daily']['data']['6']['precipIntensity']];
		  	var te="mn";
		 var temp2=[parsed_json['daily']['data']['0']['temperatureMin'],parsed_json['daily']['data']['0']['temperatureMax'],25*24*parsed_json['daily']['data']['0']['precipIntensity'],
		  	           parsed_json['daily']['data']['0']['pressure'],parsed_json['daily']['data']['0']['windSpeed'],parsed_json['daily']['data']['0']['humidity'],parsed_json['daily']['data']['0']['summary'],
		  	           parsed_json['daily']['data']['1']['temperatureMin'],parsed_json['daily']['data']['1']['temperatureMax'],25*24*parsed_json['daily']['data']['1']['precipIntensity'],
		  	           parsed_json['daily']['data']['1']['pressure'],parsed_json['daily']['data']['1']['windSpeed'],parsed_json['daily']['data']['1']['humidity'],parsed_json['daily']['data']['1']['summary'],
		  	           parsed_json['daily']['data']['2']['temperatureMin'],parsed_json['daily']['data']['2']['temperatureMax'],25*24*parsed_json['daily']['data']['2']['precipIntensity'],
		  	           parsed_json['daily']['data']['2']['pressure'],parsed_json['daily']['data']['2']['windSpeed'],parsed_json['daily']['data']['2']['humidity'],parsed_json['daily']['data']['2']['summary'],
		  	           parsed_json['daily']['data']['3']['temperatureMin'],parsed_json['daily']['data']['3']['temperatureMax'],25*24*parsed_json['daily']['data']['3']['precipIntensity'],
		  	           parsed_json['daily']['data']['3']['pressure'],parsed_json['daily']['data']['3']['windSpeed'],parsed_json['daily']['data']['3']['humidity'],parsed_json['daily']['data']['3']['summary'],
		  	           parsed_json['daily']['data']['4']['temperatureMin'],parsed_json['daily']['data']['4']['temperatureMax'],25*24*parsed_json['daily']['data']['4']['precipIntensity'],
		  	           parsed_json['daily']['data']['4']['pressure'],parsed_json['daily']['data']['4']['windSpeed'],parsed_json['daily']['data']['4']['humidity'],parsed_json['daily']['data']['4']['summary'],
		  	           parsed_json['daily']['data']['5']['temperatureMin'],parsed_json['daily']['data']['5']['temperatureMax'],25*24*parsed_json['daily']['data']['5']['precipIntensity'], 
		  	           parsed_json['daily']['data']['5']['pressure'],parsed_json['daily']['data']['5']['windSpeed'],parsed_json['daily']['data']['5']['humidity'],parsed_json['daily']['data']['5']['summary'],
		  	           parsed_json['daily']['data']['6']['temperatureMin'],parsed_json['daily']['data']['6']['temperatureMax'],25*24*parsed_json['daily']['data']['6']['precipIntensity'],
		  	           parsed_json['daily']['data']['6']['pressure'],parsed_json['daily']['data']['6']['windSpeed'],parsed_json['daily']['data']['6']['humidity'],parsed_json['daily']['data']['6']['summary']];
		  	
			
			 
			 window.location.replace("page.jsp?name="+temp+"&canal="+<%=c%>+"&crop="+<%=crop%>+"&stage="+<%=sid%>+"&name2="+temp2);
		  }
	  });
	});
	}
</script>

<form method="get" >
			
		 <% String a = "s"; 
		  List<Crop> list8 = CropUtils.selectCrop(request,response);
		 %> -
		  <br>
			
 </form>
<% 
   
    int b=1;
   
  
       
    %>
    


<body>


    <div class="site-content">
        <div class="site-header">
            <div class="container">
                <a href="index.html" class="branding">
                    <img src="images/logo.png" alt="" class="logo">
                    <div class="logo-type">
                        <h1 class="site-title" style="font-family:sarif;">FarmsNtech</h1>
                        <small class="site-description"></small>
                    </div>
                </a>

                <!-- Default snippet for navigation -->
                <div class="main-navigation">
                    <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                    <ul class="menu">
                        <li class="menu-item current-menu-item"><a href="index.html">Home</a></li>
                        <li class="menu-item"><a href="news.html">PAST CROP</a></li>
                        <li class="menu-item"><a href="live-cameras.html">ONGOING CROP</a></li>
                        
                    </ul>
                    <!-- .menu -->
                </div>
                <!-- .main-navigation -->

                <div class="mobile-navigation"></div>

            </div>
        </div>
        <!-- .site-header --> 

        <div class="hero bg-1"  style="height:70%;">
        <br><br><br><br><br>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">

                      
                         <!--  <button class="dropbtn btn-round">  <b>Choose Your Crop </b> </button> -->
                         
            
                         <br>
                       <div class="selectWrapper">
<select style="padding:5px 20px;background-color:#149dcc;color:white;font-size:20px;" class="selectBox">
  <option value="rice" style="background-color:white;color:black;">  RICE </option>
  <option value="wheat" style="background-color:white;color:black;">Wheat</option>
  <option value="Maize" style="background-color:white;color:black;">Maize</option>
  <!-- <option value="audi" style="background-color:white;color:black;">Audi</option> -->
</select>
</div>  

                    </div>
                    
                    <div class="col-md-6">
                       <h2 id="location" style="color:black ; font-size:30px; font-weight:1900;"><b></b></h2>
                    </div>
   
                    
        
                    
                    
                    

                    <div class="col-md-2">
                        <form action="#" class="find-location">
                                    
                           <a class="btn btn-primary btn-round " onclick="locate()" style="background-color:#009ad8; color:white; font-size:22px; padding:7px;"> <i class="fa fa-crosshairs"></i>Track Me </a>
                        </form>
                    </div>
                </div>
                <br><br><br><br><br><br>
                 <a style="float:right;"><button class="dropbtn btn-round" value="Get" onclick='findpos()' >  <b>PREDICT</b> </button></a>
            </div>

        </div>
        


        
        

    </div>

                      
                        
                   
</body>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyAFmisFXtP-sbpxrFbA599VRj2Emoy2FD0"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
 <script>
function locate(){
	var x = document.getElementById("location");
	
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
    function showPosition(position) {
   
	var lat = position.coords.latitude;
	var lon = position.coords.longitude;
	var latlng = new google.maps.LatLng(lat, lon);
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                    	 x.innerHTML= results[1].formatted_address;
                    }
                }
            });
	}
	
}</script>
</html>