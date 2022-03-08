<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>About US</title>

<jsp:include page="home_links.jsp"></jsp:include>
<style type="text/css">
.agileits-banner {
	 background: url(../images/adopt_cover1.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
</style>

</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="about" name="page"/>
	</jsp:include>
</div>
<div class="about agileinfo">
		<div class="container">
			<h3 class="agileits-title">About Us</h3>
			<div class="markets-grids">
				<div class="col-md-6 about-w3left">
					<h4>Our Motive</h4>
					<p>In India, unlike other nations, there is little awareness regarding the process of pet adoption.
Thus no online system existed for animal adoption or donation.
Therefore the motto of our website is to make things easy for a person willing to search/adopt/donate an animal.
Our Website will provide a centralized destination for proceeding with adopting and admitting animals and also answer to queries regarding the health of pets.
</p>

					<!-- <a href="single.html" class="button button-isi"><span>Read More</span><i class="icon glyphicon glyphicon-arrow-right"></i></a>
				 --></div>
				<div class="col-md-6 about-w3right">
					<img src="../user/images/dog-wallpaper-3.jpg" alt="" />
				</div>
				<div class="clearfix"> </div>

			</div>
		</div>
	</div>
	<div class="w3-agilesale welcome">
		<div class="container">
			<h3 class="agileits-title two">Pet Adoption. Be Part of Something <span>Beautiful!</span></h3>
			<a href="contact.html" class="button button-isi"><span>Contact Us </span><i class="icon glyphicon glyphicon-arrow-right"></i></a>
		</div>
	</div>
	
	<jsp:include page="home_scripts.jsp"></jsp:include>
</body>
</html>