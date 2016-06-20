<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
 <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBUhHtJqjzKdYW3IJppOf6g31VJeqD0nnU">
    </script>
    <script type="text/javascript" src="markerclusterer.js"></script>
<script type="text/javascript" src="addMap.js"></script>
<style type = "text/css">
body  { font-family: sans-serif;
	    background-color: lightyellow; } 

</style>
</head>
<body>
<div id="map-canvas"></div>
<form method="post" action="AddServlet" enctype="multipart/form-data">

<h1>新增食記:</h1><br>
<p>標題: <input type="text" name="Title" size="60"></p>
<p>店家名稱: <input type="text" name="Name"></p>
<p>地址: <input id="autocomplete" placeholder="Enter a loction" type="text" name="Address" />
<input type="hidden" id="lat" name="lat" value="2"/>
<input type="hidden" id="lng" name="lng" value="2"/>
<p>評價: <select name="Level">
			  <option value="1">✮</option>
			  <option value="2">✮✮</option>
			  <option value="3">✮✮✮</option>
			    <option value="4">✮✮✮✮</option>
			  <option value="5">✮✮✮✮✮</option></select>
</p>
<p>照片: <input type="file" name="Photo" size="30"/></p>
<p>評語:</p>
 <TextArea Cols="50" Rows="8" Name="Comment" Wrap="Off"></TextArea>
 <br>
 <br>

<input type="submit" value="新增">
</form>
</body>