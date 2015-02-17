<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Maven Trends</title>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" class="cssdeck">
<link rel="stylesheet" href="css/bootstrapValidator.min.css" />
<link href="css/carousel.css" rel="stylesheet">
<link href="css/style-index.css" rel="stylesheet">

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">



<!-- Javascript APIs -->
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="js/wordcumulus.js"></script>
<script type="text/javascript" src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/swfobject.js"></script>

<style>
h1, h2, h3, h4, h5, h6 {
	margin-top:0;
	font-family: 'Source Sans Pro', sans-serif;
	text-transform:uppercase;
	font-weight:400;
	color:#e2284d;
}

html, body {
    margin: 0px;
    width: 100%;
    height: 100%;
}

body {
	background: url('img/page_bg.jpg');
	background-attachment: fixed;
	margin: 0;
	background-size: cover;
	background-repeat: no-repeat;
	display: compact;
	font: 13px/18px "Helvetica Neue", Helvetica, Arial, sans-serif;
}

#bar{
	background-color: #4099ff;
  	padding: 0 90px;
	height: 65px;
	box-shadow: 0px 2px 2px #606366;
}

#cloudContent {
	width: 100%;
	height: 100%;
}

#appContent {
	float: left;
    width: 50%;
    height: 90%;   
    padding-right: 1%;
    background-color: #eeeeee;
}

#analyticsContent {
	float: right;
    width: 50%;
    height: 100%;
    background-color: #eeeeee;
}

#map-canvas {
    position: relative;
	overflow: hidden;
	transform: translateZ(0px);
	background-color: rgb(229, 227, 223);
	width: 100%;
	height: 100%;	
}

#map-cloud {
	position: relative;
	overflow: hidden;
	transform: translateZ(0px);
	width: 100%;
	height: 100%;
}

#map-chart {
	position: relative;
	overflow: hidden;
	transform: translateZ(0px);
	height:90%;
}

 h1, h2, h3, h4, h5, h6 {
        text-align: center;
    }
</style>

</head>
<body>
<div class="page-header">
<Nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<!--  Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header " style="color: blue;">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only"> Toggle navigation </span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse" 
			id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#about">About</a>
                    </li>
                    <li><a href="#services">Services</a>
                    </li>
                    <li><a href="#contact">Contact</a>
                    </li>
                              
                </ul>
        </div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li>
					<a id="logo-outer" href="homePage.do"><h2>Maven Trends</h2></a>
				</li>
			</ul>
		</div>
</div>
</nav>
</div>
<div id="twitterbutton" style="position: relative;left: 15px;top: 25px;z-index: 100;margin-right: 5%; float: right;">	
			<a href="https://twitter.com/intent/tweet?button_hashtag=MavenTrends&text=Wow!%20I%20found%20the%20trending%20topic%20near%20my%20place." class="twitter-hashtag-button" data-size="large">Tweet #MavenTrends</a>
				<script>
					!function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
								.test(d.location) ? 'http' : 'https';
						if (!d.getElementById(id)) {
							js = d.createElement(s);
							js.id = id;
							js.src = p + '://platform.twitter.com/widgets.js';
							fjs.parentNode.insertBefore(js, fjs);
						}
					}(document, 'script', 'twitter-wjs');
				</script>
</div>