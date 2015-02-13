<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="Header.jsp"></jsp:include>

<!-- <p>  example</p>
<img src="https://farm3.staticflickr.com/2634/4046568058_0d7cffe35d.jpg"></img>
<a href="">upload here</a>
 <form method="POST" action="https://up.flickr.com/services/upload/" enctype="multipart/form-data" >
            File:
            <input type="file" name="photo" id="file" /> <br/>
            Destination:
            <input type="text" value="d237da9ec0636440997bacda66e0ef9f" name="api_key"/>
            <input type="text" value="72157650721793296-acbcdaaaa0ef0ff5" name="auth_token"/>
            <input type="text" value="95b3170154735d1eccbf9fa15662a6a1" name="api_sig"/>
            </br>
            <input type="submit"  id="upload" />
        </form>
        
        <h3>File Upload:</h3>
Select a file to upload: <br />
<form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>

<div style="width:500px;height:500px;text-align:center;margin:auto;" ><object width="500" height="500" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"> <param name="flashvars" value="offsite=true&amp;lang=en-us&amp;page_show_url=%2Fphotos%2Fshow&amp;page_show_back_url=%2Fphotos%2F&amp;tags=ottawa" /> <param name="allowFullScreen" value="true" /> <param name="src" value="https://www.flickr.com/apps/slideshow/show.swf?v=71649" /> <embed width="500" height="500" type="application/x-shockwave-flash" src="https://www.flickr.com/apps/slideshow/show.swf?v=71649" flashvars="offsite=true&amp;lang=en-us&amp;page_show_url=%2Fphotos%2Fshow&amp;tags=ottawa" allowFullScreen="true" /> </object><br /><small>Created with <a href="http://www.flickrslideshow.com">flickr slideshow</a>.</small></div>

<a href="">show related pics</a>
<a href="">get friends</a> -->

<div class="page-header">
   	<h1>Flickr Photos on: ${keyword}</h1>
</div>

<c:forEach var="photos" items="${photos}">
	<p style="font-size:medium; color:red">
	<img src="	${photos}"></img></br>
	</p>
</c:forEach>

<jsp:include page="Footer.jsp"></jsp:include>