<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
						<li class="current"><a href="index_w.jsp">Home</a></li>
						<li><a href="mplan.jsp?modify=1">MPlan</a></li>
						<li><a href="quesPro">Activity</a></li>
						<li><a href="allBookMoviesPro">Sale</a></li>
						<li><a href="query.jsp?query=0">Query</a></li>
						<li><a href="about_w.jsp">About</a></li>
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
									<strong class="font-1">Click</strong><strong class="font-2">MPlan</strong><strong
										class="font-1">to plan</strong><strong class="font-2">movie!</strong>
								</p>
								<a href="mplan.jsp?modify=1">Read More</a>
							</div></li>
						<li><img src="../images/activity.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Activity</strong><strong
										class="font-1">to add</strong><strong class="font-2">question!</strong>
								</p>
								<a href="quesPro">Read More</a>
							</div></li>
						<li><img src="../images/record.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Sale</strong><strong
										class="font-1">to sale</strong><strong class="font-2">tickets!</strong>
								</p>
								<a href="allBookMoviesPro">Read More</a>
							</div></li>
						<li><img src="../images/info.png" alt="">
							<div class="banner">
								<p>
									<strong class="font-1">Click</strong><strong class="font-2">Query</strong><strong
										class="font-1">to query</strong><strong class="font-2">member!</strong>
								</p>
								<a href="query.jsp?query=0">Read More</a>
							</div></li>
					</ul>
					<div class="pagination">
						<ul>
							<li><a href="mplan.jsp?modify=1"><img
									src="../images/ticket-small.png" alt=""></a></li>
							<li><a href="quesPro"><img
									src="../images/activity-small.png" alt=""></a></li>
							<li><a href="allBookMoviesPro"><img
									src="../images/record-small.png" alt=""></a></li>
							<li><a href="query.jsp?query=0"><img
									src="../images/info-small.png" alt=""></a></li>
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

						<h3>MPlan</h3>
						<p class="color-1">
							This module gives you a platform to make movie plan. You can
							click <a href="mplan.jsp?modify=1" class="link" target="_blank">here</a>
							to add, and wait for manager's approval.
						</p>
						<a href="mplan.jsp?modify=1" class="button">MPlan</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block-1">
						<h3>Activity</h3>
						<p class="color-1">
							This module gives you a platform to add activity questions. You
							can click <a href="quesPro" class="link" target="_blank">here</a>
							to add, and wait for member to answer.
						</p>
						<a href="quesPro" class="button">Records</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block-1">
						<h3>Query</h3>
						<p class="color-1">
							This module gives you a platform to query members' infos. You can
							click <a href="query.jsp?query=0" class="link" target="_blank">here</a>
							to query.
						</p>
						<a href="query.jsp?query=0" class="button">Query</a>
					</div>
				</div>
				<div class="grid_8">
					<div class="left-1 page1-col1">
						<h2 class="h2">Welcome to our Cineplex!</h2>
						<p class="color-1 p2">This Cineplex was foundes by Seni in
							2000. In 2010, the Cineplex adsorded Nanjing's No 2 theater.</p>
						<p>
							There are at least 5 Cineplex in Nanjing, with the number to grow
							in the comming year. And you can learn more about the Cineplex <a
								href="about_w.jsp" class="link" target="_blank">here</a> in the
							About module.
						</p>
						<div class="block-2 wrap">
							<a href="allBookMoviesPro">Tickets Sales</a>
							<p class="extra-wrap">
								Click here<strong>to sale</strong><strong>the tickets</strong><strong>Now!</strong>
							</p>
						</div>
						<p>
							This module gives you a platform to sale tickets. Just input the
							movie and sale. People can book by both card and cash if they
							want. You can sale conveniently <a href="allBookMoviesPro"
								class="link" target="_blank">here</a>. Thank you for your
							service. Enjoy your time!
						</p>
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