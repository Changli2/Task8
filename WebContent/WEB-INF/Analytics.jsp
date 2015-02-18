<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="random" class="java.util.Random" scope="application"/>
<jsp:include page="Header.jsp"></jsp:include>

	<div class="col-md-6 column" style="height:100%;">
		<div id="analyticsContent" >
    		<div class="page-header" id="chart-title">
   				<h3>Most Searched Cities</h3>
   			</div>
    		<div id="map-chart"></div>
    	</div>
    </div>
    
    <script type="text/javascript">
		google.load('visualization', '1.0', {'packages':['corechart']});
	    google.setOnLoadCallback(drawChart);
	    
	    var w= document.getElementById('analyticsContent').clientWidth;
	    var h = document.getElementById('analyticsContent').clientHeight 
	    	- document.getElementById('chart-title').offsetHeight;
	    
	    console.log(w);
	    console.log(h);
	
	    function drawChart() {
	
	      var data = google.visualization.arrayToDataTable([
	        ['City','Number of Search'],
	        <c:forEach var="city" items="${topten}">
	          ['${city.locName}', ${city.count}],
	        </c:forEach>
	      ]);
	
	      var options = {
	        title: '',
	        hAxis: {
	          title: 'Number of Explored',
	          minValue: 0
	        },
	        vAxis: {
	          title: 'City'
	        }
	      };
	
	      var chart = new google.visualization.BarChart(document.getElementById('map-chart'));
	
	      chart.draw(data, options);
	    }
    </script>
    
    <div class="col-md-6 column" style="height:100%;">
    	<div id="curveContent">
    		<div class="page-header" id="chart-title">
   				<h3>Daily User Visit Count</h3>
   			</div>    
    		<div id="curve_chart"></div>
    	</div>
    </div>
     <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', 'Number of Visits'],
          ['2013',  1000],
          ['2014',  1170],
          ['2015',  660],
          ['2016',  1030]
        ]);

        var options = {
          title: '',
          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
      }
    </script>

<jsp:include page="Footer.jsp"></jsp:include>