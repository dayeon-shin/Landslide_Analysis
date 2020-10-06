<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
   
<!--    <link rel="stylesheet" type="text/css" href="theme-assets/css/core/menu/menu-types/vertical-menu.css">
   <link rel="stylesheet" type="text/css" href="theme-assets/css/core/colors/palette-gradient.css">
   <link rel="stylesheet" type="text/css" href="theme-assets/css/pages/dashboard-ecommerce.css"> -->
   <link rel="stylesheet" type="text/css" href="theme-assets/vendors/css/charts/chartist.css">

</head>

<body>
   
  <h4 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-warning mb-3">Landslide statistics</span>
    <span class="site-heading-lower font-weight-bold">Landslides in Korea</span>
  </h4>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
    <h2 class="text-white text-bold" style="text-align:center; padding-left : 60px;">Details about selected region</h2>
  </nav>

  

  <!-- 차트 다섯개 왈랄라라 -->
  <div class="row" style="padding:60px;">
    <div class="col-xl-4 col-lg-6 col-md-12">
        <div class="card text-scenter ecom-card-1 bg-white">
            <div class="card text-center card-content ecom-card2 height-180">
                <h1 class="text-muted danger position-absolute p-1" style="font-color:#7E685A;font-weight: bold;margin:25%;">Statistics about <br>${addchart.province}${addchart.city}</h1>
				<!-- <ul style="padding-top:15%;font-family:Raleway;font-size:24px;">
					<li>2019 Landslide forecast</li>
					<li>2020 Landslide forecast</li>
					<li>Average Min Temp</li>
					<li>Average Max Temp</li>
					<li>Average Rainfall</li>
				</ul> -->
                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3  ">
                    <div id="progress-stats-bar-chart"></div>
                    <div id="progress-stats-line-chart" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-6 col-md-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h4 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold;margin-left:25%; ">2019 Landslide forecast</h4>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart1">
                    	<div id="donutchart1" style="margin-top : 30px;width: 80%;padding-left:8%;">
                    
                    	</div>
                    </div>
                    
                     <script type="text/javascript">
                     var province = "${addchart.province}";
               		 var city = "${addchart.city}";
               		
                 	$.ajax({		 	 
                 		  url : "/donutchart1.do",
                 		  method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
                 		  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
                 		  // TODO:
                 		  data : "ddminp=" + province + "&ddminc=" + city,  // binding 하기 위해서 data 텍스트로 던지기 
                 		  
                 		  dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
                 		  success : function(jsonObjList){ 
                 				console.log(jsonObjList);

                 			  	var voArr=[];
                 			  	$.map(jsonObjList, function(vv,i){
                   	                 voArr.push(vv.k2019);
                   	                 voArr.push(vv.j2019);
                   	              });
                 			  	console.log(voArr);
                 			  	printdonutChart1(voArr);
                   		}
                   	});
                   
                   
                   function printdonutChart1(voArr){
               		var newlist=[];
               		newlist.push(voArr[0]);
               		newlist.push(voArr[1]);
      
               		var chart = c3.generate({
               		    bindto : "#donutchart1",
               		    data: {
                 	        columns: [
                 	            ['경보', newlist[0]],
                 	            ['주의보', newlist[1]],
                 	        ],
                 	        type : 'donut',
                 	       colors: {
                 	            경보: 'rgb(180,203,51)',
                 	            주의보: 'rgb(246,199,75)',
                 	      
                 	        },
                 	    }
                 	});
                   }
					    </script>
                    
                    
                    <div id="progress-stats-line-chart1" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h4 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold ;margin-left:25%;">2020 Landslide forecast</h4>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart2">
                    	<div id="donutchart2" style="margin-top : 30px;width: 80%;padding-left:8%;">
                    
                    	</div>
                    	
                    	<script type="text/javascript">
                    	
                    	var province = "${addchart.province}";
                  		var city = "${addchart.city}";
                  		
                    	$.ajax({		 	 
                    		  url : "/donutchart2.do",
                    		  method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
                    		  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
                    		  // TODO:
                    		  data : "dminp=" + province + "&dminc=" + city,  // binding 하기 위해서 data 텍스트로 던지기 
                    		  
                    		  dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
                    		  success : function(jsonObjList){ 
                    				console.log(jsonObjList);

                    			  	var voArr=[];
                    			  	$.map(jsonObjList, function(vv,i){
                      	                 voArr.push(vv.k2020);
                      	                 voArr.push(vv.j2020);
                      	              });
                    			  	console.log(voArr);
                    			  	printdonutChart2(voArr);
                      		}
                      	});
                      
                      
                      function printdonutChart2(voArr){
                  		var newlist=[];
                  		newlist.push(voArr[0]);
                  		newlist.push(voArr[1]);
         
                  		var chart = c3.generate({
                  		    bindto : "#donutchart2",
                  		    data: {
                    	        columns: [
                    	            ['경보', newlist[0]],
                    	            ['주의보', newlist[1]],
                    	        ],
                    	        type : 'donut',
                    	        colors: {
                     	            경보: 'rgb(246,199,75)',
                     	            주의보: 'rgb(227,125,78)',
                     	      
                     	        },
                    	    }
                    	});
                      }
					    </script>
                    
                   	</div>
                    <div id="progress-stats-line-chart2" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row" style="padding:60px;">
    <div class="col-xl-4 col-lg-6 col-md-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h4 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold;margin-left:34%; ">Average Min Temp</h4>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3  ">
                    <div id="progress-stats-bar-chart">
                    	<div id="linechart1" style="margin-top : 30px;width: 80%;padding-left:8%;">
                    	
                    	</div>
                    	
                    	<script type="text/javascript">
                    	var province = "${addchart.province}";
                  		var city = "${addchart.city}";
                  		
                    	$.ajax({		 	 
                    		  url : "/avgmintemp.do",
                    		  method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
                    		  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
                    		  // TODO:
                    		  data : "aminp=" + province + "&aminc=" + city,  // binding 하기 위해서 data 텍스트로 던지기 
                    		  
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
                    			  	console.log(voArr);
                    			  	printXylineChart3(voArr);
                      		}
                      	});
                      
                      
                      function printXylineChart3(voArr){
                  		var newlist=[];
                  		newlist.push(voArr[3]);
                  		newlist.push(voArr[4]);
                  		newlist.push(voArr[5]);
                  		
                  		var chart = c3.generate({
                  			bindto: "#linechart1",
                  			
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
                  		        }
                  		    },
                  		  color: {
                  	        pattern: ['rgb(180,203,51)','rgb(227,125,78)']
                  	    },
                  			grid: { x: {show: false}, y: { show: true}},
                  			size: {height: 360, width: 480}
                  		});
                  	}
					    </script>
                    	
                    </div>
                    
                    
                    <div id="progress-stats-line-chart" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-6 col-md-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h4 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold;margin-left:34%; ">Average Max Temp</h4>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart1">
                    <div id="linechart2" style="margin-top : 30px;width: 80%;padding-left:8%;">
                    	
                    	</div>
                    </div>
                  
                   <script type="text/javascript">
               		var province = "${addchart.province}";
              		var city = "${addchart.city}";
              	
             	   $.ajax({           
           	        url : "/avgmaxtemp.do",
           	        method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
           	        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
           	       
           	        data : "province=" + province + "&city=" + city,  // binding 하기 위해서 data 텍스트로 던지기 
           	        
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
           	           printXylineChart2(voArr);
           	              
           	        }
           	   });      
           
           	   
             	  function printXylineChart2(voArr){
                		var newlist=[];
                		newlist.push(voArr[3]);
                		newlist.push(voArr[4]);
                		newlist.push(voArr[5]);
                		
                		var chart = c3.generate({
                			bindto: "#linechart2",
                			
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
                		        }
                		    },
                		    color: {
                      	        pattern: ['rgb(240,171,48)','rgb(60,87,136)']
                      	    },
                			grid: { x: {show: false}, y: { show: true}},
                			size: {height: 360, width: 480}
                		});
                	}
					    </script>
                    
                    
                    
                    <div id="progress-stats-line-chart1" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h4 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold;margin-left:38%; ">Max Rainfall</h4>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart2">
                    	<div id="barchart" style="margin-top : 30px;width: 80%;padding-left:8%;"></div>
                    </div>
                    
                    
                     <script type="text/javascript">
                     var province = "${addchart.province}";
               		 var city = "${addchart.city}";
                     $.ajax({           
             	        url : "/landslidechart1_1.do",
             	        method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
             	        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
             	        // TODO:S
             	        data : "pkkk=" + province + "&pccc=" + city,  // binding 하기 위해서 data 텍스트로 던지기 
             	        
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
             	              printBarChart2(voArr);
             	              
             	        }
             	   });      
             
             	   
              function printBarChart2(voArr){
             		  var newlist1=[];
             		  newlist1.push(voArr[0]);
             		  newlist1.push(voArr[1]);
             		  newlist1.push(voArr[2]);
             		  
             	      var newlist2=[];
             	      newlist2.push(voArr[3]);
             	      newlist2.push(voArr[4]);
             	      newlist2.push(voArr[5]);
             	      
             	     var chart = c3.generate({
                         bindto: "#barchart",
                         data: {
                             columns: [
                            	 ['2019', newlist1[0],newlist1[1],newlist1[2]],
            	                 ['2020', newlist2[0],newlist2[1],newlist2[2]]
                              ],
                              type:'bar',
                            	  colors: {
                                      2019: 'rgb(62,121,37)',
                                      2020: 'rgb(250,133,60)',
                                  },
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
					  </script>
                    
                    <div id="progress-stats-line-chart2" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
</div>


  

  
  
<!--   <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; Cho / Shin / Hyun</p>
    </div>
  </footer> -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>