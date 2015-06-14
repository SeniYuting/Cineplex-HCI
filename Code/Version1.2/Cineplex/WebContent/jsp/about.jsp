<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
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

	<%
		String memberName = (String) ActionContext.getContext()
				.getSession().get("memberName");
	%>

	<MyTag:checkSession test="${sessionScope.account_id != null}">
		<header>
			<div class="main">
				<%@include file="header.jsp"%>
				<nav>
					<ul class="right">
						<li>Welcome <a href="infoPro?modify=1"><%=memberName%></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="allMoviesPro">Tickets</a></li>
						<li><a href="activityArrangePro">Activities</a></li>
						<li><a href="recordPro">Records</a></li>
						<li><a href="charge.jsp">Charge</a></li>
						<li class="current"><a href="about.jsp">About</a></li>
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
							<a href="allMoviesPro"><img src="../images/about-img1.png"
								alt="" class="img-radius"></a>
							<p>
								<a href="allMoviesPro" class="link" target="_blank">Tickets</a>
							</p>
							<p>Book Tickets here.</p>
						</div>
						<div class="block-5 border-2">
							<a href="activityArrangePro"><img
								src="../images/about-img2.png" alt="" class="img-radius"></a>
							<p>
								<a href="activityArrangePro" class="link" target="_blank">Activities</a>
							</p>
							<p>Attend Activities here.</p>
						</div>
						<div class="block-5 border-2">
							<a href="recordPro"><img src="../images/about-img2.png"
								alt="" class="img-radius"></a>
							<p>
								<a href="recordPro" class="link" target="_blank">Records</a>
							</p>
							<p>Check Records here.</p>
						</div>
						<div>
							<a href="charge.jsp"><img src="../images/about-img4.png"
								alt="" class="img-radius"></a>
							<p>
								<a href="charge.jsp" class="link" target="_blank">Charge</a>
							</p>
							<p>Charge your account here. And at least $200 to valid.</p>
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