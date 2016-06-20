<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Message</title>
<style type = "text/css">
body  { font-family: sans-serif;
	    background-color: lightyellow;
	     } 

</style>


</head>
<body>
        <h3><%=request.getAttribute("Title")%></h3>
        <p>店家:<%=request.getAttribute("Name")%></p>
        <p>評價:<%=request.getAttribute("Level")%></p>
        <p>地址:<%=request.getAttribute("Address")%></p>
        <div id="map-canvas"></div>
        
        <p><img src="getPicture?id=<%=request.getAttribute("id")%>" style="height: 500px; width: 500px;"></p>
        <p>評語:</p>
        <div style="background-color:white;width:400px;height:100px;border:3px #cccccc dashed;"><%=request.getAttribute("Comment")%></div>
        <br><br>
        
        <input type="button" value="+" onclick="window.location.href ='add.jsp'"></input>
        
         <%  String id = (String)request.getAttribute("id");
             System.out.print("hihi");
             System.out.print(id);
             out.print("<form method='post' action ='deleteServlet'><div>"
	                    +"<button type=submit value ="+id+" name='particle'>-</button></div></form>"); 
	                  
         %>
    <input type="button" value="Look" onclick="window.location.href ='look.jsp'"></input>
</body>
</html>