<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/wordcumulus.js"></script>
    <script type="text/javascript" src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/swfobject.js"></script>
    <script type="text/javascript">
      google.load("visualization", "1");

      // Set callback to run when API is loaded
      google.setOnLoadCallback(drawVisualization);

      // Called when the Visualization API is loaded.
      function drawVisualization() {
    	  
    	var location;
    	  
    	function getLocation() {
    		if (navigator.geolocation) {
    	  		navigator.geolocation.getCurrentPosition(showPosition);
    	  	} else { 
    	  		return "Geolocation is not supported by this browser.";
    	  	}    	  	
    	}

    	function showPosition(position){ 
    		return "Latitude: " + position.coords.latitude + " Longitude: " + position.coords.longitude;
    	}

        // Create and populate a data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Tag');
        data.addColumn('string', 'URL');
        data.addRows(6);
        data.setCell(0, 0, 'Aayush');
        data.setCell(0, 1, 'http://www.youtube.com/results?search_query=brazil+fifa+world+cup');
        data.setCell(1, 0, 'Thomas');
        data.setCell(1, 1, 'http://www.youtube.com/results?search_query=italy+fifa+world+cup');
        data.setCell(2, 0, 'Sthepanie');
        data.setCell(2, 1, 'http://www.youtube.com/results?search_query=germany+fifa+world+cup');
        data.setCell(3, 0, 'Chang');
        data.setCell(3, 1, 'http://www.youtube.com/results?search_query=argentina+fifa+world+cup');
        data.setCell(4, 0, 'Ahmad');
        data.setCell(4, 1, 'http://www.youtube.com/results?search_query=uruguay+fifa+world+cup');
        data.setCell(5, 0, 'Your location: '+ location);
        data.setCell(5, 1, 'http://www.youtube.com/results?search_query=uruguay+fifa+world+cup');
        // Instantiate our table object.
        var vis = new gviz_word_cumulus.WordCumulus(document.getElementById('mydiv'));

        // Draw our table with the data we created locally.
        vis.draw(data, {text_color: '#ff4444', speed: 50, width:600, height:600});
       }
   </script>
  </head>

  <body>
        <big>FIFA World Cup: Country appearances in the final four</big>
        <div> </div>
        <div id="mydiv"></div>
        
  </body>
</html>