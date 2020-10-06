<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>동 검색 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qynkm17bhw"></script>

</head>
<body>
  
   <div id="map" style="width: 100%; height: 800px;"></div>

   <script>
   		
		   var HOME_PATH = "https://navermaps.github.io/maps.js.ncp/docs",
		   urlPrefix = HOME_PATH +'/data/region',
		   urlSuffix = '.json',
		   regionGeoJson = [],
		   loadCount = 0;
		

			var html = '';
	        html += '<div id="btn">';
	        html += '<input type="button" value="메인Map" onclick="window.location.reload()"/>';
	        html += '</div>';
	        
			var map = new naver.maps.Map(document.getElementById('map'), {
			   	zoom: 7,
			   	mapTypeId: 'normal',
			   	center: new naver.maps.LatLng(36.4203004, 128.317960)
			});
			
			naver.maps.Event.once(map, 'init_stylemap', function () {
				var btn = new naver.maps.CustomControl(html, {
		        	position: naver.maps.Position.TOP_LEFT
		        });
		        
		        btn.setMap(map);
		        
			   for (var i = 1; i < 18; i++) {
			       var keyword = i +'';
			
			       if (keyword.length === 1) {
			           keyword = '0'+ keyword;
			       }
			
			       $.ajax({
			           url: urlPrefix + keyword + urlSuffix,
			           success: function(idx) {
			        	   console.log(idx);
			               return function(geojson) {
			            	   console.log(geojson);
			                   regionGeoJson[idx] = geojson;
			
			                   loadCount++;
			
			                   if (loadCount === 17) {
			                       startDataLayer();
			                   }
			               }
			           }(i - 1)
			       });
			   }
			}); 
			
		var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');
		
		tooltip.appendTo(map.getPanes().floatPane);
   	
		
		
		function startDataLayer() {
		   map.data.setStyle(function(feature) {
		       var styleOptions = {
		           fillColor: '#ff0000',
		           fillOpacity: 0.0001,
		           strokeColor: '#ff0000',
		           strokeWeight: 2,
		           strokeOpacity: 0.4
		       };
		
		       if (feature.getProperty('focus')) {
		           styleOptions.fillOpacity = 0.6;
		           styleOptions.fillColor = '#0f0';
		           styleOptions.strokeColor = '#0f0';
		           styleOptions.strokeWeight = 4;
		           styleOptions.strokeOpacity = 1;
		       }
		
		       return styleOptions;
		   });
		
		   regionGeoJson.forEach(function(geojson) {
			   console.log("geojson"+geojson);
		       map.data.addGeoJson(geojson);
		   });
		
		   var listener = map.data.addListener('click', function(e) {
			   
			   
			   var feature = e.feature,
	           regionName = feature.getProperty('area1');
			   
			   if (feature.getProperty('focus') !== true) {
 		           feature.setProperty('focus', true);
 		       } else {
 		           feature.setProperty('focus', false);
 		       }
			   
			   $.ajax({
	       	         url :  "/"+regionName+".json", 
	       	         success : function(idx) {	
	       	               		regionGeoJson[0] = idx;
								startDataLayer();
	       	               
		       	    	 //지도 센터 재지정 
		       	         map.setOptions({ zoom: 9 });
		       	    	 map.setCenter(new naver.maps.LatLng(e.coord.lat() ,  e.coord.lng())) ;

	       	         } 
	       	      });
			   
			   map.data.addListener('mouseover', function(e) {
				   var feature = e.feature,
			           regionName = feature.getProperty('SIG_KOR_NM');
				   
				   tooltip.css({
 			           display: '',
 			           left: e.offset.x,
 			           top: e.offset.y
 			       }).text(regionName);
 			
 			       map.data.overrideStyle(feature, {
 			           fillOpacity: 0.6,
 			           strokeWeight: 4,
 			           strokeOpacity: 1
 			       });   
				 
			   });
			   
			   map.data.addListener('rightclick', function(e) {
				   
				   tooltip.hide().empty();
			       map.data.revertStyle();
			       
				   var latlng = e.coord;
 			       var feature = e.feature,
 			           regionName = feature.getProperty('SIG_KOR_NM');
 						console.log(regionName);
 				   var contentString = [
 					        '<div class="iw_inner">',
 					        '   <h3>'+regionName+'</h3>',
 					        '   <p>'+"여기에 데이터 추가"+'<br />',
 					        '   </p>',
 					        '</div>'
 					].join('');

 					var infowindow = new naver.maps.InfoWindow({
 					    content: contentString
 					});			
 					
 					infowindow.open(map, latlng);
 			      
			   });
			   

		   });
		   
		   map.data.addListener('mouseover', function(e) {
		       var feature = e.feature,
		           regionName = feature.getProperty('area1');
		
		       tooltip.css({
		           display: '',
		           left: e.offset.x,
		           top: e.offset.y
		       }).text(regionName);
		
		       map.data.overrideStyle(feature, {
		           fillOpacity: 0.6,
		           strokeWeight: 4,
		           strokeOpacity: 1
		       });
		   });
		
		   map.data.addListener('mouseout', function(e) {
		       tooltip.hide().empty();
		       map.data.revertStyle();
		       
		   });
		}
		
   </script>
</body>
</html>