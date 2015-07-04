<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cdata</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/reset.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/grid_12.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/tabs.css">
<script src="../js/jquery-1.7.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/cufon-yui.js"></script>
<script src="../js/Vegur-L_300.font.js"></script>
<script src="../js/Vegur-M_500.font.js"></script>
<script src="../js/Vegur-R_400.font.js"></script>
<script src="../js/cufon-replace.js"></script>
<script src="../js/FF-cash.js"></script>
<script src="../js/highcharts.js"></script>
<script src="../js/highcharts-3d.js"></script>

<script src="../js/exporting.js"></script>

<%
	if (request.getParameter("value").equals("1")) {
		@SuppressWarnings("unchecked")
		List<Integer> thisMonthNumsList = (List<Integer>)request.getAttribute("thisMonthNumsList");
		@SuppressWarnings("unchecked")
		List<Integer> lastMonthNumsList = (List<Integer>)request.getAttribute("lastMonthNumsList");
%>
<script type="text/javascript">
	$(function() {
		$('#container1').highcharts(
				{
					chart : {
						type : 'spline'
					},
					title : {
						text : 'Daily People Number'
					},
					subtitle : {
						text : 'This month and Last month'
					},
					xAxis : {
						categories : [ '1', '2', '3', '4', '5', '6', '7', '8',
								'9', '10', '11', '12', '13', '14', '15', '16',
								'17', '18', '19', '20', '21', '22', '23', '24',
								'25', '26', '27', '28', '29', '30', '31' ]
					},
					yAxis : {
						title : {
							text : 'Number'
						},
						labels : {
							formatter : function() {
								return this.value
							}
						}
					},
					tooltip : {
						crosshairs : true,
						shared : true
					},
					plotOptions : {
						spline : {
							marker : {
								radius : 4,
								lineColor : '#666666',
								lineWidth : 1
							}
						}
					},
					series : [ {
						name : 'This Month',
						marker : {
							symbol : 'square'
						},
						data :
<%=thisMonthNumsList%>
	}, {
						name : 'Last Month',
						marker : {
							symbol : 'diamond'
						},
						data :
<%=lastMonthNumsList%>
	} ]
				});
	});
</script>
<%
	} else if (request.getParameter("value").equals("2")) {
		@SuppressWarnings("unchecked")
		List<Integer> monthNumsList = (List<Integer>)request.getAttribute("monthNumsList");
		int year = (int)request.getAttribute("lastYear");
%>
<script type="text/javascript">
	$(function() {
		$('#container2')
				.highcharts(
						{
							chart : {
								renderTo : 'container',
								type : 'column',
								margin : 75,
								options3d : {
									enabled : true,
									alpha : 15,
									beta : 15,
									depth : 50,
									viewDistance : 25
								}
							},
							title : {
								text : '<%=year%> Monthly People Number'
							},
							subtitle : {
								text : 'Total num'
							},
							plotOptions : {
								column : {
									depth : 25
								}
							},
							xAxis : {
								categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'May', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ]
							},
							yAxis : {
								title : {
									text : 'Total Number'
								}
							},
							series : [ {
								name : 'Monthly Number',
								data : <%=monthNumsList%>
							} ]
						});

		$('#R0').on('change', function() {
			chart.options.chart.options3d.alpha = this.value;
			showValues();
			chart.redraw(false);
		});
		$('#R1').on('change', function() {
			chart.options.chart.options3d.beta = this.value;
			showValues();
			chart.redraw(false);
		});

		function showValues() {
			$('#R0-value').html(chart.options.chart.options3d.alpha);
			$('#R1-value').html(chart.options.chart.options3d.beta);
		}
		showValues();
	});
</script>
<%
	} else if (request.getParameter("value").equals("3")) {
		@SuppressWarnings("unchecked")
		List<Integer> hall_one_NumsList = (List<Integer>)request.getAttribute("hall_one_NumsList");
		@SuppressWarnings("unchecked")
		List<Integer> hall_two_NumsList = (List<Integer>)request.getAttribute("hall_two_NumsList");
		@SuppressWarnings("unchecked")
		List<Integer> hall_three_NumsList = (List<Integer>)request.getAttribute("hall_three_NumsList");
		int year = (int)request.getAttribute("lastYear");
%>
<script type="text/javascript">
	$(function() {
		$('#container3')
				.highcharts(
						{
							chart : {
								type : 'column'
							},
							title : {
								text : '<%=year%> Hall Usage'
							},
							subtitle : {
								text : 'Month allocation'
							},
							xAxis : {
								categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'May', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ]
							},
							yAxis : {
								min : 0,
								title : {
									text : 'Total People Number'
								}
							},
							tooltip : {
								shared : true,
								useHTML : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							},
							series : [
									{
										name : 'Hall 1',
										data : <%=hall_one_NumsList%>

									},
									{
										name : 'Hall2',
										data : <%=hall_two_NumsList%>

									},
									{
										name : 'Hall 3',
										data : <%=hall_three_NumsList%>

									} ]
						});
	});
</script>
<%
	} else if (request.getParameter("value").equals("4")) {
		@SuppressWarnings("unchecked")
		List<String> movie_nameList = (List<String>)request.getAttribute("movie_nameList");
		@SuppressWarnings("unchecked")
		List<Integer> peopleList = (List<Integer>)request.getAttribute("peopleList");
		String time = (String)request.getAttribute("time");
	
%>
<script type="text/javascript">
	$(function() {
		var colors = Highcharts.getOptions().colors, categories = [ '<%=movie_nameList.get(0)%>',
				'<%=movie_nameList.get(1)%>', '<%=movie_nameList.get(2)%>', '<%=movie_nameList.get(3)%>' ],
				name = 'Top Four Hot Movies', data = [
				{
					y : 40,
					color : colors[0],
					drilldown : {
						name : 'Seat Rate',
						categories : [ '<%=movie_nameList.get(0)%> on', '<%=movie_nameList.get(0)%> off' ],
						data : [ <%=peopleList.get(0)%>, 40-<%=peopleList.get(0)%> ],
						color : colors[0]
					}
				}, {
					y : 35,
					color : colors[1],
					drilldown : {
						name : 'Seat Rate',
						categories : [ '<%=movie_nameList.get(1)%> on', '<%=movie_nameList.get(1)%> off' ],
						data : [ <%=peopleList.get(1)%>, 35-<%=peopleList.get(1)%> ],
						color : colors[1]
					}
				}, {
					y : 30,
					color : colors[2],
					drilldown : {
						name : 'Seat Rate',
						categories : [ '<%=movie_nameList.get(2)%> on', '<%=movie_nameList.get(2)%>off' ],
						data : [ <%=peopleList.get(2)%>, 30-<%=peopleList.get(2)%> ],
						color : colors[2]
					}
				}, {
					y : 25,
					color : colors[3],
					drilldown : {
						name : 'Seat Rate',
						categories : [ '<%=movie_nameList.get(3)%> on', '<%=movie_nameList.get(3)%> off' ],
						data : [ <%=peopleList.get(3)%>, 25-<%=peopleList.get(3)%> ],
						color : colors[3]
					}
				} ];

		var browserData = [];
		var versionsData = [];
		for (var i = 0; i < data.length; i++) {
			browserData.push({
				name : categories[i],
				y : data[i].y,
				color : data[i].color
			});

			for (var j = 0; j < data[i].drilldown.data.length; j++) {
				var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5;
				versionsData.push({
					name : data[i].drilldown.categories[j],
					y : data[i].drilldown.data[j],
					color : Highcharts.Color(data[i].color)
							.brighten(brightness).get()
				});
			}
		}

		$('#container4').highcharts(
				{
					chart : {
						type : 'pie'
					},
					title : {
						text : '<%=time%> Top Four Hot Movies Seat Rate'
					},
					yAxis : {
						title : {
							text : 'Monthly Seat Rate'
						}
					},
					plotOptions : {
						pie : {
							shadow : false,
							center : [ '50%', '50%' ],
							showInLegend : true
						}
					},
					tooltip : {
						valueSuffix : '%'
					},
					series : [
							{
								name : 'Movies',
								data : browserData,
								size : '60%',
								dataLabels : {
									formatter : function() {
										return this.y > 5 ? this.point.name
												: null;
									},
									color : 'white',
									distance : -30
								}
							},
							{
								name : 'Seat Rate',
								data : versionsData,
								size : '80%',
								innerSize : '60%',
								dataLabels : {
									formatter : function() {
										return this.y > 1 ? '<b>'
												+ this.point.name + ':</b> '
												+ this.y + '%' : null;
									}
								}
							} ],
					legend : {
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'top',
						y : 30,
						floating : true,
					}
				});
	});
</script>
<%
	} else if (request.getParameter("value").equals("5")) {
		@SuppressWarnings("unchecked")
		List<Float> cardNumsList = (List<Float>)request.getAttribute("cardNumsList");
		@SuppressWarnings("unchecked")
		List<Float> cashNumsList = (List<Float>)request.getAttribute("cashNumsList");
		@SuppressWarnings("unchecked")
		List<Float> averageList = (List<Float>)request.getAttribute("averageList");
		int year = (int)request.getAttribute("lastYear");
		int cardTotal = 0;
		int cashTotal = 0;
		for(int i=0; i<12; i++) {
			cardTotal += cardNumsList.get(i);
			cashTotal += cashNumsList.get(i);
		}
%>
<script type="text/javascript">
	$(function() {
		$('#container5')
				.highcharts(
						{
							chart : {},
							title : {
								text : '<%=year%> Monthly Card or Cash Usage'
							},
							xAxis : {
								categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'May', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ]
							},
							tooltip : {
								formatter : function() {
									var s;
									if (this.point.name) { // the pie chart                   
										s = '' + this.point.name + ': '
												+ this.y + ' People';
									} else {
										s = '' + this.x + ': ' + this.y;
									}
									return s;
								}
							},
							labels : {
								items : [ {
									html : 'Monthly Card or Cash',
									style : {
										left : '320px',
										top : '0',
										color : 'black'
									}
								} ]
							},
							series : [
									{
										type : 'column',
										name : 'Card',
										data : <%=cardNumsList%>
									},
									{
										type : 'column',
										name : 'Cash',
										data : <%=cashNumsList%>
									},
									{
										type : 'spline',
										name : 'Average',
										data : <%=averageList%>,
										marker : {
											lineWidth : 2,
											lineColor : Highcharts.getOptions().colors[3],
											fillColor : 'white'
										}
									},
									{
										type : 'pie',
										name : 'Total Card or Cash',
										data : [
												{
													name : 'Card',
													y : <%=cardTotal%>,
													color : Highcharts
															.getOptions().colors[0]
												},
												{
													name : 'Cash',
													y : <%=cashTotal%>,
													color : Highcharts
															.getOptions().colors[1]
												} ],
										center : [ 370, 50 ],
										size : 100,
										showInLegend : false,
										dataLabels : {
											enabled : false
										}
									} ]
						});
	});
</script>
<%
	} else if (request.getParameter("value").equals("0")) {
%>
<script type="text/javascript">
	$(function() {
		$('#container').highcharts({                                                   
	        chart: {                                                                   
	            type: 'scatter',                                                       
	            margin: [70, 50, 60, 80],                                              
	            events: {                                                              
	                click: function(e) {                                                                 
	                    var x = e.xAxis[0].value,                                      
	                        y = e.yAxis[0].value,                                      
	                        series = this.series[0];                                   
	                                                                                                                                       
	                    series.addPoint([x, y]);                                       
	                                                                                   
	                }                                                                  
	            }                                                                      
	        },                                                                         
	        title: {                                                                   
	            text: 'Analysis Help'                                             
	        },                                                                         
	        subtitle: {                                                                
	            text: 'Help to analyze Cineplex.'
	        },                                                                         
	        xAxis: {                                                                   
	            minPadding: 0.2,                                                       
	            maxPadding: 0.2,                                                       
	            maxZoom: 60                                                            
	        },                                                                         
	        yAxis: {                                                                   
	            title: {                                                               
	                text: 'Value'                                                      
	            },                                                                     
	            minPadding: 0.2,                                                       
	            maxPadding: 0.2,                                                       
	            maxZoom: 60,                                                           
	            plotLines: [{                                                          
	                value: 0,                                                          
	                width: 1,                                                          
	                color: '#808080'                                                   
	            }]                                                                     
	        },                                                                         
	        legend: {                                                                  
	            enabled: false                                                         
	        },                                                                         
	        exporting: {                                                               
	            enabled: false                                                         
	        },                                                                         
	        plotOptions: {                                                             
	            series: {                                                              
	                lineWidth: 1,                                                      
	                point: {                                                           
	                    events: {                                                      
	                        'click': function() {                                      
	                            if (this.series.data.length > 1) this.remove();        
	                        }                                                          
	                    }                                                              
	                }                                                                  
	            }                                                                      
	        },                                                                         
	        series: [{                                                                 
	            data: [[0, 0]]                                             
	        }]                                                                         
	    }); 
	});
</script>
<%
	}
%>

</head>
<body>
	<MyTag:checkSession test="${sessionScope.account_id == null}">
		<%
			response.sendRedirect("login.jsp");
		%>
	</MyTag:checkSession>
	<!--==============================header=================================-->

	<MyTag:checkSession test="${sessionScope.account_id != null}">
		<header>
			<div class="main">
				<%@include file="header.jsp"%>
				<nav>
					<ul class="right">
						<li><a href="logoutPro">Log out</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index_m.jsp">Home</a></li>
						<li><a href="memberAgeStaticsPro?value=1">Mdata</a></li>
						<li class="current"><a
							href="cineplexDayNumStaticsPro?value=1">Cdata</a></li>
						<li><a href="allPlansPro">Plan</a></li>
						<li><a href="allOfflineMoviesPro">Offline</a></li>
						<li><a href="about_m.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner cdata-banner">
					<p>
						<strong class="font-1">Click</strong><strong class="font-2">Cdata</strong><strong
							class="font-1">to manage</strong><strong class="font-2">cineplex!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">

				<div class="tabs">
					<%
						if (request.getParameter("value").equals("1")) {
					%>
					<ul class="nav">
						<li class="selected"><a
							href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container1"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("2")) {
					%>
					<ul class="nav">
						<li><a href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li class="selected"><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container2"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("3")) {
					%>
					<ul class="nav">
						<li><a href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li class="selected"><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container3"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("4")) {
					%>
					<ul class="nav">
						<li><a href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li class="selected"><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container4"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("5")) {
					%>
					<ul class="nav">
						<li><a href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li class="selected"><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container5"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("0")) {
					%>
					<ul class="nav">
						<li><a href="cineplexDayNumStaticsPro?value=1">Daily</a></li>
						<li><a href="cineplexMonthNumStaticsPro?value=2">Monthly</a></li>
						<li><a href="cineplexHallStaticsPro?value=3">Hall</a></li>
						<li><a href="cineplexSeatRateStaticsPro?value=4">SeatRate</a></li>
						<li><a href="cineplexCardCashStaticsPro?value=5">Card/Cash</a></li>
						<li class="selected"><a href="cdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container"></div>
					</div>
					<%
						}
					%>

				</div>

			</div>
		</section>
		<!--==============================footer=================================-->
		<%@include file="footer.jsp"%>
	</MyTag:checkSession>
</body>
</html>