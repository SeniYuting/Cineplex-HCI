<%@page import="model.MoviePlan"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MPlan</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/reset.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/grid_12.css">
<script src="../js/jquery-1.7.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/cufon-yui.js"></script>
<script src="../js/Vegur-L_300.font.js"></script>
<script src="../js/Vegur-M_500.font.js"></script>
<script src="../js/Vegur-R_400.font.js"></script>
<script src="../js/cufon-replace.js"></script>
<script src="../js/FF-cash.js"></script>
<script src="../js/calendar.js"></script>
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
						<li><a href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index_w.jsp">Home</a></li>
						<li class="current"><a href="mplan.jsp?modify=1">MPlan</a></li>
						<li><a href="quesPro">Activity</a></li>
						<li><a href="allBookMoviesPro">Sale</a></li>
						<li><a href="query.jsp?query=0">Query</a></li>
						<li><a href="about_w.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner ticket-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">MPlan</strong><strong
							class="font-1">to plan</strong><strong class="font-2">movie!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<%
					if (request.getParameter("modify").equals("1")) {
				%>
				<form action="makePlanPro" autocomplete="on" method="post">
					<div class="grid_8">
						<div class="pad-1">
							<h2>Movie Plan</h2>
							<div id="form">
								<fieldset>
									<label><span class="text-form"><strong>Name</strong></span><input
										type="text" value="" name="name" required></label> <label><span
										class="text-form"><strong>Star</strong></span><input
										type="text" value="" name="star" required></label> <label><span
										class="text-form"><strong>Director</strong></span><input
										type="text" value="" name="director" required> </label> <label><span
										class="text-form"><strong>Hall</strong></span> <select
										name="hall" id="select2">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
									</select> </label> <label><span class="text-form"><strong>Seat</strong></span>
										<select name="seat" id="select2">
											<option value="30">30</option>
											<option value="60">60</option>
											<option value="90">90</option>
									</select> </label><label><span class="text-form"><strong>PeriodBegin</strong></span><input
										type="text" value="" name="periodBegin" id="txtDate"
										onclick="SetDate(this,'yyyy-MM-dd hh:mm')" readonly="readonly"
										required> </label><label><span class="text-form"><strong>PeriodEnd</strong></span><input
										type="text" value="" name="periodEnd" id="txtDate"
										onclick="SetDate(this,'hh:mm')" readonly="readonly" required>
									</label><label><span class="text-form"><strong>Price</strong></span>
										<input type="text" name="price" value="30" size="5"
										style="ime-mode: disabled"
										onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										required /> </label> <label><span class="text-form"><strong>Languange</strong></span>
										<select name="language" id="select2">
											<option value="English">English</option>
											<option value="Chinese">Chinese</option>
											<option value="Other">Other</option>
									</select> </label> <label><span class="text-form"><strong>Writer</strong></span><input
										type="text" value="" name="writer" required></label> <label><span
										class="text-form"><strong>ActorPlot</strong></span> <textarea
											name="actorplot" required></textarea></label> <label><span
										class="text-form"><strong>Introduction</strong></span> <textarea
											name="introduction" required></textarea></label>
								</fieldset>
							</div>
							<input type="submit" class="button-2-right1" value="Submit" />
						</div>
					</div>
					<div class="grid_4">
						<div class="pad-1">
							<h2 class="h2">Star 1</h2>
							<img src="../db/images/movie_default1.png" alt=""
								class="img-indent"> <input type="file" id="icon"
								name="icon1" />
							<h2 class="h2 top-3">Star 2</h2>
							<img src="../db/images/movie_default2.png" alt=""
								class="img-indent"> <input type="file" id="icon"
								name="icon2" />
							<h2 class="h2 top-3">Poster</h2>
							<img src="../db/images/movie_default3.png" alt=""
								class="img-indent"> <input type="file" id="icon"
								name="icon3" />

						</div>
					</div>
				</form>

				<form action="oneModifyPlanPro" autocomplete="on" method="post">
					<div class="top grid_4">
						<div class="pad-1">
							<div id="form1">
								<fieldset>
									<label><span class="text-form"><strong>MPlanName</strong></span><input
										type="text" value="" name="moviePlanName"></label>
								</fieldset>
							</div>
							<input type="submit" class="button-2-right1" value="Search" />

						</div>
					</div>
				</form>

				<%
					} else if (request.getParameter("modify").equals("2")) {
							MoviePlan moviePlan = (MoviePlan) request
									.getAttribute("moviePlan");
							if (moviePlan != null) {
				%>
				<form action="modifyPlanPro" autocomplete="on" method="post">
					<div class="grid_8">
						<div class="pad-1">
							<h2>Movie Plan</h2>
							<div id="form">
								<fieldset>
									<label><span class="text-form"><strong>Name</strong></span><input
										type="text" value="<%=moviePlan.getName()%>" name="name"
										required></label> <label><span class="text-form"><strong>Star</strong></span><input
										type="text" value="<%=moviePlan.getStar()%>" name="star"
										required></label> <label><span class="text-form"><strong>Director</strong></span><input
										type="text" value="<%=moviePlan.getDirector()%>"
										name="director" required> </label> <label><span
										class="text-form"><strong>Hall</strong></span> <input
										type="text" value="<%=moviePlan.getHall()%>" name="hall"
										size="5" style="ime-mode: disabled"
										onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										required> </label> <label><span class="text-form"><strong>Seat</strong></span><input
										type="text" value="<%=moviePlan.getSeat()%>" name="seat"
										size="5" style="ime-mode: disabled"
										onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										required></label> <label><span class="text-form"><strong>Period</strong></span><input
										type="text" value="<%=moviePlan.getPeriod()%>" name="period"
										required></label> <label><span class="text-form"><strong>Price</strong></span><input
										type="text" value="<%=moviePlan.getPrice()%>" name="price"
										size="5" style="ime-mode: disabled"
										onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										required></label> <label><span class="text-form"><strong>Languange</strong></span><input
										type="text" value="<%=moviePlan.getLanguage()%>"
										name="language" required></label> <label><span
										class="text-form"><strong>Writer</strong></span><input
										type="text" value="<%=moviePlan.getWriter()%>" name="writer"
										required></label> <label><span class="text-form"><strong>ActorPlot</strong></span>
										<textarea name="actorplot" required><%=moviePlan.getActorplot()%></textarea></label>
									<label><span class="text-form"><strong>Introduction</strong></span>
										<textarea name="introduction" required><%=moviePlan.getIntroduction()%></textarea></label>
								</fieldset>
							</div>

							<input type="submit" class="button-2-right1" value="Modify" />

						</div>
					</div>
					<div class="grid_4">
						<div class="pad-1">
							<h2 class="h2">Star 1</h2>
							<img src="<%=((String) moviePlan.getStarpic()).split("&&")[0]%>"
								alt="" class="img-indent"> <input type="file" id="icon"
								name="icon1" />
							<h2 class="h2 top-3">Star 2</h2>
							<img src="<%=((String) moviePlan.getStarpic()).split("&&")[1]%>"
								alt="" class="img-indent"> <input type="file" id="icon"
								name="icon2" />
							<h2 class="h2 top-3">Poster</h2>
							<img src="<%=moviePlan.getPic()%>" alt="" class="img-indent">
							<input type="file" id="icon" name="icon3" />

						</div>
					</div>
				</form>
				<%
					}
						}
				%>
				<div class="clear"></div>
			</div>
		</section>
		<!--==============================footer=================================-->
		<%@include file="footer.jsp"%>
	</MyTag:checkSession>
</body>
</html>