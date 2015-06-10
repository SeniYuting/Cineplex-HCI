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
						<li>Welcome <a href="infoPro?modify=1&charge=1"><%=memberName%></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="allMoviesPro">Tickets</a></li>
						<li><a href="activityArrangePro">Activities</a></li>
						<li><a href="recordPro">Records</a></li>
						<li class="current"><a href="infoPro?modify=1&charge=1">Infos</a></li>
						<li><a href="about.jsp">About</a></li>
					</ul>
				</nav>
			</div>
		</header>
		<section id="header-content">
			<div class="main">
				<div class="sub-page-banner info-banner">
					<p>
						<strong class="font-1">Use</strong><strong class="font-2">Infos</strong><strong
							class="font-1">to check and</strong><strong class="font-2">modify!</strong>
					</p>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border subpage-content">
			<div class="ic"></div>
			<div class="container_12">
				<%
					Member member = (Member) request.getAttribute("member");
						if (request.getParameter("modify").equals("1")
								&& request.getParameter("charge").equals("1")) {
				%>
				<form action="infoPro?modify=2&charge=1" autocomplete="on"
					method="post">
					<div class="grid_8">
						<div class="pad-1">
							<h2>Register Info</h2>
							<div id="form5">
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
										type="text" value="<%=member.getCredit()%>"
										readonly="readonly"></label> <label><span
										class="text-form"><strong>Address</strong></span><input
										type="text" value="<%=member.getAddress()%>"
										readonly="readonly"></label> <label><span
										class="text-form"><strong>Gender</strong></span><input
										type="text" value="<%=member.getGender()%>"
										readonly="readonly"></label> <label><span
										class="text-form"><strong>Birthday</strong></span><input
										type="text" value="<%=member.getBirthday()%>"
										readonly="readonly"></label>
								</fieldset>
							</div>
							<%
								if (!(member.getMember_state().equals("stop") || member
												.getMember_state().equals("cancel"))) {
							%>
							<input type="submit" class="button-2-right1" value="Modify" /> <input
								type="button" class="button-2-right1" value="Member Cancel"
								onClick="cancel()" />
							<%
								}
							%>
						</div>
					</div>
					<div class="grid_4">
						<div class="pad-1">
							<h2 class="h2">Portrait</h2>
							<div class="map">
								<img src="<%=member.getIcon()%>" alt="" class="img-indent">
							</div>
						</div>
					</div>
				</form>

				<form action="infoPro?modify=1&charge=2" autocomplete="on"
					method="post">
					<div class="grid_8 top-padding">
						<div class="pad-1">
							<h2>Member Info</h2>
							<div id="form5">
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
							<%
								if (!(member.getMember_state().equals("stop") || member
												.getMember_state().equals("cancel"))) {
							%>
							<input type="submit" class="button-2-right1" value="Charge" /> <input
								type="button" class="button-2-right1" value="Exchage Credit"
								onClick="exchange()" />
							<%
								}
							%>
						</div>
					</div>

				</form>

				<div class="grid_4 top-padding">
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

				<%
					} else if (!request.getParameter("modify").equals("1")) {
							// 修改注册信息
				%>
				<form action="modifyInfoPro" autocomplete="on" method="post">

					<div class="grid_8">
						<div class="pad-1">
							<h2>Register Info -> Modify</h2>
							<div id="form">
								<fieldset>
									<label><span class="text-form"><strong>Name</strong></span><input
										type="text" value="<%=member.getName()%>" name="uname"></label>
									<label><span class="text-form"><strong>Password</strong></span><input
										type="password" value="" name="password1"> </label> <label><span
										class="text-form"><strong>Pwd Again</strong></span><input
										type="password" value="" name="password2"></label> <label><span
										class="text-form"><strong>Address</strong></span><input
										type="text" value="<%=member.getAddress()%>" name="address"></label>
									<label><span class="text-form"><strong>Birthday</strong></span><input
										type="text" value="<%=member.getBirthday()%>" name="birthday"
										onClick="WdatePicker()"></label>
								</fieldset>
							</div>
							<input type="submit" class="button-2-right1" value="Submit" />
						</div>
					</div>

					<div class="grid_4">
						<div class="pad-1">
							<h2 class="h2">Portrait</h2>
							<div class="map">
								<img src="<%=member.getIcon()%>" alt="" class="img-indent">
								<span>Modify photo:</span><input type="file" id="icon"
									name="icon" />
							</div>
						</div>
					</div>

				</form>
				<%
					} else if (!request.getParameter("charge").equals("1")) {
							// 卡充值
				%>
				<form action="chargePro" autocomplete="on" method="post">

					<div class="grid_8">
						<div class="pad-1">
							<h2>Member Info -> Charge</h2>
							<div id="form">
								<fieldset>
									<label><span class="text-form"><strong>BankCard</strong></span><input
										type="text" name="number" required></label> <label><span
										class="text-form"><strong>Password</strong></span><input
										type="password" name="password" required></label> <label><span
										class="text-form"><strong>Fee</strong></span> <select
										name="fee" id="select2">
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