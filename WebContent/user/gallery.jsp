<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title> Animals Category | Gallery </title>
	<jsp:include page="home_links.jsp"></jsp:include>
	<!-- //web-fonts -->
	<style type="text/css">
	
.agileits-banner {
	 background: url(../user/images/others.jpg)no-repeat center 0px;
	 background-position: 50%;
	 }
	</style>
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="gallery" name="page"/>
	</jsp:include>
</div>
	<!-- gallery -->
	
	<div class="gallery">
		<!-- <div class="sidenav">
	</div> -->
		<div class="container">
		
			<h3 class="agileits-title">Our Categories</h3>
			
			<div class="gallery-agileinfo">
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/pussy.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>CATS</h4>
						  
						</div>
					</a>
				</div>
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/goldy.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>DOGS</h4>
						  
						</div>
					</a>
				</div>
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/hamster.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>HAMSTERS</h4>
						 
						</div>
					</a>
				</div>
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/turtle.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>OTHERS</h4>
						 
						</div>
					</a>
				</div>
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/piggy.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>PIGS</h4>
						 
						</div>
					</a>
				</div>
				<div class="col-sm-4 col-xs-6 w3gallery-grids">
					<a href="" class="imghvr-hinge-right figure">
						<img src="images/birdie.jpg" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4>BIRDS</h4>
						 
						</div>
					</a>
				</div>
				
					
				<div class="clearfix"> </div>

			</div>
		</div>
	</div>

	
	<!-- //gallery -->
	<!-- subscribe -->
	<div class="subscribe wthree-sub">
		<div class="container">
			<h4>Subscribe Now</h4>
			<form action="#" method="post">
				<input type="email" name="email" placeholder="Enter your Email..." required="">
				<input type="submit" value="Subscribe">
				<div class="clearfix"> </div>
			</form>
			<div class="w3lsfoter-icons social-icon">
				<a href="#" class="social-button twitter"><i class="fa fa-twitter"></i></a>
				<a href="#" class="social-button facebook"><i class="fa fa-facebook"></i></a>
				<a href="#" class="social-button google"><i class="fa fa-google-plus"></i></a>
				<a href="#" class="social-button dribbble"><i class="fa fa-dribbble"></i></a>
			</div>
		</div>
	</div>
	<!-- //subscribe -->
	
	
<!-- copy rights start here -->
	<div class="copy-w3right">
		<div class="container">
			<div class="top-nav bottom-w3lnav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="gallery.jsp">Gallery</a></li>
					<li><a href="icons.html">Icons</a></li>
					<li><a href="typo.html">Typography</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		<!--  	<p>© 2017 Pets Care. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p> -->
		</div>
	</div>






<script src="js/SmoothScroll.min.js"></script>

	
	<!-- //copy right end here -->
	<!-- js 
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!-- password-script -->

	<!-- //password-script -->

	
	<!---->
	
	
	
	
	
	<!--  <script src="js/jquery.chocolat.js">
	<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen">
	</script>
	<!--light-box-files 
	<script type="text/javascript">
		$(function () {
			$('.w3gallery-grids a').Chocolat();
		});
	</script>-->
	<jsp:include page="home_scripts.jsp"></jsp:include>

</body>
</html>