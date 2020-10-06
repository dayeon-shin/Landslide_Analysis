<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h5 class="text-muted danger position-absolute p-1" style="font-color:#7E685A;font-weight: bold;">Statistics about <br> 지역명 </h5>

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
                <h5 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold ">2019 Landslide forecast</h5>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart1" style="margin-top:150px;">
                    	<div id="donutchart1" >
                    
                    	</div>
                    </div>
                    
                     <script type="text/javascript">
                     $.ajax({
           			  url : "/url.do",
           			  method : "post",  //"POST", "GET",  v1.9.0.이전 type
           			  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
           			  data : "startSeq=1&endSeq=50",  //***********
           			  dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
           			  success : function(resultList){ 
           				 
           				  var data = [];
           				  data.push(['Task', 'Hours per Day']);
           				//	data.push([vvo.주의보, vvo.주의보건수]);
           				//	data.push([vvo.경보, vvo.경보건수]);
           				 
           				 
           				 // $.map(resultList, function(vvo, i){ 
           					
           				 // });
           					
           				 //data example
           				/*  [
					          ['Task', 'Hours per Day'],
					          ['Work',     11],
					          ['Eat',      2],
					        ] */
					        
           				google.charts.load("current", {packages:["corechart"]});
					      google.charts.setOnLoadCallback(drawChart);
					      function drawChart() {
					        var data = google.visualization.arrayToDataTable(data);
					
					        var options = {
					          title: 'My Daily Activities',
					          pieHole: 0.4,
					          legend:{
					        		  textStyle:{
					        			  color:"#ffff00"
					        		  }
					          }
					        };
					
					        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
					        chart.draw(data, options);
					      }
           				  
           				  
           				  
           				  
           			  }
           		});
                     
                     
					      
					    </script>
                    
                    
                    <div id="progress-stats-line-chart1" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-12">
        <div class="card pull-up ecom-card-1 bg-white">
            <div class="card-content ecom-card2 height-180">
                <h5 class="text-muted warning position-absolute p-1" style="font-color:#7E685A;font-weight: bold ">2020 Landslide forecast</h5>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart2">
                    	<div id="donutchart2" >
                    
                    	</div>
                    	
                    	<script type="text/javascript">
					      google.charts.load("current", {packages:["corechart"]});
					      google.charts.setOnLoadCallback(drawChart);
					      function drawChart() {
					        var data = google.visualization.arrayToDataTable([
					          ['Task', 'Hours per Day'],
					          ['Work',     11],
					          ['Eat',      2],
					        ]);
					
					        var options = {
					          title: 'My Daily Activities',
					          pieHole: 0.4,
					          legend:{
					        		  textStyle:{
					        			  color:"#ffff00"
					        		  }
					          }
					        };
					
					        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
					        chart.draw(data, options);
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
                <h5 class="danger position-absolute p-1" style="font-color:#7E685A;font-weight: bold ">Average Rainfall</h5>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3  ">
                    <div id="progress-stats-bar-chart">
                    	<div id="linechart1">
                    	
                    	</div>
                    	
                    	<script type="text/javascript">
					      google.charts.load("current", {packages:["corechart"]});
					      google.charts.setOnLoadCallback(drawChart);
					      function drawChart() {
					        var data = google.visualization.arrayToDataTable([
					          ['Task', 'Hours per Day'],
					          ['Work',     11],
					          ['Work',     11],
					          ['Eat',      2],
					          ['Work',     11],
					          ['Eat',      2],
					          ['Eat',      2],
					        ]);
					
					        var options = {
					          title: 'My Daily Activities',
					          pieHole: 0.4,
					          legend:{
					        		  textStyle:{
					        			  color:"#ffff00"
					        		  }
					          }
					        };
					
					        var chart = new google.visualization.LineChart(document.getElementById('linechart1'));
					        chart.draw(data, options);
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
                <h5 class="text-muted info position-absolute p-1" style="font-color:#7E685A;font-weight: bold ">Average Minimum temp</h5>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart1">
                    <div id="linechart2">
                    	
                    	</div>
                    </div>
                  
                   <script type="text/javascript">
					      google.charts.load("current", {packages:["corechart"]});
					      google.charts.setOnLoadCallback(drawChart);
					      function drawChart() {
					        var data = google.visualization.arrayToDataTable([
					          ['Task', 'Hours per Day'],
					          ['Work',     11],
					          ['Work',     11],
					          ['Eat',      2],
					          ['Work',     11],
					          ['Eat',      2],
					          ['Eat',      2],
					        ]);
					
					        var options = {
					          title: 'My Daily Activities',
					          pieHole: 0.4,
					          legend:{
					        		  textStyle:{
					        			  color:"#ffff00"
					        		  }
					          }
					        };
					
					        var chart = new google.visualization.LineChart(document.getElementById('linechart2'));
					        chart.draw(data, options);
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
                <h5 class="text-muted warning position-absolute p-1" style="font-color:#7E685A;font-weight: bold ">Average Max temp</h5>

                <div class="progress-stats-container ct-golden-section height-75 position-relative pt-3">
                    <div id="progress-stats-bar-chart2">
                    	<div id="barchart"></div>
                    </div>
                    
                    
                     <script type="text/javascript">
					    google.charts.load("current", {packages:['corechart']});
					    google.charts.setOnLoadCallback(drawChart);
					    function drawChart() {
					      var data = google.visualization.arrayToDataTable([
					        ["Element", "Density", { role: "style" } ],
					        ["Copper", 8.94, "#b87333"],
					        ["Silver", 10.49, "silver"],
					        ["Gold", 19.30, "gold"],
					        ["Platinum", 21.45, "color: #e5e4e2"]
					      ]);
					
					      var view = new google.visualization.DataView(data);
					      view.setColumns([0, 1,
					                       { calc: "stringify",
					                         sourceColumn: 1,
					                         type: "string",
					                         role: "annotation" },
					                       2]);
					
					      var options = {
					        title: "Density of Precious Metals, in g/cm^3",
					        width: 600,
					        height: 400,
					        bar: {groupWidth: "95%"},
					        legend: { position: "none" },
					      };
					      var chart = new google.visualization.ColumnChart(document.getElementById("barchart"));
					      chart.draw(view, options);
					  }
					  </script>
                    
                    <div id="progress-stats-line-chart2" class="progress-stats-shadow"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--   <div class="row">
  	<div id="detailtitle"></div>
  	
  	<div id="tabledoughnut" class="chart1" style="height: 600px;">
		<table width="50%" border=1>
			<tr>
				<td id="bar"></td>
			</tr>
		</table>
  	</div>
  	
  	<div id="tabledoughnut2" class="chart2" style="height: 600px;">
		<table width="50%" border=1>
			<tr>
				<td id="bar"></td>
			</tr>
		</table>  	
  	</div>
  </div>
  
  <div class="row">
  	<div id="chartline1" class="chart3" style="height: 600px;"></div>
  	<div id="chartline2" class="chart4" style="height: 600px;"></div>
  	<div id="chartbar" class="chart3" style="height: 600px;"></div>
  </div>  -->
  

  
  
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