<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
	<html> 
	    <head> 
	        <title>Index</title> 
	    </head> 
	    <body> 
	        <% 
	        String userid = (String)session.getAttribute("userName");
	        String name;
	        String title;
	        String address;
	        String level="2";
	        String user = "root"; 
		    String pass = ""; 
		    String database = "shops"; 
		    String url = "jdbc:mysql://127.0.0.1/" + database + "?useUnicode=true&characterEncoding=utf-8"; 	     
		    //建立一個聯結物件 
		        Connection conn; 
		    //建立Statement物件，建立陳述式物件 
		        Statement stmt=null; 
	        try{ 
		        //定義驅動程式與資料來源之間的連結 
		            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		        //建立一個聯結物件 
		            conn = DriverManager.getConnection(url,user,pass); 
		        //建立Statement物件 
		            stmt = conn.createStatement(); 
		    }catch(SQLException sqle){ 
		        out.println("SQL Exception : " + sqle); 
		    } 
	            //建立查詢並產生rs的資料表 
	                 String sql = "select * from shop where level='" + level + "'AND userid ='" + userid+"'"; 
	                ResultSet rs = stmt.executeQuery(sql); 
	            //開始顯示 
	            String id;
	           
	            out.print("<center><h1>✮✮評價✮✮</h1><p>-------------------------------</p></center>");
	            while(rs.next()){ 
	            	title = rs.getString("title"); 
                    level = rs.getString("level"); 
                    address = rs.getString("address"); 
                    id = rs.getString("id"); 
                    level="✮✮";
                    out.print("<center><div style='width:500px;height:100px;background-color:lightblue;'>"
                    +"<a href='levelServlet?particle="+id+"' style='text-decoration:none;'>"
                    		+ "<p style='font-size:30px;font-weight:weight;'>" + title + "      " +level + "</p>" + address + "</p></a></br>"); 
                    out.print("</div></center>");
	                 
	                }                 
	
	            //關閉資料表 
	                rs.close(); 
	        %> 
	        
	        <br><br> 
	    </body> 
	</html> 