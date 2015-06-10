<%@page import="vo.ActivityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Activity</title>
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
						<li><a href="index.jsp">Home</a></li>
						<li><a href="allMoviesPro">Tickets</a></li>
						<li class="current"><a href="activityArrangePro">Activities</a></li>
						<li><a href="recordPro">Records</a></li>
						<li><a href="infoPro?modify=1&charge=1">Infos</a></li>
						<li><a href="about.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner activity-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Activities</strong><strong
							class="font-1">to</strong><strong class="font-2">attend!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<%
					if (request.getAttribute("noQuestion") == null) {
									if (request.getAttribute("activityList") != null) {
										@SuppressWarnings("unchecked")
										List<ActivityVO> activityList = (List<ActivityVO>) request
												.getAttribute("activityList");
										if (activityList.size() == 0) {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">No Activity</h2>
					</div>
				</div>

				<%
					} else {
											for (int i = 0; i < activityList.size(); i++) {
												ActivityVO activity = activityList.get(i);
				%>
				<div class="grid_12">
					<div class="pad-1 wrap top-2">
						<h2 class="h2">
							Question about
							<%=activity.getMovie_name()%></h2>
						<div class="wrap block-6">
							<div class="img-indent-3">
								<img src="<%=activity.getPic()%>" alt=""
									class="left-2 img-radius">
							</div>
							<div class="extra-wrap1">
								<p class="p2"><%=activity.getIntroduction()%></p>
								<p class="color-1 p2">
									<%=activity.getQuestion()%>&nbsp;&nbsp;&nbsp;<a href="#"
										class="link" target="_blank">Credits: <%=activity.getCredit()%></a>
								</p>
								<form
									action="answerQuestionPro?question_id=<%=activity.getQuestionId()%>"
									autocomplete="on" method="post">
									<div>
										<input type="radio" name="answer" value="a1" checked="checked"><label><%=((String) activity.getOption())
										.split("&&")[0]%></label> <input type="radio" name="answer" value="a2"><label><%=((String) activity.getOption())
										.split("&&")[1]%></label> <input type="radio" name="answer" value="a3"><label><%=((String) activity.getOption())
										.split("&&")[2]%></label>
									</div>
									<input type="submit" class="button-2-right" value="Submit" />
								</form>
							</div>
						</div>
					</div>
				</div>
				<%
					}
								}
							}
						} else {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">No Question</h2>
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