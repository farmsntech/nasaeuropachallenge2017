<!DOCTYPE html>
<!--@version $Id: Shapefiles.html 3320 2015-07-15 20:53:05Z dcollins $-->
<%@page import="com.farmsntech.crop.ClimateUtils"%>
<%@page import="com.farmsntech.crop.Climate"%>
<%@page import="com.farmsntech.crop.globeprediction"%>
<%@page import="com.farmsntech.weather"%>
<%@page import="java.util.List"%>
<%@page import="com.farmsntech.crop.Prediction"%>
<html lang="en">
<head>
    <!--NOTE: Most Web World Wind examples use jquery, Bootstrap and requirejs but those technologies are NOT-->
    <!--required by Web World Wind. See SimplestExample.html for an example of using Web World Wind without them.-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="http://worldwindserver.net/webworldwind/worldwind.min.js" type="text/javascript"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script> -->
	<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.17/require.min.js"></script>
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyAFmisFXtP-sbpxrFbA599VRj2Emoy2FD0"></script>


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
            border-radius: 5px;
            padding-left: 5px;
            padding-right: 5px;
        } 
        
        .bg{
        
           background-image: url("images/black.jpg");
        
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

 <%
List<Climate> list2=null;
	
	list2 = ClimateUtils.selectcli();
	
		float[] mini=new float[20];
		float[] maxi=new float[20];
		float[] raini=new float[20];
		float[] press=new float[20];
		float[] wind=new float[20];
		float[] humid=new float[20];
		String[] summary=new String[20];
		
		int j=0;
for (Climate clim: list2){
	 mini[j]=clim.getMin();
	 maxi[j]=clim.getMax();
	 raini[j]=clim.getRain();
	 press[j]=clim.getPressure();
	 wind[j]=clim.getWind();
	 humid[j]=clim.getHumid();
	 summary[j]=clim.getSummary();
	 
	
	System.out.println(raini[j]);
	 j++;
}
%> 




<div class="container-fluid">
  
        <div class="row"style="background-color: #EEE;">
             
                  <div class="col-md-1 col-md-offset-3">
                  
                      <form action="#" class="find-location" style="padding:10px;">

                            <a class="btn  btn-round-xs " style="background-color:#009ad8; color:white;  padding:5px;"> <i class="fa fa-location-arrow" onclick="locate()"></i> </a>
                         
                       
                      
                          &nbsp;</form></div> <br>
                  
            <div class="col-md-4">     
                 <h4 id="location">
                     <b></b></h4>
                 
                 </div>
             
             </div>
    
    <%int count=0; %>
     
        <div class="row" style="background-color:rgba(238, 238, 238, 0.35);">   
             <div class="col-md-8 col-md-offset-3" >
             <%if(count<=3 ){%>
                 <p style="font-size:20px;">  <b> WIND</b>:4.6m/s ↑ &nbsp; &nbsp; <b>Pressure</b>:1006 hPa  &nbsp;&nbsp; <b> Min Temp</b>:74.1<sup>o</sup>F
                     
                     &nbsp; &nbsp;<b>Max Temp </b>:84<sup>o</sup>F &nbsp; &nbsp; <b>Humidity</b>:76%
                 </p>
            <%} %>
           <% if(count >=4 && count <=6) { %>
                 <p style="font-size:20px;">  <b> WIND</b>:4.6m/s ↑ &nbsp; &nbsp; <b>Pressure</b>:1001 hPa  &nbsp;&nbsp; <b> Min Temp</b>:74<sup>o</sup>F
                     
                     &nbsp; &nbsp;<b>Max Temp </b>:84<sup>o</sup>F &nbsp; &nbsp; <b>Humidity</b>:76%<%} %>
            <% if(count>=6) { %>
                 <p style="font-size:20px;">  <b> WIND</b>:4m/s ↑ &nbsp; &nbsp; <b>Pressure</b>:1010 hPa  &nbsp;&nbsp; <b> Min Temp</b>:73.09<sup>o</sup>F
                     
                     &nbsp; &nbsp;<b>Max Temp </b>:84.09<sup>o</sup>C &nbsp; &nbsp; <b>Humidity</b>:73%
                 </p>
            <%} %>
             
             
             </div>
         </div>
    
    
    <br> <br>
    
     <div class="col-md-2 ">
           <a href="home.html" class="btn btn-info" role="button">HOME</a>
        </div>
  <div class="row"> 
    <div class="col-md-12"> 
     <div class="row">
    
             
                
                 <div class="col-md-2 col-md-offset-2">
                 
                      <!--  <div class="dropdown">
                              <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Choose Crop
                              <span class="caret"></span></button>
                              <ul class="dropdown-menu">
                                <li><a href="#">Rice </a></li>
                                <li><a href="#">Wheat</a></li>
                                <li><a href="#">Maize</a></li>
                              </ul>
                      </div> --> 
                      
                                          <div class="selectWrapper">
<select style="padding:5px 20px;background-color:#149dcc;color:white;font-size:20px;" class="selectBox">
  <option value="rice" style="background-color:white;color:black;">  RICE </option>
  <option value="wheat" style="background-color:white;color:black;">Wheat</option>
  <option value="Maize" style="background-color:white;color:black;">Maize</option>
  <!-- <option value="audi" style="background-color:white;color:black;">Audi</option> -->
</select>
</div>        
                 
                 
                <!--  </div>
             
             </div> -->
        
   
     <br> <br>
 
<!-- <div class="row">
   <div class="col-md-2 col-md-offset-2"> -->

<form name="test" action="#">
		  <input type="date" name="cropdate" id="cropdate" value="2017-08-06"/>
		  
		<div class="radio" style="font-size:15px">
		  <label style="font-size:15px"><input type="radio" value="1" name="optradio" id="optradio" checked="checked" style="font-size:15px"><p style="font-size:15px"><b>Sowing</b></p></label>
		</div>
		<div class="radio">
		  <label><input type="radio" value="2" name="optradio" id="optradio"><b>Germinating </b></label>
		</div>
		<div class="radio">
		  <label><input type="radio" value="3" name="optradio" id="optradio"> <b> Harvesting </b></label>
		</div>
		
		<div class="radio">
		  <label><input type="radio" value="4" name="optradio" id="optradio"> <b> Reproduction </b></label>
		</div>
		
		<div class="radio">
		  <label><input type="radio" value="5" name="optradio" id="optradio"> <b> Ripening </b></label>
		</div>
		<!-- <input type="submit" class="submit" > -->
		
		<button name="data" id="data" type="button"  >Click</button>
</form>
  <br> <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <button type="button" class="btn btn-warning"></button>:LESS RAINFALL FOR RESPECTIVE STAGE<br><br>
  <button type="button" class="btn btn-success"></button>:SUFFICIENT RAINFAL FOR RESPECTIVE STAGE<br><br>
  <button type="button" class="btn btn-danger"></button>:MORE THAN REQUIRED RAINFALL FOR RESPECTIVE STAGE
  
   </div>
     
    
        
        <div class="col-md-7 bg" id="globe">
            <canvas id="canvasOne" width="1024" height="768">
	               Your browser does not support HTML5 Canvas.
            </canvas>
        </div>
        
    </div>
     </div>
    </div>
</div>
</body>




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
                         x.innerHTML = results[1].formatted_address;
                    }
                }
            });
	}
	
}
	//on page ready set the dates for the buttons.
	$(document).ready(function(){
		var one = new Date();
		var two = new Date(one.getTime() + (24 * 60 * 60 * 1000));
		var three = new Date(two.getTime() + (24 * 60 * 60 * 1000));
		var four = new Date(three.getTime() + (24 * 60 * 60 * 1000));
		var five = new Date(four.getTime() + (24 * 60 * 60 * 1000));
		var six = new Date(five.getTime() + (24 * 60 * 60 * 1000));
		
		var month = new Array();
		month[0] = "January";
		month[1] = "February";
		month[2] = "March";
		month[3] = "April";
		month[4] = "May";
		month[5] = "June";
		month[6] = "July";
		month[7] = "August";
		month[8] = "September";
		month[9] = "October";
		month[10] = "November";
		month[11] = "December";
		
		$("#button1").text("Today");
		$("#button2").text("Tomorrow");
		$("#button3").text(three.getDate() + " " + (month[three.getMonth()]).substring(0, 3));
		$("#button4").text(four.getDate() + " " + (month[four.getMonth()]).substring(0, 3));
		$("#button5").text(five.getDate() + " " + (month[five.getMonth()]).substring(0, 3));
		$("#button6").text(six.getDate() + " " + (month[six.getMonth()]).substring(0, 3));
	});
	
	
</script>

<%
int name=0; int check=0;
try{
name=Integer.parseInt(request.getParameter("name"));	
}
catch(Exception e)
{
name=0;
}
try{
	check= Integer.parseInt(request.getParameter("check"));
}
catch(Exception e)
{
check=0;
}
%>
<script>


   
  
requirejs(['./src/WorldWind',
        './LayerManager'],
    function (ww,
              LayerManager) {

      
       
       
       
        WorldWind.Logger.setLoggingLevel(WorldWind.Logger.LEVEL_WARNING);

        var wwd = new WorldWind.WorldWindow("canvasOne");
        wwd.goTo(new WorldWind.Location(23,79));
        var layers = [
            {layer: new WorldWind.BMNGLayer(), enabled: true},
            {layer: new WorldWind.BMNGLandsatLayer(), enabled: true},
            {layer: new WorldWind.BingAerialWithLabelsLayer(null), enabled: true},
            {layer: new WorldWind.CompassLayer(), enabled: true},
            {layer: new WorldWind.CoordinatesDisplayLayer(wwd), enabled: true},
            {layer: new WorldWind.ViewControlsLayer(wwd), enabled: true},
            {layer: new WorldWind.ViewControlsLayer(wwd), enabled: true},
            {layer: new WorldWind.AtmosphereLayer(), enabled:true}
        ];

        for (var l = 0; l < layers.length; l++) {
            layers[l].layer.enabled = layers[l].enabled;
            wwd.addLayer(layers[l].layer);
        }
        
        var placemark,
				placemarkAttributes = new WorldWind.PlacemarkAttributes(null),
				highlightAttributes,
				placemarkLayer1 = new WorldWind.RenderableLayer("Placemarks"),
				placemarkLayer2 = new WorldWind.RenderableLayer("Placemarks"),
				placemarkLayer3 = new WorldWind.RenderableLayer("Placemarks"),
				placemarkLayer4 = new WorldWind.RenderableLayer("Placemarks"),
				placemarkLayer5 = new WorldWind.RenderableLayer("Placemarks"),
				placemarkLayer6 = new WorldWind.RenderableLayer("Placemarks"),
				latitude,
				longitude;
			placemarkAttributes.imageScale = 1;
			placemarkAttributes.imageOffset = new WorldWind.Offset(
				WorldWind.OFFSET_FRACTION, 0.5,
				WorldWind.OFFSET_FRACTION, 0.5);
			placemarkAttributes.imageColor = WorldWind.Color.WHITE;
			var low = [];
			var mid = [];
			var high = [];
			
			
				var probs = ['3.70456','4.30456','6.60456','5.1145','5.1145','5.1145','17.7726','11.0726','9.0726','4.6','6.7','9.8','2.3','5.6','105','110','115'];
				var values = [];
				for (var y = 0; y < 1; y=y+1){
					

					 <% int fav1=globeprediction.predict(1,21);%>
						 if(<%=fav1%>==0){
							values.push('rgb(255, 255, 0)');
						}
						else if(<%=fav1%>==1){
							values.push('rgb(0, 255, 0)');
						}
						else if(<%=fav1%>==2){
							values.push('rgb(255, 0, 0)');
						}  
					
					 
					 
					
				<% int fav2=globeprediction.predict(1,18);%>
					
					 if(<%=fav2%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav2%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav2%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav3=globeprediction.predict(1,15);%>
					 if(<%=fav3%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav3%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav3%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav4=globeprediction.predict(2,21);%>
					 if(<%=fav4%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav4%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav4%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav5=globeprediction.predict(2,18);%>
					 if(<%=fav5%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav5%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav5%>==2){
						values.push('rgb(255, 0, 0)');
					}
					 
					 
				 <% int fav6=globeprediction.predict(2,15);%>
					 if(<%=fav6%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav6%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav6%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav7=globeprediction.predict(3,21);%>
					 if(<%=fav7%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav7%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav7%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav8=globeprediction.predict(3,18);%>
					 if(<%=fav8%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav8%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav8%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					 
					 <% int fav9=globeprediction.predict(3,15);%>
					 if(<%=fav9%>==0){
						values.push('rgb(255, 255, 0)');
					}
					else if(<%=fav9%>==1){
						values.push('rgb(0, 255, 0)');
					}
					else if(<%=fav9%>==2){
						values.push('rgb(255, 0, 0)');
					} 
					
					
					
				}
				
				for (var x = 0; x < values.length; x=x+1) {
					var canvas = document.createElement("canvas"),
						ctx2d = canvas.getContext("2d"),
						size = 64, c = size / 2  - 0.5, innerRadius = 2, outerRadius = 7;

					canvas.width = size;
					canvas.height = size;



					var gradient = ctx2d.createRadialGradient(c, c, innerRadius, c, c, outerRadius);
					gradient.addColorStop(0, values[x]);		

					ctx2d.fillStyle = gradient;
					ctx2d.arc(c, c, outerRadius, 0, 2 * Math.PI, false);
					ctx2d.fill();


					placemark = new WorldWind.Placemark(new WorldWind.Position(23.1815,79.9861, 1e2), false, null);
					placemark.altitudeMode = WorldWind.RELATIVE_TO_GROUND;
					if (parseFloat(probs[x]) < 0.0){
						console.log("");
					}
					else{
						placemark.label = ((parseFloat(probs[x])).toFixed(1)).toString() + "mm";

						}
					
					if (probs[x] < 0.3){

						placemark.enabled =true;

						high.push(placemark);
					 }

					else if(probs[x] > 0.3 && probs[x] < 0.5 ){

						placemark.enabled = true;

						high.push(placemark);


					 }

					 else{
					 	placemark.enabled = false;

					 	high.push(placemark);
					 	placemark.enabled = false;


					 }

				


					
					placemarkAttributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
					placemarkAttributes.imageSource = new WorldWind.ImageSource(canvas);
					placemark.attributes = placemarkAttributes;

					
					highlightAttributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
					highlightAttributes.imageScale = 1.2;
					placemark.highlightAttributes = highlightAttributes;


					
					if(x==0){
						placemarkLayer1.addRenderable(placemark);
					}
					else if(x==1){
						placemarkLayer2.addRenderable(placemark);
					}
					else if(x==2){
						placemarkLayer3.addRenderable(placemark);
					}
					else if(x==3){
						placemarkLayer4.addRenderable(placemark);
					}
					else if(x==4){
						placemarkLayer5.addRenderable(placemark);
					}
					else if(x==5){
						placemarkLayer6.addRenderable(placemark);
					}
					else{
						console.log("ERROR");
					}
				}
				
				
       
				  
				  $('#data').click(function () {
					 show();
					 
					});  
				

				 function show(){
					
					   var v=document.test.optradio.value;
					   var date=(document.test.cropdate.value).substring(9,10);
					   var one=new Date();
					   var two = new Date(one.getTime() + (24 * 60 * 60 * 1000));
						var three = new Date(two.getTime() + (24 * 60 * 60 * 1000));
						var four = new Date(three.getTime() + (24 * 60 * 60 * 1000));
						var did=date-one.getDate();
						
					  
					   if((v==1)&&(did==0))
						{ 
					
						dayLoaded(0);
						<%count++;%>
						} 
					  	else if((v==1)&&(did==1)){
						
						  dayLoaded(3);
						  <%count++;%>
					  	}
					  else if((v==1)&&(did==2)){
						
						  dayLoaded(6);
						  <%count++;%>
					  }
					  else if((v==2)&&(did=0))
						  {
						
						 dayLoaded(1);
						 <%count++;%>
						  }
					  else if((v==2)&&(did=1)){
						
						  dayLoaded(4); 
						  <%count++;%>
					  }
					  else if((v==2)&&(did=2)){
						 
						  dayLoaded(7);
						  <%count++;%>
					  }
					  else if((v==3)&&(did=0))
						  {
						
						 dayLoaded(2);
						 <%count++;%>
						  
						  }
					  else if((v==3)&&(did=1)){
						
						  dayLoaded(5);
						  <%count++;%>
					  } 
					  else if((v==3)&&(did=2)){
						
						  dayLoaded(8);
						  <%count++;%>
					  }
					 
					 
				  }   
    
    new_layers = [placemarkLayer1,placemarkLayer2,placemarkLayer3,placemarkLayer4,placemarkLayer5,placemarkLayer6];
			wwd.addLayer(new_layers[0]);

			var highlightedItems = [];
			var layerManger = new LayerManager(wwd);

	        uncheckbox();
	        highlight();

	        

			
			
		


		
		

		function highlight(){
			wwd.addEventListener("mousemove", handlePick);
			
		}
		var oldlabel = "placeholder"; 
		function handlePick(o) {
                var x = o.clientX,
                    y = o.clientY;
       
                var redrawRequired = highlightedItems.length > 0;

                for (var h = 0; h < highlightedItems.length; h++) {
                    highlightedItems[h].highlighted = false;
                    highlightedItems[h].label = oldlabel;
                    
                }
                highlightedItems = [];

                var pickList = wwd.pick(wwd.canvasCoordinates(x, y));
                if (pickList.objects.length > 0) {
                    redrawRequired = true;
                }

                if (pickList.objects.length > 0) {
                    for (var p = 0; p < pickList.objects.length; p++) {
                        if (!pickList.objects[p].isTerrain) {
                            pickList.objects[p].userObject.highlighted = true;
                            oldlabel = pickList.objects[p].userObject.label;
                            pickList.objects[p].userObject.label = "Lat:"  + wwd.navigator.lookAtLocation.latitude.toPrecision(7).toString() + "\n Long:" + wwd.navigator.lookAtLocation.longitude.toPrecision(7).toString();

                          
                            

                            highlightedItems.push(pickList.objects[p].userObject);
                        }
                    }
                }

                if (redrawRequired) {
                    wwd.redraw(); 
                }
            }	
		function dayLoaded(day) {
			console.log("Nothin to see here, just some good ol' log!");
				wwd.removeLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
		
			if(day==0){
				wwd.addLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
			}
			else if(day==1){
				wwd.removeLayer(new_layers[0]);
				wwd.addLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
			}
			else if(day==2){
				wwd.removeLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.addLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
			}
			else if(day==3){
				wwd.removeLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.addLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
			}
			else if(day==4){
				wwd.removeLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.addLayer(new_layers[4]);
				wwd.removeLayer(new_layers[5]);
			}
			else if(day==5){
				wwd.removeLayer(new_layers[0]);
				wwd.removeLayer(new_layers[1]);
				wwd.removeLayer(new_layers[2]);
				wwd.removeLayer(new_layers[3]);
				wwd.removeLayer(new_layers[4]);
				wwd.addLayer(new_layers[5]);
			}
			else{
				console.log("ERROR");
			}
		}
	});	

    
     
    
</script>
    
    
    
