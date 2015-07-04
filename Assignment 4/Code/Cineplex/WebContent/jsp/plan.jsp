<%@page import="model.MoviePlan"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Plan</title>
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
		self.location.replace("allPlansPro")
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
						<li><a href="logoutPro">Log out</a></li>
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
				<div class="sub-page-banner activity-banner">
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
				<%
					if (request.getAttribute("noMoviePlan") == null) {
							if (request.getAttribute("moviePlans") != null) {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">Plans List</h2>
					</div>
				</div>
				<%
					@SuppressWarnings("unchecked")
								List<MoviePlan> moviePlans = (List<MoviePlan>) request
										.getAttribute("moviePlans");
								int pageSize = 8; // 每页记录数
								int pageCount = (moviePlans.size() - 1 + pageSize)
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
								if (end > moviePlans.size())
									end = moviePlans.size();
								for (int i = (intPage - 1) * pageSize; i < end; i++) {
									String moviePlan_name = moviePlans.get(i).getName();
				%>

				<div class="grid_3">
					<div class="block-7 top-3">
						<a href="onePlanPro?moviePlan_name=<%=moviePlan_name%>"><img
							src="<%=moviePlans.get(i).getPic()%>" alt="" class="img-radius"></a>
						<p class="color-1">
							<a href="onePlanPro?moviePlan_name=<%=moviePlan_name%>"
								class="color-1"><%=moviePlans.get(i).getName()%></a>
						</p>
						<p>
							Directed by
							<%=moviePlans.get(i).getDirector()%>.
						</p>
						<p>
							$
							<%=moviePlans.get(i).getPrice()%>.
						</p>
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
						<a href="allMoviesPro?page=<%=intPage - 1%>">&lt;-&nbsp;&nbsp;</a>
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
						<a href="allMoviesPro?page=<%=intPage + 1%>">-&gt;</a>
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
						<h2 class="p3">No Movie Plan</h2>
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