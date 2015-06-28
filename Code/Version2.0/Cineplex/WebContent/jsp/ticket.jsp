<%@page import="model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Ticket</title>
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
		self.location.replace("allMoviesPro")
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
				<div class="sub-page-banner ticket-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Ticket</strong><strong
							class="font-1">to pre-</strong><strong class="font-2">book!</strong>
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
						<h2 class="p3">Movies On Showing</h2>
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
					<div class="block-7 top-3">
						<a href="oneMoviePro?movie_name=<%=movie_name%>"><img
							src="<%=movies.get(i).getPic()%>" alt="" class="img-radius"
							height="200" width="180"></a>
						<p class="color-1">
							<a href="oneMoviePro?movie_name=<%=movie_name%>"
								class="color-1 red1"><%=movies.get(i).getName()%></a>
						</p>
						<p>
							<%=movies.get(i).getPeriod()%>.
						</p>
						<p>
							$
							<%=movies.get(i).getPrice()%>.
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
						<a href="allMoviesPro?page=<%=intPage + 1%>">&nbsp;&nbsp;-&gt;</a>
						<%
							} else {
						%>
						&nbsp;&nbsp;-&gt;
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