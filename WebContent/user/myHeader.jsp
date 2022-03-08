<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="home_links.jsp"></jsp:include>
	<title>Animal Adoption and Care</title>
	
	<!-- //web-fonts -->
	<script type="text/javascript">
	
	$(document).ready(function() {
	var page='${param.page}'
	if ( page=="profile")
		{
			document.getElementById("profile").className="active"
		}
	else if (page=="donation")
		{
		document.getElementById("donation").className="active"
		}
	else if (page=="adoption")
	{
	document.getElementById("adoption").className="active"
	}
	else if (page=="admissions")
	{
	document.getElementById("admissions").className="active"
	}
	else if (page=="queries")
	{
	document.getElementById("queries").className="active"
	}
	});
	
	
	 
	</script>
	<jsp:include page="home_links.jsp"></jsp:include>
</head>

<body>
<!-- banner -->
	<!-- <div class="agileits-banner"> -->
		<div class="bnr-agileinfo">
			<div class="banner-top w3layouts">
				<div class="container">
					<ul class="agile_top_section">
						<li>
							<p> Pets Care Website !</p>
						</li>
						<li>
							<p><span class="glyphicon glyphicon-envelope"></span> aac.shelter@gmail.com </p>
						</li>
						
						<!-- <li><a class="sign" href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a></li> -->
						 <li> <a href="../LogoutServlet" class="sign"><i class="fa fa-sign-in" aria-hidden="true"></i> Logout </a></li>
									
					</ul>
				</div>
			</div>
			<div class="banner-w3text w3layouts">
				
				<!-- <h3><p class="w3_text">Dog Cat Pet Care </p></h3> -->

				<h2 class="w3ls_agile">My Profile</h2>
			</div>
			<!-- navigation -->
			<div class="top-nav w3-agiletop">
				<div class="agile_inner_nav_w3ls">
					<div class="navbar-header w3llogo">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="index.jsp"><img src="../images/aac_logo_t1.jpg" width="50px" height="50px" style="border-radius:50%"></a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<div class="w3menu navbar-left">
							<ul class="nav navbar">
								<li><a href="myProfile.jsp" id="profile" class="">Edit Profile</a></li>
								<li><a href="my_donations.jsp" id="donation" class="">Donations</a></li>
								<li><a href="my_adoptions.jsp" id="adoption" class="">Adoptions</a></li>
								
								<li><a href="my_admissions.jsp" id="admissions" class="">Admissions</a></li>
								<li><a href="my_queries.jsp" id="queries" class="">Queries</a></li>
								<li><a href="my_feedbacks.jsp" id="feedbacks" class="">Feedbacks</a></li>
								
								
							</ul>
						</div>
						
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //navigation -->
		</div>

	<!-- //banner -->
	<!-- Modal1 -->
	
	<script type="text/javascript" src="js/jquery.transit.js"></script>
	<script type="text/javascript" src="js/jquery.textFx.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.w3ls_agile').textFx({
				type: 'fadeIn',
				iChar: 100,
				iAnim: 1000
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.w3_text').textFx({
				type: 'fadeIn',
				iChar: 100,
				iAnim: 1000
			});
		});
	</script>
</body>
</html>