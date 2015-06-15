<%@page import="model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Activity Question</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/reset.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/grid_12.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/tablem.css">
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
						<li><a href="logoutPro">Log out</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index_w.jsp">Home</a></li>
						<li><a href="mplan.jsp?modify=1">MPlan</a></li>
						<li class="current"><a href="quesPro">Activity</a></li>
						<li><a href="allBookMoviesPro">Sale</a></li>
						<li><a href="query.jsp?query=0">Query</a></li>
						<li><a href="about_w.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner activity-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Activity</strong><strong
							class="font-1">to add</strong><strong class="font-2">question!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<%
					if (request.getAttribute("noMovie") == null) {
							if (request.getAttribute("movies") != null) {
								@SuppressWarnings("unchecked")
								List<Movie> movies = (List<Movie>) request
										.getAttribute("movies");
				%>
				<form action="activityQuestionPro" autocomplete="on" method="post">
					<div class="pad-1">
						<h2>Activity Question</h2>
						<div id="form2">
							<fieldset>
								<div class="left-4">
									<table id="rounded-corner"
										summary="2007 Major IT Companies' Profit">
										<thead>
											<tr>
												<th valign="top" width="10%" class="font"></th>
												<th valign="top" width="45%" class="font">Movie Name</th>
												<th valign="top" width="45%" class="font">Period</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (int i = 0; i < movies.size(); i++) {
																String movie_name = movies.get(i).getName();
																String period = movies.get(i).getPeriod();
																String newS = movie_name + "&&" + period;
																if (i % 3 == 0) {

																}
											%>
											<tr>
												<td><input type="checkbox" name="movies"
													value="<%=newS%>"></td>
												<td><%=movie_name%></td>
												<td><%=period%></td>
											</tr>
											<%
												}
														}
													}
											%>
										</tbody>
									</table>
								</div>
								<div class="left-5">
									<label><span class="text-form"><strong>Question</strong></span>
										<textarea name="question" required></textarea></label> <label><span
										class="text-form"><strong>3 Options</strong></span> <textarea
											name="quesoption1" style="ime-mode: disabled"
											onKeyUp="this.value=this.value.replace(/[^\.a-zA-Z]/g,'');this.value=this.value.replace('.','');"
											required></textarea> <textarea name="quesoption2"
											style="ime-mode: disabled"
											onKeyUp="this.value=this.value.replace(/[^\.a-zA-Z]/g,'');this.value=this.value.replace('.','');"
											required></textarea> <textarea name="quesoption3"
											style="ime-mode: disabled"
											onKeyUp="this.value=this.value.replace(/[^\.a-zA-Z]/g,'');this.value=this.value.replace('.','');"
											required></textarea></label> <label><span class="text-form"><strong>Credit</strong></span><select
										name="credit" id="select1">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select></label>
								</div>
							</fieldset>
						</div>
						<input type="submit" class="button-2-right1" value="Submit" />
					</div>
				</form>

				<div class="clear"></div>
			</div>
		</section>
		<!--==============================footer=================================-->
		<%@include file="footer.jsp"%>
	</MyTag:checkSession>
</body>
</html>