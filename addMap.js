	var autocomplete;
	var places; 
	var map;
	
	function initialize() {
		console.log("SSS");
        var mapOptions = {
          center: { lat: 23.6423042, lng: 120.9255871},
          zoom: 8
        };
        
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
        
        autocomplete = new google.maps.places.Autocomplete(
	            (document.getElementById('autocomplete')), {
	              types: ['establishment']
	            });
	    places = new google.maps.places.PlacesService(map);
	    
	   autocomplete.addListener('place_changed', onPlaceChanged);
      }
	  
      //移動到搜尋位置
      function onPlaceChanged() {
        var place = autocomplete.getPlace();
        
        if (place.geometry) {
          map.panTo(place.geometry.location);
          map.setZoom(15);
          
          document.getElementById("lat").value = place.geometry.location.lat();
          document.getElementById("lng").value = place.geometry.location.lng();
          
          addMarker(place.geometry.location,map);
       
        } else {
          document.getElementById('autocomplete').placeholder = 'Enter a location';
        }
      }
      
      function sendlocation(){
    	 
      }
      
      function addMarker(location, map) {
	    	        //地圖上標籤
	    	        var marker = new google.maps.Marker({
	    	          position: location,
	    	          map: map
	    	        });
	
	    	        //地圖上標籤內容
	    	        var infowindow = new google.maps.InfoWindow({
	    	          content: "QQQ 寫不出來"
	    	        });
					
	    	        console.log("QQQ");
	    	        marker.addListener('click', function() {
	    	          infowindow.open(map, marker);
	    	        });

    	        }
      window.addEventListener( "load", initialize, false );
   //google.maps.event.addDomListener( window, 'load', initialize);