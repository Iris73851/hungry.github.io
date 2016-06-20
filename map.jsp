<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sun.image.codec.jpeg.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <style type="text/css">
      html, body, #map-canvas { height: 100%; margin: 0; padding: 0;}
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBUhHtJqjzKdYW3IJppOf6g31VJeqD0nnU">
    </script>
    <script type="text/javascript" src="markerclusterer.js"></script>
    <script type="text/javascript">
      var autocomplete;
      var places; 
      var markerClusterer = [];   // 設定標記叢集
      var map;
      var image;
      
      function initialize() {
        var mapOptions = {
          center: { lat: 23.6423042, lng: 120.9255871},
          zoom: 8
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
        <%
        
    	String user = "root"; 
    	String pass = ""; 
    	String database = "shops"; 
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
            String sql = "select * from shop"; 
            ResultSet rs = stmt.executeQuery(sql); 
             
           	            
            //開始顯示 
            while(rs.next()){ 
               String name = rs.getString("name");
               double lat = rs.getDouble("lat"); 
               double lng = rs.getDouble("lng");
               int id = rs.getInt("id");
               %>
	           	var point = new google.maps.LatLng("<%=lat%>","<%=lng%>");
	           	
	           	//marker圖片
	           	image = {
	          		  url: "getPicture?id=<%=id%>",
	          		  //size: new google.maps.Size(71, 71),
	          		  origin: new google.maps.Point(0, 0),
	          		  anchor: new google.maps.Point(30, 0),
	          		  scaledSize: new google.maps.Size(50, 50)
	          	}
	           	
	            //地圖上標籤內容
	            var infowindow = new google.maps.InfoWindow({
	              content: "<a href='levelServlet?particle=<%=id%>'><%=name%></a>"
	            });

	           	addMarker(point, map, infowindow);
	            <%
            } 
          
        	//關閉資料表 
        	rs.close();
            
        }catch(SQLException sqle){ 
   	        out.println("SQL Exception : " + sqle); 
        } 
    	
    	 
    	%>
        
 	// 設定標記叢集的外觀
    var markerClusterDraw = new MarkerClusterer(map, markerClusterer, {
        gridSize: 80,  // 多少範圍內的標記要撿在一組 (是用 grid 的概念，落在框外的有時會自成單一地圖標記 (marker)，不會轉成 marker clusterer)
        styles: [{
            url: "fork.png", // 可以自訂圖案
            height: 50,
            width: 50,
            anchor: [-30, 30],    // 文字出現在標記上的哪個位置 (position on marker)
            textColor: '#FF3333',
            textSize: 40
        }],
        
    });
 	
       
      }
	var clusterImage = {
			url: "fork.png",
	        size: new google.maps.Size(71, 71),
	        origin: new google.maps.Point(0, 0),
	        anchor: new google.maps.Point(0, 32),
	        scaledSize: new google.maps.Size(50, 50)
	}
    
      
      var shape = {
        coords: [-50, -50, -50, 50, 50, 50, 50, -50],
        type: 'poly'
      };
	  
	 
      
            
      

     function addMarker(location, map, infowindow) {
      

        //地圖上標籤
        var marker = new google.maps.Marker({
          position: location,
          map: map,
          icon: image,
          shape: shape
        });

       
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });

        markerClusterer.push(marker);
      }

      google.maps.event.addDomListener( window, 'load', initialize);

    </script>
  </head>
  <body>
        <div id="map-canvas"></div>
  </body>
 </html>