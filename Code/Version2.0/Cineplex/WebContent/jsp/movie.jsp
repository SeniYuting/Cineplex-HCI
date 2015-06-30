<%@page import="model.Movie"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Movie</title>
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
							href="infoPro?modify=1">My Account</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="logoutPro">Log out</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index.jsp">Home</a></li>
						<li class="current"><a href="allMoviesPro">Ticket</a></li>
						<li><a href="activityArrangePro">Activity</a></li>
						<li><a href="recordPro">History</a></li>
						<li><a href="charge.jsp">Charge</a></li>
						<li><a href="about.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner big-image3">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Movie</strong><strong
							class="font-1">to know</strong><strong class="font-2">more!</strong>
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
							Movie movie = (Movie) request.getAttribute("movie");
						%>
						<h2 class="h2"><%=movie.getName()%></h2>
						<div class="wrap">
							<img class="img-indent-4 img-radius" height="300" width="270"
								alt="" src="<%=movie.getPic()%>">
							<div class="extra-wrap">
								<p class="color-1 p2">
									Directed by
									<%=movie.getDirector()%>.
								</p>
								<p><%=movie.getIntroduction()%></p>
								<div class="lists wrap red1">
									<ul class="list-1 border-2">
										<li>Hall: <%=movie.getHall()%></li>
										<li>Seat: <%=movie.getSeat()%></li>
										<li>Period: <%=movie.getPeriod()%></li>
									</ul>
									<ul class="list-1">
										<li>Price: $ <%=movie.getPrice()%></li>
										<li>Language: <%=movie.getLanguage()%></li>
										<li>Writer: <%=movie.getWriter()%></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="grid_12">
					<div class="pad-1 wrap top-2">

						<h2 class="h2">The Leading Role</h2>
						<div class="wrap block-6">
							<div class="img-indent-5">
								<img src="<%=((String) movie.getStarpic()).split("&&")[0]%>"
									alt="" class="left-2 img-radius"><img
									src="<%=((String) movie.getStarpic()).split("&&")[1]%>" alt=""
									class="img-radius">
							</div>
							<div>
								<p class="color-1 p2">
									Starring
									<%=movie.getStar()%>.
								</p>
								<p><%=movie.getActorplot()%></p>



							</div>
							<form action="ticketBookPro?movie_id=<%=movie.getId()%>"
								autocomplete="on" method="post">
								<div class="top-1 left-3 font1 red1">
									<label>Ticket Num&nbsp;&nbsp;&nbsp;&nbsp;</label> <select
										name="number" id="select1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> <input type="submit" class="button-2-right1" value="Book" />
								</div>
							</form>
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