<%@page import="vo.ConsumptionRecordVO"%>
<%@page import="vo.PaymentRecordVO"%>
<%@page import="java.util.List"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Record</title>
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
						<li><a href="allMoviesPro">Ticket</a></li>
						<li><a href="activityArrangePro">Activity</a></li>
						<li class="current"><a href="recordPro">History</a></li>
						<li><a href="charge.jsp">Charge</a></li>
						<li><a href="about.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner big-image4">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">History</strong><strong
							class="font-1">to check</strong><strong class="font-2">record!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">

				<%
					if (request.getAttribute("noConsumption") == null) {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">Consumption</h2>
					</div>
				</div>

				<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
					<thead>
						<tr>
							<th valign="top" width="20%">Movie Name</th>
							<th valign="top" width="35%">Movie Period</th>
							<th valign="top" width="15%">Hall</th>
							<th valign="top" width="15%">My Seat</th>
							<th valign="top" width="15%">Money</th>
						</tr>
					</thead>
					<tbody>

						<%
							if (request.getAttribute("consumptionRecordList") != null) {
										@SuppressWarnings("unchecked")
										List<ConsumptionRecordVO> consumptionRecordList = (List<ConsumptionRecordVO>) request
												.getAttribute("consumptionRecordList");
										for (int i = 0; i < consumptionRecordList.size(); i++) {
											ConsumptionRecordVO consumptionRecord = consumptionRecordList
													.get(i);
						%>

						<tr>
							<td><a
								href=" oneMoviePro?movie_name=<%=consumptionRecord.getMovie_name()%>"
								class="link" target="_blank"><%=consumptionRecord.getMovie_name()%></a></td>
							<td><%=consumptionRecord.getPeriod()%></td>
							<td><%=consumptionRecord.getHall()%></td>
							<td><%=consumptionRecord.getmember_seat()%></td>
							<td>$ <%=consumptionRecord.getPrice()%></td>
						</tr>
						<%
							}
									}
						%>
					</tbody>
				</table>
				<%
					} else {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">No Consumption History</h2>
					</div>
				</div>
				<%
					}
						if (request.getAttribute("noPayment") == null) {
				%>
				<div class="grid_12 top-padding">
					<div class="pad-1">
						<h2 class="p3">Payment</h2>
					</div>
				</div>

				<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
					<thead>
						<tr>
							<th valign="top" width="35%">BankCard Number</th>
							<th valign="top" width="35%">Payment Time</th>
							<th valign="top" width="30%">Amount of Money</th>
						</tr>
					</thead>
					<tbody>

						<%
							if (request.getAttribute("paymentRecordList") != null) {
										@SuppressWarnings("unchecked")
										List<PaymentRecordVO> paymentRecordList = (List<PaymentRecordVO>) request
												.getAttribute("paymentRecordList");
										for (int i = 0; i < paymentRecordList.size(); i++) {
											PaymentRecordVO paymentRecord = paymentRecordList
													.get(i);
						%>

						<tr>
							<td><%=paymentRecord.getbankCardNumber()%></td>
							<td><%=paymentRecord.getTime()%></td>
							<td>$ <%=paymentRecord.getFee()%></td>
						</tr>

						<%
							}
									}
						%>
					</tbody>
				</table>
				<a href="charge.jsp"><input type="button"
					class="button-2-right1" value="Charge" /></a>
				<%
					} else {
				%>
				<div class="grid_12">
					<div class="pad-1">
						<h2 class="p3">No Payment History</h2>
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