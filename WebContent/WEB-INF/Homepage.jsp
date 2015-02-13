<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="Header.jsp"></jsp:include>

 <script>
 
 		var map;

		function initialize() {
   			var mapOptions = {
     			zoom: 15
   			};
   			
   			map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);

   			// Try HTML5 geolocation
   			if(navigator.geolocation) {
     			navigator.geolocation.getCurrentPosition(function(position) {
       				var pos1 = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
       				/* var pos2 = new google.maps.LatLng(position.coords.latitude+0.003000,position.coords.longitude+0.003000); */

       				var infowindow = new google.maps.InfoWindow({
         								map: map,position: pos1
         						   	   ,content: '<a href="googleCloud.do">' + 'You are here' + '</a>'
       				});
       				
       				/* var infowindow = new google.maps.InfoWindow({
							map: map,position: pos2
					   	   ,content: 'Nearest Location'
					}); */

       				map.setCenter(pos1);
     			}, function() {
       				handleNoGeolocation(true);
     			   });
   			} else {
     		 	// Browser doesn't support Geolocation
     			handleNoGeolocation(false);
   			}
 		}

 		function handleNoGeolocation(errorFlag) {
   			if (errorFlag) {
     			var content = 'We apologized, we cannot locate your current location';
  			} else {
     			var content = 'Your browser doesn\'t support geolocation.';
   			}

  			var options = {
     						map: map,
     						position: new google.maps.LatLng(60, 105),
     						content: content
   			};

   			var infowindow = new google.maps.InfoWindow(options);
   			map.setCenter(options.position);
 		}

 		google.maps.event.addDomListener(window, 'load', initialize);
 
 </script>
<div id="appcontent">
	<div id="map-canvas"></div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>