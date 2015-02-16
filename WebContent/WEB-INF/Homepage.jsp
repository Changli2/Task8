<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="Header.jsp"></jsp:include>

<script>
 
 		var map;
 		
 		function CenterControl(controlDiv, map, position) {

 			  // Set CSS for the control border
 			  var controlUI = document.createElement('div');
 			  controlUI.style.backgroundColor = '#eeeeee';
 			  controlUI.style.border = '2px solid #fff';
 			  controlUI.style.borderRadius = '3px';
 			  controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
 			  controlUI.style.cursor = 'pointer';
 			  controlUI.style.marginBottom = '22px';
 			  controlUI.style.textAlign = 'center';
 			  controlUI.title = 'Click to recenter the map';
 			  controlDiv.appendChild(controlUI);

 			  // Set CSS for the control interior
 			  var controlText = document.createElement('div');
 			  controlText.style.color = 'rgb(25,25,25)';
 			  controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
 			  controlText.style.fontSize = '16px';
 			  controlText.style.lineHeight = '38px';
 			  controlText.style.paddingLeft = '5px';
 			  controlText.style.paddingRight = '5px';
 			  controlText.innerHTML = 'My Location';
 			  controlUI.appendChild(controlText);

 			  // Setup the click event listeners: simply set the map to user location
 			  google.maps.event.addDomListener(controlUI, 'click', function() {
 			    map.setCenter(position)
 			  });

 			}

		function initialize() {
   			var mapOptions = {
     			zoom: 8,
     			disableDefaultUI: true
   			};
   			
   			map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);

   			// Try HTML5 geolocation
   			if(navigator.geolocation) {
     			navigator.geolocation.getCurrentPosition(function(position) {
       				var uLocate = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
       				
			var infowindow = new google.maps.InfoWindow(
											{
												map : map,
												position : uLocate,
												content : '<a href="googleCloud.do?lat='
													+ uLocate.lat()
													+ '&lng='
													+ uLocate.lng()
													+ '">'
													+ 'Click here to start the fun or click anywhere else in the map'
													+ '</a>'
										});

								/* var infowindow = new google.maps.InfoWindow({
									map: map,position: pos2
									   ,content: 'Nearest Location'
								}); */

								map.setCenter(uLocate);

								// Create the DIV to hold the control and
								// call the CenterControl() constructor passing
								// in this DIV.
								var centerControlDiv = document
										.createElement('div');
								var centerControl = new CenterControl(
										centerControlDiv, map, uLocate);

								centerControlDiv.index = 1;
								map.controls[google.maps.ControlPosition.RIGHT_BOTTOM]
										.push(centerControlDiv);
							}, function() {
								handleNoGeolocation(true);
							});
		} else {
			// Browser doesn't support Geolocation
			handleNoGeolocation(false);
		}

		google.maps.event.addListener(map, 'click', function(e) {
			placeMarker(e.latLng, map);
		});
	}

	function handleNoGeolocation(errorFlag) {
		if (errorFlag) {
			var content = 'We apologized, we cannot locate your current location';
		} else {
			var content = 'Your browser doesn\'t support geolocation.';
		}

		var options = {
			map : map,
			position : new google.maps.LatLng(60, 105),
			content : content
		};

		var infowindow = new google.maps.InfoWindow(options);
		map.setCenter(options.position);
	}

	function placeMarker(position, map) {
		/* var marker = new google.maps.Marker({
		  position: position,
		  map: map
		}); */

		var infowindow = new google.maps.InfoWindow({
			map : map,
			position : position,
			content : '<a href="googleCloud.do?lat=' + position.lat() + '&lng='
					+ position.lng() + '">'
					+ 'Want to see what is the trend around this place?'
					+ '</a>'
		});

		/* var infowindow = new google.maps.InfoWindow(
				{
					map : map,
					position : position,
					content : '<a href="googleCloud.do">'
							+ 'New Coordinate: '+ position.lat()
							+ ' & ' + position.lng() + '</a>'
				}); */

		/* map.panTo(position); */
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div id="appcontent">
	<div id="map-canvas"></div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>