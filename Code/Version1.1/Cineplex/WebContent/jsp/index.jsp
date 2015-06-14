<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ taglib prefix="MyTag" uri="/WEB-INF/tlds/checkSession.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/reset.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/style.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/grid_12.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/slider.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/tabs.css">
<script src="../js/jquery-1.7.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/tms-0.3.js"></script>
<script src="../js/tms_presets.js"></script>
<script src="../js/cufon-yui.js"></script>
<script src="../js/Vegur-L_300.font.js"></script>
<script src="../js/Vegur-M_500.font.js"></script>
<script src="../js/Vegur-R_400.font.js"></script>
<script src="../js/cufon-replace.js"></script>
<script src="../js/tabs.js"></script>
<script src="../js/FF-cash.js"></script>
<script>
	$(window).load(function() {
		$('.slider')._TMS({
			prevBu : '.prev',
			nextBu : '.next',
			pauseOnHover : true,
			pagNums : false,
			duration : 800,
			easing : 'easeOutQuad',
			preset : 'Fade',
			slideshow : 7000,
			pagination : '.pagination',
			waitBannerAnimation : false,
			banners : 'fromLeft'
		})
	})
</script>
</head>
<body>
	<%
		if (request.getParameter("nomember") != null
				&& request.getParameter("nomember").equals("1")) {
	%>
	<script>
		alert('Stop or Cancel Member!')
	</script>
	<%
		}
	%>
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
							href="logoutPro">Logout</a></li>
					</ul>
					<ul class="menu">
						<li class="current"><a href="index.jsp">Home</a></li>
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
				<div class="slider">
					<ul class="items">
						<li><img src="../images/ticket.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Tickets</strong><strong
										class="font-1">to pre-</strong><strong class="font-2">book!</strong>
								</p>
								<a href="allMoviesPro">Read More</a>
							</div></li>
						<li><img src="../images/activity.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Activities</strong><strong
										class="font-1">to</strong><strong class="font-2">attend!</strong>
								</p>
								<a href="activityArrangePro">Read More</a>
							</div></li>
						<li><img src="../images/activity.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Records</strong><strong
										class="font-1">to</strong><strong class="font-2">check!</strong>
								</p>
								<a href="recordPro">Read More</a>
							</div></li>
						<li><img src="../images/record.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Charge</strong><strong
										class="font-1">to charge</strong><strong class="font-2">account!</strong>
								</p>
								<a href="charge.jsp">Read More</a>
							</div></li>
					</ul>
					<div class="pagination">
						<ul>
							<li><a href="allMoviesPro"><img
									src="../images/ticket-small.png" alt=""></a></li>
							<li><a href="activityArrangePro"><img
									src="../images/activity-small.png" alt=""></a></li>
							<li><a href="recordPro"><img
									src="../images/activity-small.png" alt=""></a></li>
							<li><a href="infoPro?modify=1"><img
									src="../images/record-small.png" alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!--==============================content================================-->
		<section id="content" class="border">
			<div class="ic"></div>
			<div class="container_12">
				<div class="grid_4">
					<div class="block-1">

						<h3>Activities</h3>
						<p class="color-1">This module shows you all the cineplex
							activities. You can answer the questions here and earn credits if
							answer correctly. Just try!</p>
						<a href="activityArrangePro" class="button">Activities</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block-1">
						<h3>Records</h3>
						<p class="color-1">This module shows you all your consumption
							records and payment records. Check them here. And maybe you need
							a consumption planning.</p>
						<a href="recordPro" class="button">Records</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block-1">
						<h3>Charge</h3>
						<p class="color-1">This module can help you charge. And the
							bankcard and password has been given. Check them here and modify
							if necessary.</p>
						<a href="charge.jsp" class="button">Charge</a>
					</div>
				</div>
				<div class="grid_8">
					<div class="left-1 page1-col1">
						<h2 class="h2">Welcome to Cineplex!</h2>
						<p class="color-1 p2">This Cineplex was foundes by Seni in
							2000. In 2010, the Cineplex adsorded Nanjing's No 2 theater.</p>
						<p>There are at least 5 Cineplex in Nanjing, with the number
							to grow in the comming year. And you can learn more about the
							Cineplex here in the About module.</p>
						<div class="block-2 wrap">
							<a href="allMoviesPro">Tickets Book</a>
						</div>
						<p>The tickets module shows you all the now-playing and coming
							movies. The brief introduction, leading roles and playing time of
							them also included. You can Click to check and book. And if you
							feel satisfied about our cineplex, Please recommend to your
							friends. Thank you!</p>
						<div class="home-img"></div>
					</div>
				</div>
				<div class="grid_4">
					<h2 class="left-1">Notice</h2>
					<div class="tabs">
						<ul class="nav">
							<li class="selected"><a href="#tab-1">Latest</a></li>
							<li><a href="#tab-2">Long-term</a></li>
							<li><a href="#tab-3">Other</a></li>
						</ul>
						<div id="tab-1" class="tab-content">
							<div class="inner">
								<div class="wrap block-3 border-1">
									<img src="../db/images/home-img1.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="oneMoviePro?movie_name=Hobbit" class="link"
												target="_blank">Hobbit.</a> Consisting of three. Directed by
											Peter Jackson.
										</p>
										<p>Starring Ian McKellen and Martin Freeman. Rank No.1</p>
										<p class="color-2">
											<time datetime="2014-12-17">17-12-2014</time>
											<a href="oneMoviePro?movie_name=Hobbit" class="link">Read
												more</a>
										</p>
									</div>
								</div>
								<div class="wrap block-3">
									<img src="../db/images/home-img2.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="oneMoviePro?movie_name=Interstellar" class="link"
												target="_blank">Interstellar.</a> Directed by Christopher
											Nolan.
										</p>
										<p>Starring Matthew McConaughey and Anne Hathaway. Rank
											No.2</p>
										<p class="color-2">
											<time datetime="2014-11-07">07-11-2014</time>
											<a href="oneMoviePro?movie_name=Interstellar" class="link">Read
												more</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div id="tab-2" class="tab-content">
							<div class="inner">
								<div class="wrap block-3 border-1">
									<img src="../db/images/home-img3.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="#" class="link" target="_blank">Schindler's
												List.</a> Directed by Steven Spielberg in 1993.
										</p>
										<p>Starring Liam Neeson and Ben Kingsley. Rank No.1</p>
										<p class="color-2">
											<time datetime="1993-11-30">30-11-1993</time>
											<a href="#" class="link">Read more</a>
										</p>
									</div>
								</div>
								<div class="wrap block-3">
									<img src="../db/images/home-img4.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="#" class="link" target="_blank">Titanic.</a>
											Directed by James Cameron in 1997.
										</p>
										<p>Starring Leonardo DiCaprio and Kate Winslet. Rank No.1</p>
										<p class="color-2">
											<time datetime="1997-12-19">19-12-1997</time>
											<a href="#" class="link">Read more</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div id="tab-3" class="tab-content">
							<div class="inner">
								<div class="wrap block-3 border-1">
									<img src="../db/images/home-img5.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="#" class="link" target="_blank">Inception.</a>
											Directed by Christopher Nolan in 2010.
										</p>
										<p>Starring Leonardo DiCaprio and Ken Watanabe. Rank No.1</p>
										<p class="color-2">
											<time datetime="2010-07-08">08-07-2010</time>
											<a href="#" class="link">Read more</a>
										</p>
									</div>
								</div>
								<div class="wrap block-3">
									<img src="../db/images/home-img6.png" alt="" class="img-indent">
									<div class="extra-wrap">
										<p class="color-1">
											<a href="oneMoviePro?movie_name=Transformers" class="link"
												target="_blank">Transformers.</a> Directed by Michael Bay in
											2007.
										</p>
										<p>Starring Shia LaBeouf and Tyrese Gibson. Rank No.1</p>
										<p class="color-2">
											<time datetime="2007-07-03">03-07-2007</time>
											<a href="oneMoviePro?movie_name=Transformers" class="link">Read
												more</a>
										</p>
									</div>
								</div>
							</div>
						</div>
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