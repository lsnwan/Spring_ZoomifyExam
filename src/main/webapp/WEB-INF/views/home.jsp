<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="/resources/js/ZoomifyImageViewerFree-min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1>
			Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P>
		<P>  Zoomify Example Page </P>
		<div class="row">
			<div class="col-sm">
				<div id="myContainer" style="width:100%; height:500px; margin:auto; border:1px; border-style:solid; border-color:#696969; background-color:#000000;" ></div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<c:forEach var="zoomify" items="${zoomifys }">
					<img src="/resources/zoomify/original/${zoomify.fileName }" class="img-thumbnail" onclick="fnImageChange('${zoomify.zoomifyImage}')" style="width: 120px; height: 80px;">
				</c:forEach>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var zoomifyName = "${zoomifyName}";
			if(zoomifyName != "") {
				Z.showImage("myContainer", "/resources/zoomify/conversion/"+zoomifyName);				
			} else {
				Z.showImage("myContainer", "/resources/zoomify/conversion/345166");				
			}
			
		});
		
		function fnImageChange(zoomifyImage) {
			var form = document.createElement( "form");
			form.method = "get";
			form.action = "/";
			
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "zoomifyName";
			input.value = zoomifyImage;
			
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
	</script>	
</body>
</html>
