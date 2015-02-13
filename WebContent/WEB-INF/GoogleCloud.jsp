<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        // Create and populate a data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Tag');
        data.addColumn('string', 'URL');
        data.addRows(${num});
        <c:set var="rowNum" value="${0}"/> 
        <c:forEach var="trends" items="${twitTrends}">
        	data.setCell(${rowNum}, 0, '${trends}');
        	<c:set var="url" value="http://${trends}"/>
        	data.setCell(${rowNum}, 1, '${url}');
        	<c:set var="rowNum" value="${rowNum + 1}"/>
        </c:forEach>
        
     	// Instantiate our table object.
        var vis = new gviz_word_cumulus.WordCumulus(document.getElementById('mydiv'));

        // Draw our table with the data we created locally.
        vis.draw(data, {text_color: '#c5405b', speed: 25, width:window.innerWidth, height:window.innerHeight});
               
     }
   </script>
  </head>

  <body>
        <h1>Top ${num} Trending Tweets</h1>
        <div id="mydiv"></div>        
  </body>
</html>