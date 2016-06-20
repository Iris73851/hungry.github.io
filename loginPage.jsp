<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>



<div align="center">
<div style="
background-image:url('indexImg.png');
padding:5px;width:677px;height:686px;
border:0px;background-repeat:no-repeat;">

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="loginServlet" method="post" name="form1">
Username:
<input name="id" type="text" id="id"> 
<br><br>
Password:
<input name="password" type="password" id="password">
<br>
<br>
<input name="submit" type="submit">  <input type="button" value="Sign Up" onclick="window.location.href ='register.jsp'"/></form>

</div>
</div>
</body>
</html>