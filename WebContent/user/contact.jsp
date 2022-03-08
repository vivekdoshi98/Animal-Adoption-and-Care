<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact US</title>
<jsp:include page="home_links.jsp"></jsp:include>
	<!-- //web-fonts -->
	<style type="text/css">
	
.agileits-banner {
	 background: url(../user/images/g6.jpg)no-repeat center 0px;
	 background-position: 50%;
	 }
	</style>
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="contact" name="page"/>
	</jsp:include>
</div>

<div class="contact">
		<div class="container">
			<h3 class="agileits-title">Contact Us</h3>
			<div class="contact-agileinfo">
				<div class="col-md-7 contact-right">
					<form action="#" method="post">
						<input type="text" name="Name" placeholder="Name" required="">
						<input type="text" class="email" name="Email" placeholder="Email" required="">
						<input type="text" name="Phone no" placeholder="Phone" required="">
						<textarea name="Message" placeholder="Message" required=""></textarea>
						<input type="submit" value="SUBMIT">
					</form>
				</div>
				<div class="col-md-5 contact-left">
					<div class="address">
						<h5>Address:</h5>
						<p><i class="glyphicon glyphicon-home"></i> 333 Broome St New York, NY 10002, </p>
					</div>
					<div class="address address-mdl">
						<h5>Phones:</h5>
						<p><i class="glyphicon glyphicon-earphone"></i> +1 999 888 777</p>
						<p><i class="glyphicon glyphicon-phone"></i> +11 222 333</p>
					</div>
					<div class="address">
						<h5>Email:</h5>
						<p><i class="glyphicon glyphicon-envelope"></i> <a href="mailto:info@example.com">mail@example.com</a></p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="agileits-w3layouts-map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3023.9503398796587!2d-73.9940307!3d40.719109700000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a27e2f24131%3A0x64ffc98d24069f02!2sCANADA!5e0!3m2!1sen!2sin!4v1441710758555"
		    allowfullscreen></iframe>
	</div>
	<script src="js/SmoothScroll.min.js"></script>
	<jsp:include page="home_scripts.jsp"></jsp:include>
</body>
</html>