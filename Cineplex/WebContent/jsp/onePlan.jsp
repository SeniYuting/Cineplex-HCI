<%@page import="model.MoviePlan"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>One Plan</title>
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
						<li><a href="index_m.jsp">Home</a></li>
						<li><a href="memberAgeStaticsPro?value=1">Mdata</a></li>
						<li><a href="cineplexDayNumStaticsPro?value=1">Cdata</a></li>
						<li class="current"><a href="allPlansPro">Plan</a></li>
						<li><a href="allOfflineMoviesPro">Offline</a></li>
						<li><a href="about_m.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner ticket-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Plan</strong><strong
							class="font-1">to</strong><strong class="font-2">approve!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<div class="grid_12">
					<div class="pad-1">
						<%
							MoviePlan moviePlan = (MoviePlan) request
										.getAttribute("moviePlan");
						%>
						<h2 class="h2">the Leading Role</h2>
						<div class="wrap block-6">
							<div class="img-indent-3">
								<img src="<%=((String) moviePlan.getStarpic()).split("&&")[0]%>"
									alt="" class="left-2 img-radius"><img
									src="<%=((String) moviePlan.getStarpic()).split("&&")[1]%>"
									alt="" class="img-radius">
							</div>
							<div class="extra-wrap">
								<p class="color-1 p2">
									Starring
									<%=moviePlan.getStar()%>.
								</p>
								<p><%=moviePlan.getActorplot()%></p>
								<a href="passPro?moviePlan_id=<%=moviePlan.getId()%>"
									class="button-2">PASS</a>
							</div>
						</div>
					</div>
				</div>
				<div class="grid_12">
					<div class="pad-1 wrap top-2">
						<h2 class="h2"><%=moviePlan.getName()%></h2>
						<div class="wrap">
							<img class="img-indent-4 img-radius" alt=""
								src="<%=moviePlan.getPic()%>">
							<div class="extra-wrap">
								<p class="color-1 p2">
									Directed by
									<%=moviePlan.getDirector()%>.
								</p>
								<p><%=moviePlan.getIntroduction()%></p>
								<div class="lists wrap">
									<ul class="list-1 border-2">
										<li><a href="#">Hall: <%=moviePlan.getHall()%></a></li>
										<li><a href="#">Seat: <%=moviePlan.getSeat()%></a></li>
										<li><a href="#">Period: <%=moviePlan.getPeriod()%></a></li>
									</ul>
									<ul class="list-1">
										<li><a href="#">Price: $ <%=moviePlan.getPrice()%></a></li>
										<li><a href="#">Language: <%=moviePlan.getLanguage()%></a></li>
										<li><a href="#">Writer: <%=moviePlan.getWriter()%></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</section>
		<!--==============================footer=================================-->
		<%@include file="footer.jsp"%>
	</MyTag:checkSession>
</body>
</html>