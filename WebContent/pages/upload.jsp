<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>test</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.6.2.min.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<%
String sessionId = request.getSession().getId();
Date date = new Date();
%>
<script type="text/javascript">
/* Convert divs to queue widgets when the DOM is ready */
$(function(){
	function plupload(){
		$("#uploader").pluploadQueue({
			// General settings
			runtimes : 'html5,gears,browserplus,silverlight,flash,html4',
			url : '<%=request.getContextPath() %>/servlet/fileUpload',
			max_file_size : '3gb',
			unique_names : false,
			chunk_size: '100mb',

			resize: {width: 320, height: 240, quality: 90},

			// Flash settings
			flash_swf_url : '<%=request.getContextPath() %>/plupload/plupload.flash.swf',

			// Silverlight settings
			silverlight_xap_url : '<%=request.getContextPath() %>/plupload/plupload.silverlight.xap',

			multipart_params: {'user': '<%=sessionId %>', 'time': '<%=date.getTime() %>'}
		});
	}
	plupload();
	$('#clear').click(function(){
		plupload();
	});
});
</script>

</head>

<body>
	<div>
		<div style="width: 750px; margin: 0px auto">
			<form id="formId" action="/servlet/fileUpload" method="post">
				<div id="uploader">
					<p>Flash, Silverlight, Gears, BrowserPlus HTML5 .</p>
				</div>
				<input type="button" value="Clear" id="clear"/>
			</form>
		</div>
	</div>
</body>

</html>