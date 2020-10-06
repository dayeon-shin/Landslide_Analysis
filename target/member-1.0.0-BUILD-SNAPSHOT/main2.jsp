<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Business Casual - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/business-casual.min.css" rel="stylesheet">
  
  <!-- test -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qynkm17bhw"></script>

</head>

<body>
	
  <h4 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-primary mb-3">Landslide statistics</span>
    <span class="site-heading-lower">Landslides in Korea</span>
  </h4>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
    <div class="container">
      <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="#">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item px-lg-4">
          	<p class="text-white text-bold">Status of national landslides</p>
            <!-- <a class="nav-link text-uppercase text-expanded" href="index.html">ì êµ­ ì°ì¬í íí©
            </a> -->
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- <section class="page-section about-heading">
    <div class="container">
      <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="img/about.jpg" alt="">
      <div class="about-heading-content">
        <div class="row">
          <div class="col-xl-9 col-lg-10 mx-auto">
            <div class="bg-faded rounded p-5">
              <h2 class="section-heading mb-4">
                <span class="section-heading-upper">Strong Coffee, Strong Roots</span>
                <span class="section-heading-lower">About Our Cafe</span>
              </h2>
              <p>Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farmers in various regions of South and Central America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.</p>
              <p class="mb-0">We guarantee that you will fall in <em>lust</em> with our decadent blends the moment you walk inside until you finish your last sip. Join us for your daily routine, an outing with friends, or simply just to enjoy some alone time.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->
  
  <!-- ranking -->
  <div class="sidenav">
  		<table cellspacing="6", border="1">
  				<tr>
  					<td>title</td>
  				</tr>
  		</table>
	  <!-- <span">ranking</a>
	  <a href="#services">ì§ì­1</a>
	  <a href="#clients">ì§ì­2</a>
	  <a href="#contact">ì§ì­3</a> -->
  </div>
  
  <!-- test map -->
  <div id="map" style="width: 100%; height: 800px;"></div>

   <script>
   		
		   var HOME_PATH = "https://navermaps.github.io/maps.js.ncp/docs",
		   urlPrefix = HOME_PATH +'/data/region',
		   urlSuffix = '.json',
		   regionGeoJson = [],
		   loadCount = 0;
		

			var html = '';
	        html += '<div id="btn">';
	        html += '<input type="button" value="Main Map" onclick="window.location.reload()"/>';
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
			   
			   location.href = "/detail.do?region="+regionName+"&lat="+e.coord.lat()+"&lng="+e.coord.lng();
	
			   
			   /* map.data.addListener('mouseover', function(e) {
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
			   */

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

<!--   <div class="fixed-right">
  	<div id="flotting_layer">
  		<table cellspacing="6", border="1">
  			<tbody>
  				<tr>
  					<td>title</td>
  				</tr>
  			</tbody>
  		</table>
  	</div>
  </div> -->

  <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; Cho / Shin / Hyun</p>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>