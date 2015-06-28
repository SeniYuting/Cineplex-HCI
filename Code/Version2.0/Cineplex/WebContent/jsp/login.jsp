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
<script>
	//验证邮箱
	function emailValidation() {
		var email = document.getElementById("emailsignup").value.trim();
		var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var emailNote = document.getElementById("emailNote");
		if (!emailRegex.test(email)) {
			emailNote.innerText = "Email Error!";
			emailNote.style.color = "#FF0000";
		} else {
			emailNote.innerText = "Looks Good!";
			emailNote.style.color = "#32CD32";
		}
	}
	//验证确认密码
	function confirmPwValidation() {
		var password = document.getElementById("passwordsignup").value.trim();
		var confirmPw = document.getElementById("passwordsignup_confirm").value
				.trim();
		var confirmPwNote = document.getElementById("pwdNote");
		if (confirmPw == "") {
			confirmPwNote.innerText = "Forget Password!";
			confirmPwNote.style.color = "#FF0000";
		} else if (confirmPw != password) {
			confirmPwNote.innerText = "Password Disagree!";
			confirmPwNote.style.color = "#FF0000";
		} else {
			confirmPwNote.innerText = "Password Agree!";
			confirmPwNote.style.color = "#32CD32";
		}
	}
	//用户名
	function nameRight() {
		var name = document.getElementById("usernamesignup").value.trim();
		var confirmNameNote = document.getElementById("nameNote");
		if (name == "") {
			confirmNameNote.innerText = "Forget Name!";
			confirmNameNote.style.color = "#FF0000";
		} else {
			confirmNameNote.innerText = "Nice to meet you!";
			confirmNameNote.style.color = "#32CD32";
		}
	}
	//密码
	function pwRight() {
		var password = document.getElementById("passwordsignup").value.trim();
		var confirmPasswordNote = document.getElementById("pNote");
		if (password == "") {
			confirmPasswordNote.innerText = "Forget Password!";
			confirmPasswordNote.style.color = "#FF0000";
		} else {
			confirmPasswordNote.innerText = "";
		}
	}
</script>
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
							<h1>Log in</h1>
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
								<input type="submit" value="Log in" />
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

							<script>
								alert('Register Success! Please Log in!');
								window.location.href = 'login.jsp';
							</script>
							<%
								}
							%>
							<p>
								<label for="emailsignup" class="youmail" data-icon="e">Account(Email)</label><label
									style="float: right;" id="emailNote"></label> <input
									id="emailsignup" name="account" required
									onblur="emailValidation();"
									placeholder="e.g. mysupermail@mail.com" type="email" />
							</p>
							<p>
								<label for="usernamesignup" class="uname" data-icon="u">Name</label><label
									style="float: right;" id="nameNote"></label> <input
									id="usernamesignup" name="name" required type="text"
									placeholder="e.g. mysuperusername690" onblur="nameRight();" />
							</p>
							<p>
								<label for="passwordsignup" class="youpasswd" data-icon="p">Password</label>
								<label style="float: right;" id="pNote"></label> <input
									id="passwordsignup" name="password" required type="password"
									placeholder="e.g. X8df!90EO" onblur="pwRight();" />
							</p>
							<p>
								<label for="passwordsignup_confirm" class="youpasswd"
									data-icon="p">Password Again</label> <label
									style="float: right;" id="pwdNote"></label><input
									id="passwordsignup_confirm" name="password2" required
									type="password" placeholder="e.g. X8df!90EO"
									onblur="confirmPwValidation();" />
							</p>
							<p>
								<label>Gender</label> <br> <input type="radio"
									name="gender" value="female" checked="checked"
									style="margin-left: 60px; margin-top: 15px;" />female <input
									type="radio" name="gender" value="male"
									style="margin-left: 60px; margin-top: 15px;" />male
							</p>
							<p>
								<label for="birthday">Birthday</label><label
									style="float: right;" id="birthNote"></label> <input
									type="text" name="birthday" required onFocus="WdatePicker()"
									placeholder="e.g. 1970-01-01">
							</p>
							<p>
								<label for="address">Address</label> <select name="address"
									id="select1">
									<option value="Anhui">Anhui</option>
									<option value="Aomen">Aomen</option>
									<option value="Beijing">Beijing</option>
									<option value="Chongqing">Chongqing</option>
									<option value="Fujian">Fujian</option>
									<option value="Gansu">Gansu</option>
									<option value="Guangdong">Guangdong</option>
									<option value="Guangxi">Guangxi</option>
									<option value="Guizhou">Guizhou</option>
									<option value="Hainan">Hainan</option>
									<option value="Hebei">Hebei</option>
									<option value="Henan">Henan</option>
									<option value="Heilongjiang">Heilongjiang</option>
									<option value="Hubei">Hunan</option>
									<option value="Hunan">Hubei</option>
									<option value="Jilin">Jilin</option>
									<option value="Jiangsu">Jiangsu</option>
									<option value="Jiangxi">Jiangxi</option>
									<option value="Liaoning">Liaoning</option>
									<option value="Neimenggu">Neimenggu</option>
									<option value="Ningxia">Ningxia</option>
									<option value="Qinghai">Qinghai</option>
									<option value="Shandong">Shandong</option>
									<option value="Shan(-)xi">Shan(-)xi</option>
									<option value="Shan(√)xi">Shan(√)xi</option>
									<option value="Shanghai">Shanghai</option>
									<option value="Sichuan">Sichuan</option>
									<option value="Taiwan">Taiwan</option>
									<option value="Tianjin">Tianjin</option>
									<option value="Xizang">Xizang</option>
									<option value="Xianggang">Xianggang</option>
									<option value="Xinjiang">Xinjiang</option>
									<option value="Yunnan">Yunnan</option>
									<option value="Zhejiang">Zhejiang</option>
								</select>
							</p>
							<p class="signin button">
								<input type="submit" value="Register" />
							</p>
							<p class="change_link">
								Have an account? <a href="#tologin" class="to_register"> Log
									in </a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>