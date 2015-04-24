<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Or Register</title>
<link rel="stylesheet" type="text/css" href="../css/demo.css" />
<link rel="stylesheet" type="text/css" href="../css/login&register.css" />
<link rel="stylesheet" type="text/css" href="../css/animate-custom.css" />
<script src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="container">
		<!--==============================header=================================-->
		<header>
			<h1>
				<a href="../JSPs/index.jsp"><img src="../images/logo-login.png" /></a>
			</h1>
		</header>
		<!--==============================content================================-->
		<section>
			<div id="container_demo">
				<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
					id="tologin"></a>
				<div id="wrapper">

					<div id="login" class="animate form">
						<form action="loginPro" autocomplete="on" method="post">
							<h1>Login</h1>
							<%
								if (request.getParameter("error") != null
										&& request.getParameter("error").equals("1")) {
							%>
							<p style="color: red;">Account(Email)/Password Error!</p>
							<%
								}
							%>
							<p>
								<label for="username" class="uname" data-icon="u">Account(Email)</label>
								<input id="email" name="account" required type="text"
									placeholder="e.g. mymail@mail.com" />
							</p>
							<p>
								<label for="password" class="youpasswd" data-icon="p">Password</label>
								<input id="password" name="password" required type="password"
									placeholder="e.g. X8df!90EO" />
							</p>
							<p class="login button">
								<input type="submit" value="Login" />
							</p>
							<p class="change_link">
								Have no account? <a href="#toregister" class="to_register">Register</a>
							</p>
						</form>
					</div>

					<div id="register" class="animate form">
						<form action="registerPro#toregister" autocomplete="on"
							method="post">
							<h1>Register</h1>
							<%
								if (request.getParameter("registerError") != null
										&& request.getParameter("registerError").equals("1")) {
							%>
							<p style="color: red;">Error! Please Register Again!</p>
							<%
								}
								if (request.getParameter("pwdError") != null
										&& request.getParameter("pwdError").equals("1")) {
							%>
							<p style="color: red;">Error! Password Disagree!</p>
							<%
								}
								if (request.getParameter("accountExist") != null
										&& request.getParameter("accountExist").equals("1")) {
							%>
							<p style="color: red;">Error! Account Exists!</p>
							<%
								}
								if (request.getParameter("accountError") != null
										&& request.getParameter("accountError").equals("1")) {
							%>
							<p style="color: red;">Error! Account can't be manager or
								waiter!</p>
							<%
								}
								if (request.getParameter("success") != null
										&& request.getParameter("success").equals("1")) {
							%>
							<p style="color: red;">Register Success! Please Login!</p>
							<%
								}
							%>
							<p>
								<label for="emailsignup" class="youmail" data-icon="e">Account(Email)</label>
								<input id="emailsignup" name="account" required type="email"
									placeholder="e.g. mysupermail@mail.com" />
							</p>
							<p>
								<label for="usernamesignup" class="uname" data-icon="u">Name</label>
								<input id="usernamesignup" name="name" required type="text"
									placeholder="e.g. mysuperusername690" />
							</p>
							<p>
								<label for="passwordsignup" class="youpasswd" data-icon="p">Password</label>
								<input id="passwordsignup" name="password" required
									type="password" placeholder="e.g. X8df!90EO" />
							</p>
							<p>
								<label for="passwordsignup_confirm" class="youpasswd"
									data-icon="p">Password Again</label> <input
									id="passwordsignup_confirm" name="password2" required
									type="password" placeholder="e.g. X8df!90EO" />
							</p>
							<p>
								<label>Gender</label> <br> <input type="radio"
									name="gender" value="female" checked="checked" />female <input
									type="radio" name="gender" value="male" />male
							</p>
							<p>
								<label for="birthday">Birthday</label> <input type="text"
									name="birthday" required onClick="WdatePicker()"
									placeholder="e.g. 1970-01-01">
							</p>
							<p>
								<label for="address">Address</label> <select name="address" id="select1">
									<option value="Jiangsu">Jiangsu</option>
									<option value="Beijing">Beijing</option>
									<option value="Shanghai">Shanghai</option>
									<option value="Chongqing">Chongqing</option>
									<option value="Tianjin">Tianjin</option>
									<option value="Other">Other</option>
								</select>
							</p>
							<p class="signin button">
								<input type="submit" value="Register" />
							</p>
							<p class="change_link">
								Have an account? <a href="#tologin" class="to_register">
									Login </a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>