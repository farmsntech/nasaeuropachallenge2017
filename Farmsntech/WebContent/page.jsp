<%@page import="com.farmsntech.crop.ClimateUtils"%>
<%@page import="com.farmsntech.crop.reading"%>
<%@page import="com.farmsntech.Temp"%>
<%@page import="com.farmsntech.crop.Prediction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

    <title>Compass Starter by Ariona, Rian</title>

    <!-- Loading third party fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">

    <!-- Loading main css file -->
    <link rel="stylesheet" href="style.css">

    <!-- Custom CSS -->
    <link href="csspredict/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="csspredict/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
      <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

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
        
        
       

.bg-1{
    background-image: url("images/farm.jpg");
}


.selectWrapper{
  border-radius:36px;
  display:inline-block;
  overflow:hidden;
  background:black;
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
 String a=request.getParameter("name"); 
String[] weather = a.split(",");
float[] wg=new float[40];
int i=0;
for(i=0;i<21;i++)
{
wg[i] = Float.parseFloat(weather[i]);
}

for(i=21;i<30;i++)
{
wg[i] = 20;
}


String fgh=request.getParameter("name2"); 
String[] climate = fgh.split(",");
int k=0;
for(k=0;k<climate.length;k++){
	
	System.out.println(climate[k]);
}
float[] cl=new float[70];
String[] sum = new String[10];
k=0;
int k1=0;
int l=0;
for(k=0;k<climate.length;k++)
{
if(k!=6 && k!=13 && k!=20 && k!=27 && k!=34 && k!=41 && k!=48 && k!=55)	{
	
cl[k1] = Float.parseFloat(climate[k]);
System.out.println(cl[k1]);

k1++;
}
else
{
	sum[l]=climate[k];
	l++;
}
}

System.out.println(fgh);

int k2=0;


//ClimateUtils.insertcli(cl,sum,k2);



  int b=Integer.parseInt(request.getParameter("canal")); 
  int c= Integer.parseInt(request.getParameter("crop")); 
  int d=Integer.parseInt(request.getParameter("stage")); 
   
String message= Prediction.predict(a,b,c,d); 
%>
<body>


    <select name="crop">
				
			   
			    <option > Rice </option>    
			      <option>Wheat</option>  
			        <option> Maize </option>  
			
			
		                      </select> 

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
                
                 <select name="crop">
				
			   
			    <option > Rice </option>    
			      <option>Wheat</option>  
			        <option> Maize </option>  
			
			
		                      </select> 
                    <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                    <ul class="menu">
                        <li class="menu-item current-menu-item"><a href="index.html">Home</a></li>
                        <li class="menu-item"><a href="news.html"></a></li>
                      <!--   <li class="menu-item"><a href="live-cameras.html">ONGOING CROP</a></li> -->
                        
                    </ul>
                    <!-- .menu -->
                </div>
                <!-- .main-navigation -->

                <div class="mobile-navigation"></div>

            </div>
        </div>
        <!-- .site-header -->

        <div class="hero bg-1" >
            <div class="container">
                <div class="row">
                   <!--  <div class="col m4">

                          
                         
                           <select name="crop">
				
			   
			    <option > Rice </option>    
			      <option>Wheat</option>  
			        <option> Maize </option>  
			
			
		                      </select> 
		                       <br>
                    </div> -->
                    
                    <div class="col m2 offset-m2">
                    
                       <h1 style="color:#263238;""> RICE</h2>
                    
                    </div>
                    <div class="col m6">
                        <h2 id="location" style="color:#263238 ; font-size:30px; font-weight:1900;">
                     <b></b></h2>
                    </div>
                    
                     

                    <div class="col m2">
                        <form action="#" class="find-location">
                                    
                          <a class="waves-effect waves-light btn" ><i class="fa fa-crosshairs"></i>Track Me</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="forecast-table">
            <div class="container">
                <div class="forecast-container">
                     <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 1</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-3.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[1]%><sup>o</sup>F</div>
                            <small><%=wg[0]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 2</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-3.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[4]%><sup>o</sup>F</div>
                            <small><%=wg[3]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 3</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-5.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[7]%><sup>o</sup>F</div>
                            <small><%=wg[6]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 4</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-7.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[10]%><sup>o</sup>F</div>
                            <small><%=wg[9]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 5</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-12.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[13]%><sup>o</sup>F</div>
                            <small><%=wg[12]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 6</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-13.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[16]%><sup>o</sup>F</div>
                            <small><%=wg[15]%><sup>o</sup></small>
                        </div>
                    </div>
                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 7</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-14.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=wg[19]%><sup>o</sup>F</div>
                            <small><%=wg[18]%><sup>o</sup></small>
                        </div>
                    </div>

                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 8</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-14.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=75.8%><sup>o</sup>F</div>
                            <small><%=72.4%><sup>o</sup></small>
                        </div>
                    </div>

                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 9</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-14.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=79.4%><sup>o</sup>F</div>
                            <small><%=75.1%><sup>o</sup></small>
                        </div>
                    </div>

                    <div class="forecast">
                        <div class="forecast-header">
                            <div class="day">DAY 10</div>
                        </div>
                        <!-- .forecast-header -->
                        <div class="forecast-content">
                            <div class="forecast-icon">
                                <img src="images/icons/icon-14.svg" alt="" width=48>
                            </div>
                            <div class="degree"><%=80.45%><sup>o</sup>F</div>
                            <small><%=75.1%><sup>o</sup></small>
                        </div>
                    </div>

                    
                </div>
            </div>
        </div>


       
        
        
         <div class="row">
              <h2 class="center-align"> RAINFALL & WINDSPEED</h2>
            <div class="col-md-12">
             <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            
            </div>
         
         </div>
         
         <br> <br>
        
   


       <div class="container-fluid">  
       
          <div class="row"> <div class="container col m6 offset-m4" style="font-size:50px; color:white;""> IDEAL CONDITIONS </div>    </div>
            <br> <br> <br> <br>
           <ul class="collapsible blue-grey darken-3" data-collapsible="accordion">
    <li>
      <div class="collapsible-header" style="background-color:"#37474f; "><i class="material-icons"></i><b style="#37474f;font-size:30px;">Sowing</b></div>
      <div class="collapsible-body"><span style="font-size:20px;"><b> Min Temperature</b>:10<sup>o</sup>C   &nbsp; &nbsp; &nbsp; &nbsp;<b> Max Temperature</b>:30<sup>o</sup>C &nbsp;&nbsp; &nbsp; &nbsp; <b>Water Level</b>:4-5 cm </span></div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons"></i><b style="#37474f;font-size:30px;">Germination Phase </b></div>
      <div class="collapsible-body"><span style="font-size:20px;"><b> Min Temperature</b>:10<sup>o</sup>C &nbsp;&nbsp; <b> Max Temperature</b>:30<sup>o</sup>C &nbsp;&nbsp;<b>Water Level</b>:2-3 cm  </span></div>
    </li>
    <li>
      <div class="collapsible-header"><i class="material-icons"></i><b style="#37474f;font-size:30px;">Vegetative Phase</b></div>
      <div class="collapsible-body"><span style="font-size:20px;"><b> Min Temperature</b>:20<sup>o</sup>C &nbsp;&nbsp; <b> Max Temperature</b>:35<sup>o</sup>C &nbsp; &nbsp;<b>Water Level</b>:2 cm  </span></div>
    </li>
      
       <li>
      <div class="collapsible-header"><i class="material-icons"></i> <b style="#37474f;font-size:30px;"> Reproductive Phase </b></div>
      <div class="collapsible-body"><span style="font-size:20px;"><b> Min Temperature</b>:20<sup>o</sup>C &nbsp; &nbsp; <b> Max Temperature</b>:40<sup>o</sup>C &nbsp; &nbsp; <b>Water Level</b>:1-2 cm </span></div>
    </li>   
               
       <li>
      <div class="collapsible-header"><i class="material-icons"></i> <b style="#37474f;font-size:30px;"> Ripening Phase </b> </div>
      <div class="collapsible-body"><span style="font-size:20px;"><b> Min Temperature</b>:10<sup>o</sup>C &nbsp; &nbsp; <b> Max Temperature</b>:40<sup>o</sup>C &nbsp; &nbsp; <b>Water Level</b>:1-2 cm </span></div>
    </li>                        
               

               
               
  </ul>
  
  
          </div>
          
         
         <div class="row"> <div class="container col m6 offset-m4 " style="font-size:50px; color:white;""> MESSAGE </div>    </div>
         
         <div class="row">
           
             <div class="col m8 offset-m2 ">
                        <p id="location" style="color:white ; font-size:30px; font-weight:1900">
                     <b><%=message %></b></p>
                    </div>
            
         </div>
         
      
    
    </div>

    <script src="jspredict/jquery-1.11.1.min.js"></script>
    <script src="jspredict/plugins.js"></script>
    <script src="jspredict/app.js"></script>
    <script src="jspredict/plugins/morris/raphael.min.js"></script>
    <script src="jspredict/plugins/morris/morris.min.js"></script>
   <!--  <script src="jspredict/plugins/morris/morris-data.js"></script> -->

   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>

    <!-- Bootstrap Dropdown Hover JS -->
    
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</body>

</html>




<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyAFmisFXtP-sbpxrFbA599VRj2Emoy2FD0"></script>
 </script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
 <script>
(function(){
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
                    	 x.innerHTML=results[1].formatted_address;
                    }
                }
            });
	}
	
})();</script>
<%int number=0; 
try{
	number = (Integer)session.getAttribute("mobile");
}
catch(Exception e)
{
	
}


%>
<script>
	jQuery(document).ready(function($) {
	  $.ajax({
	  url : "http://api.textlocal.in/send/?username=prasanthaitha11@gmail.com&hash=83df433ec3bb9e346575e5b9eb0eca85e85318e7624d64608254e6814081b508&sender=TXTLCL&numbers=+91<%=number%>&message=Your One Time Password is"+<%=message%>,
		  dataType : "jsonp",
		  success : function(parsed_json) {
		  	var temp = parsed_json['balance'];
			alert(temp);
			
		  }
	  });
	});</script>
<script>






Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: ''
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['06-08-2017', '07-08-2017', '08-08-2017', '09-08-2017', '10-08-2017','11-08-2017','012-08-2017','13-08-2017','14-08-2017','15-08-2017']
    },
    yAxis: {
        title: {
            text: 'Rainfall (in mm)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        
        data: [<%=wg[2]%>,<%=wg[5]%>,<%=wg[8]%>,<%=wg[11]%>,<%=wg[14]%>,<%=wg[17]%>,<%=wg[20]%>,<%=6.4%>,<%=7.4%>,<%=3.2%>]
    }, {
        
        data: [4.0, 4.2, 5.7, 8.5,4.9, 6.2, 7.0, 4.6, 8.2, 10.3]
    }]
});
     

    <%--  $(function() {

    // Area Chart
    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            iphone: <%=wg[2]%>,
            
           
        }, {
            period: '2010 Q2',
            iphone: <%=wg[5]%>,
          
          
        }, {
            period: '2010 Q3',
            iphone: <%=wg[8]%>,
            
            
            
        }, {
            period: '2010 Q4',
            iphone: <%=wg[11]%>,
            
          
        }, {
            period: '2011 Q1',
            iphone: <%=wg[14]%>,
            
          
        }, {
            period: '2011 Q2',
            iphone: <%=wg[17]%>,
            
          
        }, {
            period: '2011 Q3',
            iphone: <%=wg[20]%>,
            
          
        }, {
            period: '2011 Q4',
            iphone: <%=wg[23]%>,
            
            
        }, {
            period: '2012 Q1',
            iphone: <%=wg[26]%>,
            
           
        }, {
            period: '2012 Q2',
            iphone: <%=wg[29]%>,
            
        }],
        xkey: 'period',
        ykeys: ['iphone'],
        labels: ['iPhone','ipad'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });
    
  }); --%>
  
  
 
     </script>
    

<%-- <%Temp.add(); %> --%>
<%-- <%reading.read(); %> --%>

</body>
</html>