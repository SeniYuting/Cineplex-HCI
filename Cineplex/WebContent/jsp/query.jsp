<%@page import="vo.ConsumptionRecordVO"%>
<%@page import="vo.PaymentRecordVO"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Query</title>
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
						<li><a href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index_w.jsp">Home</a></li>
						<li><a href="mplan.jsp?modify=1">MPlan</a></li>
						<li><a href="quesPro">Activity</a></li>
						<li><a href="allBookMoviesPro">Sale</a></li>
						<li class="current"><a href="query.jsp?query=0">Query</a></li>
						<li><a href="about_w.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner info-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Query</strong><strong
							class="font-1">to query</strong><strong class="font-2">member!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">

				<%
					if (request.getParameter("query").equals("0")) {
				%>
				<form action="queryPro?query=1" autocomplete="on" method="post">
					<div class="grid_12">
						<div class="pad-1">
							<div id="form4">
								<fieldset>
									<label><span class="text-form"><strong>MemberId</strong></span><input
										type="text" value="" name="memberId"></label>
								</fieldset>
							</div>
							<label><input type="submit" class="button-2-right1"
								value="Search" /></label>
						</div>
					</div>
				</form>
				<%
					} else {
											Member member = (Member) request.getAttribute("member");
											if (member != null) {
				%>
				<div class="grid_8">
					<div class="pad-1">
						<h2>Register Info</h2>
						<div id="form">
							<fieldset>
								<label><span class="text-form"><strong>Name</strong></span><input
									type="text" value="<%=member.getName()%>" readonly="readonly"></label>
								<label><span class="text-form"><strong>Account</strong></span><input
									type="text" value="<%=member.getAccount()%>"
									readonly="readonly"></label> <label><span
									class="text-form"><strong>Password</strong></span><input
									type="password" value="<%=member.getPassword()%>"
									readonly="readonly"> </label> <label><span
									class="text-form"><strong>Credit</strong></span><input
									type="text" value="<%=member.getCredit()%>" readonly="readonly"></label>
								<label><span class="text-form"><strong>Address</strong></span><input
									type="text" value="<%=member.getAddress()%>"
									readonly="readonly"></label> <label><span
									class="text-form"><strong>Gender</strong></span><input
									type="text" value="<%=member.getGender()%>" readonly="readonly"></label>
								<label><span class="text-form"><strong>Birthday</strong></span><input
									type="text" value="<%=member.getBirthday()%>"
									readonly="readonly"></label>
							</fieldset>
						</div>
					</div>
				</div>

				<div class="grid_4">
					<div class="pad-1">
						<h2 class="h2">Portrait</h2>
						<div class="map">
							<img src="../db/images/seni.png" alt="" class="img-indent">
						</div>
					</div>
				</div>

				<div class="grid_8 top-padding">
					<div class="pad-1">
						<h2>Member Info</h2>
						<div id="form">
							<fieldset>
								<label><span class="text-form"><strong>Card
											Num</strong></span><input type="text"
									value="<%=member.getMembercard_number()%>" readonly="readonly"></label>
								<label><span class="text-form"><strong>Balance</strong></span><input
									type="text" value="$ <%=member.getBalance()%>"
									readonly="readonly"></label> <label><span
									class="text-form"><strong>Valid</strong></span><input
									type="text" value="<%=member.getState()%>" readonly="readonly"></label>
								<label><span class="text-form"><strong>RegisterTime</strong></span><input
									type="text" value="<%=member.getRegister_time()%>"
									readonly="readonly"></label> <label><span
									class="text-form"><strong>MemberState</strong></span><input
									type="text" value="<%=member.getMember_state()%>"
									readonly="readonly"></label>
							</fieldset>
						</div>
					</div>
				</div>


				<%
					}
											if (request.getAttribute("noConsumption") == null) {
				%>
				<div class="grid_12 top-padding">
					<div class="pad-1">
						<h2 class="p3">Consumption</h2>
					</div>
				</div>

				<table id="rounded-corner" summary="2007 Major IT Companies' Profit">
					<thead>
						<tr>
							<th valign="top" width="20%" class="font">Movie Name</th>
							<th valign="top" width="35%" class="font">Period</th>
							<th valign="top" width="15%" class="font">Hall</th>
							<th valign="top" width="15%" class="font">My Seat</th>
							<th valign="top" width="15%" class="font">Money</th>
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
							<td><p class="color-1"><%=consumptionRecord.getMovie_name()%></p></td>
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
				<div class="grid_12 top-padding">
					<div class="pad-1">
						<h2 class="p3">No Consumption</h2>
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
							<th valign="top" width="35%" class="font">BankCard Number</th>
							<th valign="top" width="35%" class="font">Payment Time</th>
							<th valign="top" width="30%" class="font">Amount of Money</th>
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
				<%
					} else {
				%>
				<div class="grid_12 top-padding">
					<div class="pad-1">
						<h2 class="p3">No Payment</h2>
					</div>
				</div>
				<%
					}
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