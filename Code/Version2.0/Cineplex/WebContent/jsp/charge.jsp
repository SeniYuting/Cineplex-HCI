<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Info</title>
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
<script src="../js/My97DatePicker/WdatePicker.js"></script>
<script>
	function cancel() {
		var result = confirm('Sure to Cancel Member?');
		if (result) {
			window.location.href = "cancelMemberPro";
		}
	}

	function exchange() {
		var result = confirm('10 Credits -> $1!, Sure to Exchange Credits?');
		if (result) {
			window.location.href = "creditExchangePro";
		}
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
						<li><a href="allMoviesPro">Ticket</a></li>
						<li><a href="activityArrangePro">Activity</a></li>
						<li><a href="recordPro">History</a></li>
						<li class="current"><a href="charge.jsp">Charge</a></li>
						<li><a href="about.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner record-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Charge</strong><strong
							class="font-1">to charge</strong><strong class="font-2">account!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<form action="chargePro" autocomplete="on" method="post">

					<div class="grid_8">
						<div class="pad-1">
							<h2>Charge</h2>
							<div id="form">
								<fieldset>
									<label><span class="text-form1"><strong>BankCard</strong></span><input
										type="text" name="number" required></label> <label><span
										class="text-form1"><strong>Password</strong></span><input
										type="password" name="password" required></label> <label><span
										class="text-form1"><strong>Fee</strong></span> <select
										name="fee" id="select2">
											<option value="50">50</option>
											<option value="100">100</option>
											<option value="200">200</option>
											<option value="300">300</option>
											<option value="400">400</option>
											<option value="500">500</option>
									</select> </label>

								</fieldset>
							</div>
							<input type="submit" class="button-2-right1" value="Submit" />
						</div>
					</div>

				</form>

				<div class="grid_4">
					<div class="pad-1">
						<h2 class="h2">Charge Notice</h2>
						<div class="center">
							<img src="../images/webmoney.png" alt="" class="img-indent">
						</div>
						<dl>
							<dd>
								<span class="red1 font1">Activate:</span>&nbsp;&nbsp;Payment of
								over &nbsp;&nbsp;&nbsp;<label class="red1 font1">$200</label>
							</dd>
							<dd>
								<span>Way:</span>&nbsp;&nbsp;Pay by bank card
							</dd>
						</dl>
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