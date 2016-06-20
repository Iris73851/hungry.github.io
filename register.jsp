<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="BIG5">
<title>SignIn</title>
<script type="text/javascript">
	function check(){
		
	<%
    	String user = "root"; 
    	String pass = ""; 
    	String database = "wbse"; 
   	    String url = "jdbc:mysql://127.0.0.1:3306/" + database + "?useUnicode=true&characterEncoding=big5"; 
    	     
    	//建立一個聯結物件 
   	    Connection conn; 
     	//建立Statement物件，建立陳述式物件 
    	Statement stmt; 
     	
    	try{ 
   	        //定義驅動程式與資料來源之間的連結 
            Class.forName("org.gjt.mm.mysql.Driver").newInstance(); 
            //建立一個聯結物件 
            conn = DriverManager.getConnection(url,user,pass); 
            //建立Statement物件 
            stmt = conn.createStatement(); 
            
          	//建立查詢並產生rs的資料表 
            String sql = "select * from user"; 
            ResultSet rs = stmt.executeQuery(sql); 
                        
            //開始顯示 
            while(rs.next()){ 
               String id = rs.getString("id");
              %>
              console.log("<%=id%>");
              var name = "<%=id%>";
              
              	if(name == document.getElementById("id").value){
              		alert('your id have be set already!');
              		document.getElementById("id").value = "";
              		
              	}
              <%
             
            } 
        	//關閉資料表 
        	rs.close();
            
        }catch(SQLException sqle){ 
   	        out.println("SQL Exception : " + sqle); 
        } 
    	
    	
    	%>
	}
	function start(){
		document.getElementById("id").addEventListener("change", check, false);
	}
	window.addEventListener( "load", start, false );
	
</script>
</head>
<body>


<h1>Register</h1>
<form action="registerServlet" method="post" name="form1">
Username:
<input name="id" type="text" id="id" onchange="check"> 
<br>
Password:
<input name="password" type="password" id="password">
<br>
<br>
<input name="submit" type="submit"></form>


</body>
</html>