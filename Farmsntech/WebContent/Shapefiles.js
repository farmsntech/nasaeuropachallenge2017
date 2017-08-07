
requirejs(['../src/WorldWind',
        './LayerManager'],
    function (ww,
              LayerManager) {
       // "use strict";

        WorldWind.Logger.setLoggingLevel(WorldWind.Logger.LEVEL_WARNING);

        var wwd = new WorldWind.WorldWindow("canvasOne");
        wwd.goTo(new WorldWind.Location(23,79));
        var layers = [
            {layer: new WorldWind.BMNGLayer(), enabled: true},
            {layer: new WorldWind.BMNGLandsatLayer(), enabled: false},
            /*{layer: new WorldWind.BingAerialWithLabelsLayer(null), enabled: true},
            {layer: new WorldWind.CompassLayer(), enabled: true},
            {layer: new WorldWind.CoordinatesDisplayLayer(wwd), enabled: true},
            {layer: new WorldWind.ViewControlsLayer(wwd), enabled: true},
            {layer: new WorldWind.ViewControlsLayer(wwd), enabled: true},
            {layer: new WorldWind.AtmosphereLayer(), enabled:true}*/
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
			// Set up the common placemark attributes.
			placemarkAttributes.imageScale = 1;
			placemarkAttributes.imageOffset = new WorldWind.Offset(
				WorldWind.OFFSET_FRACTION, 0.5,
				WorldWind.OFFSET_FRACTION, 0.5);
			placemarkAttributes.imageColor = WorldWind.Color.WHITE;
			//variables for placemark classification.
			var low = [];
			var mid = [];
			var high = [];
			//Django cycle handles placemark generation and rendering.		
			
				//probs is an array of svm predictions.			
				var probs = ['0.709765462183','0.3439262356','0.51069922022','0.21189762915','0.210608934365','0.212842157527'];
				var values = []
				//give a colour to a placemark based upon its predicted probability.
				for (var y = 0; y < probs.length; y=y+1){
					if(probs[y] < 0.20){
						values.push('rgba(34, 139, 34, 0)');
					}
					else if(probs[y] > 0.19 && probs[y] < 0.3){
						values.push('rgb(255, 214, 51)');
					}
					else if(probs[y] > 0.29 && probs[y] < 0.4){
						values.push('rgb(255, 167, 0)');
					}
					else if(probs[y] > 0.39 && probs[y] < 0.5){
						values.push('rgb(255, 131, 0)');
					}
					else if(probs[y] > 0.49 && probs[y] < 0.6){
						values.push('rgb(255, 84, 0)');
					}
					else if(probs[y] > 0.59 && probs[y] < 0.7){
						values.push('rgb(255, 42, 0)');
					}
					else if(probs[y] > 0.69 && probs[y] < 0.8){
						values.push('rgb(230, 0, 0)');
					}		
					else if(probs[y] > 0.79 && probs[y] < 0.9){
						values.push('rgb(26, 0, 0)');
					}							
					else{
						values.push('rgb(0, 0, 0)');
					}
					
				}
				
				for (var x = 0; x < values.length; x=x+1) {
					var canvas = document.createElement("canvas"),
						ctx2d = canvas.getContext("2d"),
						size = 64, c = size / 2  - 0.5, innerRadius = 2, outerRadius = 7;

					canvas.width = size;
					canvas.height = size;

					// Create the custom image for the placemark.


					var gradient = ctx2d.createRadialGradient(c, c, innerRadius, c, c, outerRadius);
					gradient.addColorStop(0, values[x]);		

					ctx2d.fillStyle = gradient;
					ctx2d.arc(c, c, outerRadius, 0, 2 * Math.PI, false);
					ctx2d.fill();


					// Create the placemark.
					placemark = new WorldWind.Placemark(new WorldWind.Position(23.1815,79.9861, 1e2), false, null);
					placemark.altitudeMode = WorldWind.RELATIVE_TO_GROUND;
					//generate placemark labels that give placemark probs and classify placemarks based on probs
					if (parseFloat(probs[x]) < 0.2){
						console.log("");
					}
					else{
						placemark.label = ((parseFloat(probs[x])*100).toFixed(1)).toString() + "%";

						}
					
					if (probs[x] < 0.3){

						placemark.enabled =false;

						low.push(placemark);
					 }

					else if(probs[x] > 0.3 && probs[x] < 0.5 ){

						placemark.enabled = false;

						mid.push(placemark);


					 }

					 else{
					 	placemark.enabled = false;

					 	high.push(placemark);
					 	placemark.enabled = false;


					 }

					


					
					// Create the placemark attributes for the placemark.
					placemarkAttributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
					// Wrap the canvas created above in an ImageSource object to specify it as the placemark image source.
					placemarkAttributes.imageSource = new WorldWind.ImageSource(canvas);
					placemark.attributes = placemarkAttributes;

					// Create the highlight attributes for this placemark. Note that the normal attributes are specified as
					// the default highlight attributes so that all properties are identical except the image scale. You could
					// instead vary the color, image, or other property to control the highlight representation.
					highlightAttributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
					highlightAttributes.imageScale = 1.2;
					placemark.highlightAttributes = highlightAttributes;


					// Add the placemark to the layer.
					
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
    
    
    
    new_layers = [placemarkLayer1,placemarkLayer2,placemarkLayer3,placemarkLayer4,placemarkLayer5,placemarkLayer6];
			wwd.addLayer(new_layers[0]);

			var highlightedItems = [];
			var layerManger = new LayerManager(wwd);

	        //Reveal all placemarks generated
	        uncheckbox();
	        //Activate highlight observation.
	        highlight();

	        //On button click show different day.
			$( "#button1" ).click(function() {
  				dayLoaded(0)
			});
			$( "#button2" ).click(function() {
  				dayLoaded(1)
			});
			$( "#button3" ).click(function() {
  				dayLoaded(2)
			});
			$( "#button4" ).click(function() {
  				dayLoaded(3)
			});
			$( "#button5" ).click(function() {
  				dayLoaded(4)
			});
			$( "#button6" ).click(function() {
  				dayLoaded(5)
			});

			//Determines which checkboxes were ticked and decides which placemarks to make invisible.
			$(function () {
				$("#btnCheck").click(function () {
	            	var isChecked1 = $("#check1").is(":checked");
	            	var isChecked2 = $("#check2").is(":checked");
	            	var isChecked3 = $("#check3").is(":checked");
	            	
	            	if(isChecked1 && isChecked2 && isChecked3){

	            		uncheckbox();
	            	}
	            	else if (isChecked1) {

	            		if(isChecked2){

	            			checkboxes(high);
	            		}
	            		else if(isChecked3){

	            			checkboxes(mid);
	            		}
	            		else{
	            			checkbox(mid,high);

	            		}
	                } 
	            	else if (isChecked2){

	            		if(isChecked1){

	            			checkboxes(high);
	            		}
	            		else if(isChecked3){

	            			checkboxes(low);
	            		}
	            		else{
	            			checkbox(low,high);
	            		}
	                
	            	}

	            	else if(isChecked3){

	            		if(isChecked1){

	            			checkboxes(mid);
	            		}

	            		else if(isChecked2){


	            			checkboxes(low);
	            		}

	            		else{

	            			checkbox(low,mid);

	            		}

	            	}

	            	else{

	            		uncheckbox();
	            	}

	            });
			});	
			//generates survey popup using an Iframe in a fancybox.
			$("#button7").click (function () {
				$("#various3").fancybox({
				                'width'             : '75%',
				                'height'            : '75%',
				                'autoScale'         : false,
				                'transitionIn'      : 'none',
				                'transitionOut'     : 'none',
				                'type'              : 'iframe'
				            });

				} );

		


		
		//makes two classes of placemarks invisible
		function checkbox(option1,option2){

			uncheckbox();



			for(var i = 0; i < option1.length-1; i++){



				option1[i].enabled = false;



			}

			for(var i = 0; i < option2.length-1; i++){



				option2[i].enabled = false;



			}


		}
		//Makes a class of placemarks invisible. 
		function checkboxes(option){

			uncheckbox();

			for(var i = 0; i < option.length-1; i++){



				option[i].enabled = false;



			}



		}	

		//A placemark reset. It makes all placemarks visible.
		function uncheckbox(){



			for(var i = 0; i < low.length-1; i++){



				low[i].enabled = true;



			}

			for(var i = 0; i < mid.length-1; i++){



				mid[i].enabled = true;



			}

			for(var i = 0; i < high.length-1; i++){



				high[i].enabled = true;



			}


		}

		function highlight(){
			wwd.addEventListener("mousemove", handlePick);
			
		}
		var oldlabel = "placeholder"; 
		function handlePick(o) {
                // the mouse location.
                var x = o.clientX,
                    y = o.clientY;
       
                var redrawRequired = highlightedItems.length > 0; // must redraw if we de-highlight previous shapes

                // De-highlight any previously highlighted shapes. Reset the label back to its original value.
                for (var h = 0; h < highlightedItems.length; h++) {
                    highlightedItems[h].highlighted = false;
                    highlightedItems[h].label = oldlabel;
                    
                }
                highlightedItems = [];

                // Perform the pick. Must first convert from window coordinates to canvas coordinates, which are
                // relative to the upper left corner of the canvas rather than the upper left corner of the page.
                var pickList = wwd.pick(wwd.canvasCoordinates(x, y));
                if (pickList.objects.length > 0) {
                    redrawRequired = true;
                }

                // Highlight the items picked by simply setting their highlight flag to true. Also set label as lat and long coords.
                if (pickList.objects.length > 0) {
                    for (var p = 0; p < pickList.objects.length; p++) {
                        if (!pickList.objects[p].isTerrain) {
                            pickList.objects[p].userObject.highlighted = true;
                            oldlabel = pickList.objects[p].userObject.label;
                            pickList.objects[p].userObject.label = "Lat:"  + wwd.navigator.lookAtLocation.latitude.toPrecision(7).toString() + "\n Long:" + wwd.navigator.lookAtLocation.longitude.toPrecision(7).toString();

                          
                            

                            // Keep track of highlighted items in order to de-highlight them later.
                            highlightedItems.push(pickList.objects[p].userObject);
                        }
                    }
                }

                // Update the window if we changed anything.
                if (redrawRequired) {
                    wwd.redraw(); // redraw to make the highlighting changes take effect on the screen
                }
            }	
		//Adds and removes placemark layers depending on which button the user has clicked.			
		function dayLoaded(day) {
			console.log("Nothin to see here, just some good ol' log!");
				//remove all placemarks to stop duplicate layers from being added. 
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//        // Set up the common placemark attributes.
//        var placemarkAttributes = new WorldWind.PlacemarkAttributes(null);
//        placemarkAttributes.imageScale = 0.025;
//        placemarkAttributes.imageColor = WorldWind.Color.WHITE;
//        placemarkAttributes.labelAttributes.offset = new WorldWind.Offset(
//            WorldWind.OFFSET_FRACTION, 0.5,
//            WorldWind.OFFSET_FRACTION, 1.0);
//        placemarkAttributes.imageSource = WorldWind.configuration.baseUrl + "images/white-dot.png";
//
//        var shapeConfigurationCallback = function (attributes, record) {
//            var configuration = {};
//            configuration.name = attributes.values.name || attributes.values.Name || attributes.values.NAME;
//
//            if (record.isPointType()) {
//                configuration.name = attributes.values.name || attributes.values.Name || attributes.values.NAME;
//
//                configuration.attributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
//
//                if (attributes.values.pop_max) {
//                    var population = attributes.values.pop_max;
//                    configuration.attributes.imageScale = 0.01 * Math.log(population);
//                }
//            } else if (record.isPolygonType()) {
//                configuration.attributes = new WorldWind.ShapeAttributes(null);
//
//                // Fill the polygon with a random pastel color.
//                configuration.attributes.interiorColor = new WorldWind.Color(
//                    0.375 + 0.5 * Math.random(),
//                    0.375 + 0.5 * Math.random(),
//                    0.375 + 0.5 * Math.random(),
//                    1.0);
//
//                // Paint the outline in a darker variant of the interior color.
//                configuration.attributes.outlineColor = new WorldWind.Color(
//                    0.5 * configuration.attributes.interiorColor.red,
//                    0.5 * configuration.attributes.interiorColor.green,
//                    0.5 * configuration.attributes.interiorColor.blue,
//                    1.0);
//            }
//
//            return configuration;
//        };
//
//        var shapefileLibrary = "http://worldwindserver.net/webworldwind/data/shapefiles/naturalearth";
//
//        // Create data for the world.
//        var worldLayer = new WorldWind.RenderableLayer("Countries");
//        var worldShapefile = new WorldWind.Shapefile(shapefileLibrary + "/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp");
//        worldShapefile.load(null, shapeConfigurationCallback, worldLayer);
//        wwd.addLayer(worldLayer);
//
//        // Create data for cities.
//        var cityLayer = new WorldWind.RenderableLayer("Cities");
//        var cityShapefile = new WorldWind.Shapefile(shapefileLibrary + "/ne_50m_populated_places_simple/ne_50m_populated_places_simple.shp");
//        cityShapefile.load(null, shapeConfigurationCallback, cityLayer);
//        wwd.addLayer(cityLayer);
//
//        var fortStory = "http://worldwindserver.net/webworldwind/data/shapefiles/misc/FortStory/Trident-Spectre-Indigo-i.shp";
//        var fortStoryLayer = new WorldWind.RenderableLayer("Fort Story");
//        var fortStoryShapefile = new WorldWind.Shapefile(fortStory);
//        fortStoryShapefile.load(null, null, fortStoryLayer);
//        wwd.addLayer(fortStoryLayer);
//
//        // Create a layer manager for controlling layer visibility.
//        var layerManger = new LayerManager(wwd);
//  });