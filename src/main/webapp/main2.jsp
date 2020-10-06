<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="en">

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
   
   <!-- Load c3.css -->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">
	
   <!-- Load d3.js and c3.js -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>

</head>

<body>
	
  <h4 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-warning mb-3">Landslide statistics</span>
    <span class="site-heading-lower font-weight-bold">Landslides in Korea</span>
  </h4>


  <!-- Navigation -->
  <form method="get" action="/search.do">
  <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
    <h2 class="text-white text-bold" style="text-align:left; padding-left:60px;">Status of national landslide</h2>
     
     <div id = "search">
     <select name="province"  style="height:45px">
		  	  <option selected>시도명</option>
			  <option value="강원도">강원도</option>
			  <option value="경기도">경기도</option>
			  <option value="서울특별시">서울특별시</option>
			  <option value="경상남도">경상남도</option>
			  <option value="경상북도">경상북도</option>
			  <option value="광주광역시">광주광역시</option>
			  <option value="대구광역시">대구광역시</option>
			  <option value="대전광역시">대전광역시</option>
			  <option value="부산광역시">부산광역시</option>
			  <option value="세종특별자치시">세종특별자치시</option>
			  <option value="울산광역시">울산광역시</option>
			  <option value="인천광역시">인천광역시</option>
			  <option value="전라남도">전라남도</option>
			  <option value="전라북도">전라북도</option>
			  <option value="제주특별자치도">제주특별자치도</option>
			  <option value="충청남도">충청남도</option>
			  <option value="충청북도">충청북도</option>
			</select>
   
   <input type="text" id="searchStr" name="city" style="height:45px; width : 335px;">
   <input type="submit" value="검색"  style="height:45px;">
    </div>
  </nav> 
</form>
 
    <div class="sidenav" id="sidenav">
  	   <a href="none" class="font-weight-bold" >산사태 예보 발령 <br> 상위지역</a>
	   <c:forEach items="${ranksi}" var="rank" >
	  		<a href="none" class="font-weight-bold" style="background-color:#ffffff;">${rank.province}</a>
	   </c:forEach> 
  	</div>
  	
  	<div class="sidenav2" id="sidenav2">
  	   <a href="none" class="font-weight-bold" >산사태 예보 발령 <br> 하위지역</a>
	   <c:forEach items="${rankgu}" var="rank2">
	  		<a href="none" class="font-weight-bold" style="background-color:#ffffff;">${rank2.city}</a>
	   </c:forEach> 
  	</div>

 
<div class="row">
  <!-- test map -->
  <div id="map" class="col-9" style="height: 1200px;"></div>
  
  <!-- chart table -->
  <div id="table1" class="col-3"style="height: 1200px;">
    <table>

        <tr><th >지역별 산사태 발생 건수</th></tr>
        <tr><td>원하는 지역을 선택시 <br>해당 정보가 나타납니다.</td></tr>
        <tr><th>지역별 강수량</th></tr> 
		<tr><td>원하는 지역을 선택시 <br>해당 정보가 나타납니다.</td></tr>

    </table> 
  </div>
  <div id="table2" class="col-3"style="height: 1200px;">
    <table>

        <tr><th>지역별 산사태 발생 건수</th></tr>
        <tr><td id="chart1"></td></tr>
        <tr><th>지역별 강수량</th></tr> 
		<tr><td id="bar"></td></tr>

    </table> 
  </div>
 </div>

  
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
               zoom: 8,
               mapTypeId: 'normal',
               center: new naver.maps.LatLng(36.4203004, 128.317960)
         });
         
         naver.maps.Event.once(map, 'init_stylemap', function () {
            flag = false;
            var table2 = $("#table2"); 
            table2.hide();
            var sidenav2 = $("#sidenav2"); 
            sidenav2.hide();
            
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
      
         map.data.addListener('click', function(e) {
            
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
            
            if(regionName == "강원도")
            	startGraph2(regionName);
            
            function startGraph2(province) {
            	
            	$.ajax({		 	 
          		  url : "/landslidechart2.do",
          		  method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
          		  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
          		  // TODO:
          		  data : "ppp=" + province,  // binding 하기 위해서 data 텍스트로 던지기 
          		  
          		  dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
          		  success : function(jsonObjList){ 
          				console.log(jsonObjList);

          			  	var voArr=[];
          			  	$.map(jsonObjList, function(vv,i){
          			  		voArr.push(vv.cnt_2019_06);
          			  		voArr.push(vv.cnt_2019_07);
          			  		voArr.push(vv.cnt_2019_08)
          			  		voArr.push(vv.cnt_2020_06)
          			  		voArr.push(vv.cnt_2020_07);
          			  		voArr.push(vv.cnt_2020_08);
          			  	});
          			  	console.log(voArr);
          			  	printXylineChart2(voArr);
          			  
            		}
            	});
            }
            
            function printXylineChart2(voArr){
        		var newlist=[];
        		newlist.push(voArr[3]);
        		newlist.push(voArr[4]);
        		newlist.push(voArr[5]);
        		
        		var chart = c3.generate({
        			bindto: "#chart1",
        			 /* size: {
        	             height: 400,
        	             width: 400
        	         }, */
        		    data: {
        		        json:{
        		        	date:[6,7,8], 
        		        	2019: voArr,
        		        	2020: newlist
        		        },
        		        x : 'date',
        		        type:'line',
        		        types:{
        		        	data1:'line',
        		        },
        		    },
        			grid: { x: {show: false}, y: { show: true}},
        			size: {height: 400, width: 400},
        		});
        	}
            
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
            map.data.addListener('dblclick', function(e) {
               
            	var feature = e.feature,
                     regionName = feature.getProperty('SIG_KOR_NM');
            	 if(regionName != "강원도")
                 	startGraph(regionName);
            });
            
            $(document).ready(function(){
                flag = false;
                var table1 = $("#table1"); 
                var table2 = $("#table2"); 
                var sidenav2 = $("#sidenav2"); 
                var sidenav = $("#sidenav");
                
                if(flag == false){
                     table2.show();
                     sidenav2.show();
                     table1.hide();
                     sidenav.hide();
                     flag = true;
                  } else {
                     table2.hide();
                     sidenav2.hide();
                     table1.show();
                     sidenav.show();
                     flag = false;
                  }
             });
            
            function startGraph(city) {
            	console.log(city);
            	var province = "강원도";    
            	 var city2 = city.substr(0,2); 
            	   $.ajax({           
            	        url : "/landslidechart1.do",
            	        method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
            	        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
            	        // TODO:
            	        data : "kkk=" + province + "&ccc=" + city2,  // binding 하기 위해서 data 텍스트로 던지기 
            	        
            	        dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
            	        success : function(jsonObjList){ 
            	            console.log(jsonObjList);

            	              var voArr=[];
            	              $.map(jsonObjList, function(vv,i){
            	                 voArr.push(vv.rain_2019_06);
            	                 voArr.push(vv.rain_2019_07);
            	                 voArr.push(vv.rain_2019_08);
            	                 voArr.push(vv.rain_2020_06);
            	                 voArr.push(vv.rain_2020_07);
            	                 voArr.push(vv.rain_2020_08);
            	              });
            	              console.log(voArr.length);
            	              printBarChart(voArr);
            	              
            	        }
            	   });      
            }
            	   
             function printBarChart(voArr){
            		  var newlist1=[];
            		  newlist1.push(voArr[0]);
            		  newlist1.push(voArr[1]);
            		  newlist1.push(voArr[2]);
            		  
            	      var newlist2=[];
            	      newlist2.push(voArr[3]);
            	      newlist2.push(voArr[4]);
            	      newlist2.push(voArr[5]);
            	      
            	      var chart = c3.generate({
            	         bindto: "#bar",
            	         size: {
            	             height: 400,
            	             width: 400
            	         },
            	          data: {
            	        	  columns: [
            	                  ['2019', newlist1[0],newlist1[1],newlist1[2]],
            	                  ['2020', newlist2[0],newlist2[1],newlist2[2]]
            	              ],
            	              type:'bar',
            	              colors: {
            	                  2019: '#E98074',
            	                  2020: '#E85A4F'
            	              }
            	          },
            	          axis: {
            	      	    x: {
            	      	        type: 'category',
            	      	        categories: ['6월', '7월','8월']
            	      	    }
            	      	  },
            	          bar: {
            	              width: {
            	                  ratio: 0.5 // this makes bar width 50% of length between ticks
            	              }
            	              // or
            	              //width: 100 // this makes bar width 100px
            	          }
            	      });
            }
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
                        '   <p>'+"검색창을 이용하여 <br>더욱 자세한 정보를 알아보세요."+'<br />',
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

  


 <!-- <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; Cho / Shin / Hyun</p>
    </div>
  </footer> -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
