<%@page import="model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Offline</title>
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

<script>
	function newwin(url) {
		var newwin = window
				.open(url, "newwin",
						"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes");
		newwin.focus();
		return false;
	}
</script>
<script>
	function submit10() {
		self.location.replace("allOfflineMoviesPro")
	}
</script>

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
						<li class="current"><a href="allOfflineMoviesPro">Offline</a></li>
						<li><a href="about_m.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner ticket-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Offline</strong><strong
							class="font-1">to offline</strong><strong class="font-2">tickets!</strong>
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
						<h2 class="p3">Tickets List</h2>
					</div>
				</div>
				<%
					if (request.getAttribute("noMovie") == null) {
							if (request.getAttribute("movies") != null) {
								@SuppressWarnings("unchecked")
								List<Movie> movies = (List<Movie>) request
										.getAttribute("movies");
								int pageSize = 8; // 每页记录数
								int pageCount = (movies.size() - 1 + pageSize)
										/ pageSize; // 总页数

								String strPage = request.getParameter("page");
								int intPage = 1; // 待显示页码
								if (strPage != null) {
									intPage = Integer.parseInt(strPage);
									if (intPage < 1)
										intPage = 1;
									if (intPage > pageCount)
										intPage = pageCount;
								}

								int end = intPage * pageSize;
								if (end > movies.size())
									end = movies.size();
								for (int i = (intPage - 1) * pageSize; i < end; i++) {
									String movie_name = movies.get(i).getName();
				%>
				<div class="grid_3">
					<div class="block-7-1 top-3">
						<form action="offlinePro?movie_name=<%=movies.get(i).getName()%>"
							autocomplete="on" method="post">
							<img src="<%=movies.get(i).getPic()%>" alt="" class="img-radius">
							<p class="color-1">
								<%=movies.get(i).getName()%>
							</p>
							<p>
								<%=movies.get(i).getPeriod()%>
							</p>
							<p>
								<%=movies.get(i).getSeat()%>
								Seats at Hall
								<%=movies.get(i).getHall()%>
							</p>
							<input type="submit" class="button-2-right2" value="Offline" />
						</form>
					</div>
				</div>
				<%
					}
				%>
				<div class="grid_12">
					<div class="pad-2">
						<%
							if (intPage > 1) {
						%>
						<a href="allOfflineMoviesPro?page=<%=intPage - 1%>">&lt;-&nbsp;&nbsp;</a>
						<%
							} else {
						%>
						&lt;-&nbsp;&nbsp;
						<%
							}
						%>
						Page
						<%=intPage%>
						<%
							if (intPage < pageCount) {
						%>
						<a href="allOfflineMoviesPro?page=<%=intPage + 1%>">-&gt;</a>
						<%
							} else {
						%>
						-&gt;
						<%
							}
						%>
					</div>
				</div>
				<%
					}
						} else {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">No Movie</h2>
					</div>
				</div>
				<%
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