<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Mdata</title>
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
		Integer[] ageList = (Integer[]) request.getAttribute("ageList");
%>
<script type="text/javascript">
	$(function() {
		$('#container1').highcharts(
				{
					chart : {
						renderTo : 'container',
						type : 'column',
						margin : 75,
						options3d : {
							enabled : true,
							alpha : 15,
							beta : 18,
							depth : 50,
							viewDistance : 25
						}
					},
					title : {
						text : 'Member Ages'
					},
					subtitle : {
						text : 'Within Different Scope'
					},
					plotOptions : {
						column : {
							depth : 25
						}
					},
					xAxis : {
						title : {
							text : 'Member Age Scope'
						},
						categories : [ '0-9', '10-19', '20-29', '30-39',
								'40-49', '50-59', '60-N' ]
					},
					yAxis : {
						title : {
							text : 'Number'
						}
					},
					series : [ {
						name : 'Member',
						data : [<%=ageList[0]%>, <%=ageList[1]%>,
                                <%=ageList[2]%>, <%=ageList[3]%>,
                                <%=ageList[4]%>, <%=ageList[5]%>,
                                <%=ageList[6]%>]
					} ],
					legend : {
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'top',
						y : 30,
						floating : true,
					}
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
	} else if (request.getParameter("value").equals("2")) {
		Integer[] ageList = (Integer[]) request.getAttribute("ageList");
%>
<script type="text/javascript">
	$(function() {
		$('#container2').highcharts({
			chart : {
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45,
					beta : 0
				}
			},
			title : {
				text : 'Member Age Percentage'
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					depth : 35,
					dataLabels : {
						enabled : true,
						format : '{point.name}'
					},
					showInLegend : true
				}
			},
			series : [ {
				type : 'pie',
				name : 'Browser share',
				data : [ [ '0-9', <%=ageList[0]%> ], [ '10-19', <%=ageList[1]%> ], {
					name : '20-29',
					y : <%=ageList[2]%>,
					sliced : true,
					selected : true
				}, [ '30-39', <%=ageList[3]%> ], [ '40-49', <%=ageList[4]%> ],
				[ '50-N', <%=ageList[5]+ageList[6]%> ] ]
			} ]
		});
	});
</script>
<%
	} else if (request.getParameter("value").equals("3")) {
		Integer[] maleList = (Integer[]) request.getAttribute("maleList");
		Integer[] femaleList = (Integer[]) request.getAttribute("femaleList");
		
		List<Integer> maleL = new ArrayList<Integer>();
		List<Integer> femaleL = new ArrayList<Integer>();
		for(int i=0; i<67; i++){
			maleL.add(maleList[i]);
			femaleL.add(femaleList[i]);
		}
%>
<script type="text/javascript">
	$(function() {
		$('#container3')
				.highcharts(
						{
							chart : {
								type : 'area'
							},
							title : {
								text : 'Gender and Birth year'
							},
							subtitle : {
								text : 'Gender allocation'
							},
							xAxis : {
								labels : {
									formatter : function() {
										return this.value; // clean, unformatted number for year
									}
								}
							},
							yAxis : {
								title : {
									text : 'Member Number'
								},
								labels : {
									formatter : function() {
										return this.value;
									}
								}
							},
							tooltip : {
								pointFormat : '{series.name} produced <b>{point.y:,.0f}</b><br>warheads in {point.x}'
							},
							plotOptions : {
								area : {
									pointStart : 1950,
									marker : {
										enabled : false,
										symbol : 'circle',
										radius : 2,
										states : {
											hover : {
												enabled : true
											}
										}
									}
								}
							},
							series : [
									{
										name : 'Female',
										data : <%=femaleL%>
									},
									{
										name : 'Male',
										data : <%=maleL%>
									}]
						});
	});
</script>
<%
	} else if (request.getParameter("value").equals("4")) {
		Integer[] maleList = (Integer[]) request.getAttribute("maleList");
		Integer[] femaleList = (Integer[]) request.getAttribute("femaleList");
%>
<script type="text/javascript">
	$(function() {
		var chart, categories = [ 'Jiangsu', 'Beijing', 'Shanghai', 'Chongqing',
				'Tianjin', 'Other' ];
		$(document).ready(
				function() {
					$('#container4').highcharts(
							{
								chart : {
									type : 'bar'
								},
								title : {
									text : 'Address and Gender'
								},
								subtitle : {
									text : 'Gender allocation'
								},
								xAxis : [ {
									categories : categories,
									reversed : false
								}, { // mirror axis on right side
									opposite : true,
									reversed : false,
									categories : categories,
									linkedTo : 0
								} ],
								yAxis : {
									title : {
										text : null
									},
									labels : {
										formatter : function() {
											return (Math.abs(this.value));
										}
									},
									min : -35,
									max : 20
								},

								plotOptions : {
									series : {
										stacking : 'normal'
									}
								},

								tooltip : {
									formatter : function() {
										return '<b>'
												+ this.series.name
												+ ', age '
												+ this.point.category
												+ '</b><br>'
												+ 'Population: '
												+ Highcharts.numberFormat(Math
														.abs(this.point.y), 0);
									}
								},

								series : [ {
									name : 'Female',
									data : [ -<%=femaleList[0]%>, -<%=femaleList[1]%>, 
									         -<%=femaleList[2]%>, -<%=femaleList[3]%>, 
									         -<%=femaleList[4]%>, -<%=femaleList[5]%> ]
								}, {
									name : 'Male',
									data : [ <%=maleList[0]%>, <%=maleList[1]%>, 
									         <%=maleList[2]%>, <%=maleList[3]%>, 
									         <%=maleList[4]%>, <%=maleList[5]%> ]
								} ]
							});
				});
	});
</script>
<%
	} else if (request.getParameter("value").equals("5")) {
		@SuppressWarnings("unchecked")
		List<Integer> monthNumsList = (List<Integer>)request.getAttribute("monthNumsList");
		int year = (int)request.getAttribute("lastYear");
%>
<script type="text/javascript">
	$(function() { //添加标识
		$('#container5')
				.highcharts(
						{
							chart : {
								type : 'spline'
							},
							title : {
								text : '<%=year%> Monthly Member Consumption'
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
								title : {
									text : 'Consumption Number'
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
								name : 'Consumption',
								marker : {
									symbol : 'square'
								},
								data : [ <%=monthNumsList.get(0)%>, <%=monthNumsList.get(1)%>, <%=monthNumsList.get(2)%>,
								         <%=monthNumsList.get(3)%>, <%=monthNumsList.get(4)%>, <%=monthNumsList.get(5)%>,  
								         <%=monthNumsList.get(6)%>, {
									y : <%=monthNumsList.get(7)%>,
									marker : {
										symbol : 'url(../images/sun.png)'
									}
								}, <%=monthNumsList.get(8)%>, <%=monthNumsList.get(9)%>, 
								<%=monthNumsList.get(10)%>, <%=monthNumsList.get(11)%> ]

							} ]
						});
	});
</script>
<%
	} else if (request.getParameter("value").equals("6")) {
		Integer[] creditList = (Integer[]) request.getAttribute("creditList");
%>
<script type="text/javascript">
	$(function() {
		$('#container6').highcharts(
				{
					chart : {
						zoomType : 'xy'
					},
					title : {
						text : 'Member Credit Number'
					},
					subtitle : {
						text : 'Credit scope allocation'
					},
					xAxis : [ {
						categories : [ '', '0-19', '20-39', '40-59', '60-79',
								'80-99', '100-119', '120-N', '' ]
					} ],
					yAxis : [ {
						labels : {
							format : '{value}',
						},
						title : {
							text : 'Member Number',
						}
					} ],
					tooltip : {
						shared : true
					},
					legend : {
						layout : 'vertical',
						align : 'right',
						x : -40,
						verticalAlign : 'top',
						floating : true,
					},
					series : [ {
						name : 'Member Number',
						color : '#4572A7',
						type : 'column',
						data : [ 0, <%=creditList[0]%>, <%=creditList[1]%>,
	                                <%=creditList[2]%>, <%=creditList[3]%>,
	                                <%=creditList[4]%>, <%=creditList[5]%>,
	                                <%=creditList[6]%>, 0 ]

					}, {
						name : 'Member Number',
						color : '#89A54E',
						type : 'spline',
						data : [ 0, <%=creditList[0]%>, <%=creditList[1]%>,
	                                <%=creditList[2]%>, <%=creditList[3]%>,
	                                <%=creditList[4]%>, <%=creditList[5]%>,
	                                <%=creditList[6]%>, 0 ]
					} ]
				});
	});
</script>
<%
	} else if (request.getParameter("value").equals("7")) {
		@SuppressWarnings("unchecked")
		List<String> cardState = (List<String>)(request.getAttribute("cardState"));
		for(int i = 0; i<cardState.size(); i++){
			cardState.set(i, "'"+cardState.get(i)+"'");
		}
		@SuppressWarnings("unchecked")
		List<Integer[]> nums = (List<Integer[]>)(request.getAttribute("nums"));
%>
<script type="text/javascript">
	$(function() {
		$('#container7').highcharts(
				{
					chart : {
						type : 'area'
					},
					title : {
						text : 'Card Condition and Register time'
					},
					subtitle : {
						text : 'Recover, Stop, Pause, Cancel'
					},
					xAxis : {
						categories : [ '-N-1999', '2000-2004', '2005-2009',
								'2010-2014', '2015-N' ],
						tickmarkPlacement : 'on',
						title : {
							enabled : false
						}
					},
					yAxis : {
						title : {
							text : 'Member Number'
						},
						labels : {
							formatter : function() {
								return this.value;
							}
						}
					},
					tooltip : {
						shared : true,
						valueSuffix : ' millions'
					},
					plotOptions : {
						area : {
							stacking : 'normal',
							lineColor : '#666666',
							lineWidth : 1,
							marker : {
								lineWidth : 1,
								lineColor : '#666666'
							}
						}
					},
					series : [ {
						name : <%=cardState.get(0)%>,
						data : [ <%=nums.get(0)[0]%>, <%=nums.get(0)[1]%>, 
						         <%=nums.get(0)[2]%>, <%=nums.get(0)[3]%>, 
						         <%=nums.get(0)[4]%> ]
					}, {
						name : <%=cardState.get(1)%>,
						data : [ <%=nums.get(1)[0]%>, <%=nums.get(1)[1]%>, 
						         <%=nums.get(1)[2]%>, <%=nums.get(1)[3]%>, 
						         <%=nums.get(1)[4]%> ]
					}, {
						name : <%=cardState.get(2)%>,
						data : [ <%=nums.get(2)[0]%>, <%=nums.get(2)[1]%>, 
						         <%=nums.get(2)[2]%>, <%=nums.get(2)[3]%>, 
						         <%=nums.get(2)[4]%> ]
					}, {
						name : <%=cardState.get(3)%>,
						data : [ <%=nums.get(3)[0]%>, <%=nums.get(3)[1]%>, 
						         <%=nums.get(3)[2]%>, <%=nums.get(3)[3]%>, 
						         <%=nums.get(3)[4]%> ]
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
	            text: 'Help to analyze Member.'
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
						<li class="current"><a href="memberAgeStaticsPro?value=1">Mdata</a></li>
						<li><a href="cineplexDayNumStaticsPro?value=1">Cdata</a></li>
						<li><a href="allPlansPro">Plan</a></li>
						<li><a href="allOfflineMoviesPro">Offline</a></li>
						<li><a href="about_m.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner mdata-banner">
					<p>
						<strong class="font-1">Click</strong><strong class="font-2">Mdata</strong><strong
							class="font-1">to manage</strong><strong class="font-2">member!</strong>
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
						<li class="selected"><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container1"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("2")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li class="selected"><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container2"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("3")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li class="selected"><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container3"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("4")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li class="selected"><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container4"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("5")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li class="selected"><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container5"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("6")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li class="selected"><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container6"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("7")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li class="selected"><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
					</ul>
					<div class="block-8">
						<div id="container7"></div>
					</div>
					<%
						} else if (request.getParameter("value").equals("0")) {
					%>
					<ul class="nav">
						<li><a href="memberAgeStaticsPro?value=1">Ages</a></li>
						<li><a href="memberAgeStaticsPro?value=2">AgeRate</a></li>
						<li><a href="memberGenderStaticsPro?value=3">Gender</a></li>
						<li><a href="memberAddressStaticsPro?value=4">Address</a></li>
						<li><a href="memberConsumptionStaticsPro?value=5">Consumption</a></li>
						<li><a href="memberActivityCreditStaticsPro?value=6">ActivityCredit</a></li>
						<li><a href="memberCardStaticsPro?value=7">Card</a></li>
						<li class="selected"><a href="mdata.jsp?value=0">AnalysisHelp</a></li>
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