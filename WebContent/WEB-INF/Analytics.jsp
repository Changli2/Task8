<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="random" class="java.util.Random" scope="application"/>
<jsp:include page="Header.jsp"></jsp:include>

	<div class="page-header">
   		<h1>Top ${num} Trending Tweets Chart</h1>
   	</div>
    
    <!-- <div style="width: 100%; height: 500px;" id="chart_div"></div> -->
    
	<script type="text/javascript">
		google.load('visualization', '1.0', {'packages':['corechart']});
	    google.setOnLoadCallback(drawChart);
	    
	    var w = window.innerWidth;
	
	    function drawChart() {
	
	      var data = google.visualization.arrayToDataTable([
	        ['City','Number of Search'],
	        <c:forEach var="city" items="${topten}">
	          ['${city.locName}', ${city.count}],
	        </c:forEach>
	      ]);
	
	      var options = {
	        title: '',
	        width: w,
	        height: 563,
	        hAxis: {
	          title: 'Number of Clicks',
	          minValue: 0
	        },
	        vAxis: {
	          title: 'City'
	        }
	      };
	
	      var chart = new google.visualization.BarChart(document.getElementById('ex0'));
	
	      chart.draw(data, options);
	    }
    </script>
    
    <div id="ex0"></div>

<jsp:include page="Footer.jsp"></jsp:include>