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
					<ul class="right red1">
						<li>Welcome <a href="infoPro?modify=1"><%=memberName%></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="allMoviesPro">Tickets</a></li>
						<li><a href="activityArrangePro">Activities</a></li>
						<li><a href="recordPro">Records</a></li>
						<li><a href="charge.jsp">Charge</a></li>
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
						if (request.getParameter("modify").equals("1")) {
				%>
				<form action="infoPro?modify=2" autocomplete="on"
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

				<form action="charge.jsp" autocomplete="on"
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
										class="text-form"><strong>Address</strong></span>									
										
									    <select name="address" id="select2">									
									        <option value="Anhui" <% if(member.getAddress().equals("Anhui")){%> selected <%} %>>Anhui</option>
									        <option value="Aomen" <% if(member.getAddress().equals("Aomen")){%> selected <%} %>>Aomen</option>
									        <option value="Beijing" <% if(member.getAddress().equals("Beijing")){%> selected <%} %>>Beijing</option>
									        <option value="Chongqing" <% if(member.getAddress().equals("Chongqing")){%> selected <%} %>>Chongqing</option>
									        <option value="Fujian" <% if(member.getAddress().equals("Fujian")){%> selected <%} %>>Fujian</option>
									        <option value="Gansu" <% if(member.getAddress().equals("Gansu")){%> selected <%} %>>Gansu</option>
									        <option value="Guangdong" <% if(member.getAddress().equals("Guangdong")){%> selected <%} %>>Guangdong</option>
									        <option value="Guangxi" <% if(member.getAddress().equals("Guangxi")){%> selected <%} %>>Guangxi</option>
									        <option value="Guizhou" <% if(member.getAddress().equals("Guizhou")){%> selected <%} %>>Guizhou</option>
									        <option value="Hainan" <% if(member.getAddress().equals("Hainan")){%> selected <%} %>>Hainan</option>
									        <option value="Hebei" <% if(member.getAddress().equals("Hebei")){%> selected <%} %>>Hebei</option>
									        <option value="Henan" <% if(member.getAddress().equals("Henan")){%> selected <%} %>>Henan</option>
									        <option value="Heilongjiang" <% if(member.getAddress().equals("Heilongjiang")){%> selected <%} %>>Heilongjiang</option>
									        <option value="Hubei" <% if(member.getAddress().equals("Hubei")){%> selected <%} %>>Hubei</option>
									        <option value="Hunan" <% if(member.getAddress().equals("Hunan")){%> selected <%} %>>Hunan</option>
									        <option value="Jilin" <% if(member.getAddress().equals("Jilin")){%> selected <%} %>>Jilin</option>
									        <option value="Jiangsu" <% if(member.getAddress().equals("Jiangsu")){%> selected <%} %>>Jiangsu</option>
									        <option value="Jiangxi" <% if(member.getAddress().equals("Jiangxi")){%> selected <%} %>>Jiangxi</option>
									        <option value="Liaoning" <% if(member.getAddress().equals("Liaoning")){%> selected <%} %>>Liaoning</option>
									        <option value="Neimenggu" <% if(member.getAddress().equals("Neimenggu")){%> selected <%} %>>Neimenggu</option>
									        <option value="Ningxia" <% if(member.getAddress().equals("Ningxia")){%> selected <%} %>>Ningxia</option>
									        <option value="Qinghai" <% if(member.getAddress().equals("Qinghai")){%> selected <%} %>>Qinghai</option>
									        <option value="Shandong" <% if(member.getAddress().equals("Shandong")){%> selected <%} %>>Shandong</option>
									        <option value="Shan(-)xi" <% if(member.getAddress().equals("Shan(-)xi")){%> selected <%} %>>Shan(-)xi</option>
									        <option value="Shan(√)xi" <% if(member.getAddress().equals("Shan(√)xi")){%> selected <%} %>>Shan(√)xi</option>
									        <option value="Shanghai" <% if(member.getAddress().equals("Shanghai")){%> selected <%} %>>Shanghai</option>
									        <option value="Sichuan" <% if(member.getAddress().equals("Sichuan")){%> selected <%} %>>Sichuan</option>
									        <option value="Taiwan" <% if(member.getAddress().equals("Taiwan")){%> selected <%} %>>Taiwan</option>
									        <option value="Tianjin" <% if(member.getAddress().equals("Tianjin")){%> selected <%} %>>Tianjin</option>
									        <option value="Xizang" <% if(member.getAddress().equals("Xizang")){%> selected <%} %>>Xizang</option>
									        <option value="Xianggang" <% if(member.getAddress().equals("Xianggang")){%> selected <%} %>>Xianggang</option>
									        <option value="Xinjiang" <% if(member.getAddress().equals("Xinjiang")){%> selected <%} %>>Xinjiang</option>
									        <option value="Yunnan" <% if(member.getAddress().equals("Yunnan")){%> selected <%} %>>Yunnan</option>
									        <option value="Zhejiang" <% if(member.getAddress().equals("Zhejiang")){%> selected <%} %>>Zhejiang</option>
									</select>
						
										</label>
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