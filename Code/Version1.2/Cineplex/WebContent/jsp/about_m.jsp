<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About</title>
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
						<li><a href="allPlansPro">Plan</a></li>
						<li><a href="allOfflineMoviesPro">Offline</a></li>
						<li class="current"><a href="about_m.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner about-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">About</strong><strong
							class="font-1">to</strong><strong class="font-2">learn
							more!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<%@include file="amiddle.jsp"%>
				<div class="grid_12">
					<div class="pad-1 wrap top-1">
						<h2>Basic Function</h2>

						<div class="block-5 border-2">
							<img src="../images/about-img5.png" alt="" class="img-radius">
							<p>
								<a href="memberAgeStaticsPro?value=1" class="color-1">Mdata</a>
							</p>
							<p>
								Check member data <a href="memberAgeStaticsPro?value=1"
									class="link" target="_blank">here</a>.
							</p>
						</div>
						<div class="block-5 border-2">
							<img src="../images/about-img6.png" alt="" class="img-radius">
							<p>
								<a href="cineplexDayNumStaticsPro?value=1" class="color-1">Cdata</a>
							</p>
							<p>
								Check cineplex data <a href="cineplexDayNumStaticsPro?value=1"
									class="link" target="_blank">here</a>.
							</p>
						</div>
						<div class="block-5 border-2">
							<img src="../images/about-img2.png" alt="" class="img-radius">
							<p>
								<a href="allPlansPro" class="color-1">Plan</a>
							</p>
							<p>
								Check movie plans <a href="allPlansPro" class="link"
									target="_blank">here</a>.
							</p>
						</div>
						<div>
							<img src="../images/about-img1.png" alt="" class="img-radius">
							<p>
								<a href="allOfflineMoviesPro" class="color-1">Offline</a>
							</p>
							<p>
								Make all the suitable movies offline <a
									href="allOfflineMoviesPro" class="link" target="_blank">here</a>.
							</p>
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