<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<title>Animal Adoption and Care</title>
	
	<!-- //web-fonts -->
	<script type="text/javascript">
	$(document).ready(function() {
	var page='${param.page}'
	if ( page=="index")
		{
			document.getElementById("home").className="active"
		}
	else if (page=="gallery")
		{
		document.getElementById("gallery").className="active"
		}
	else if (page=="about")
	{
	document.getElementById("about").className="active"
	}
	else if (page=="adopt")
	{
	document.getElementById("adopt").className="active"
	}
	else if (page=="search")
	{
	document.getElementById("search").className="active"
	}
	});
	
	</script>
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
						<li><a class="sign" href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a></li>
					</ul>
				</div>
			</div>
			<div class="banner-w3text w3layouts">
				
				<!-- <h3><p class="w3_text">Dog Cat Pet Care </p></h3> -->

				<h2 class="w3ls_agile">Animal Adoption and Care</h2>
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
						<h1><a href="index.jsp">Pets Care</a></h1>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<div class="w3menu navbar-left">
							<ul class="nav navbar">
								<li><a href="index.jsp" id="home" class="">Home</a></li>
								<li><a href="about.jsp" id="about" class="">About</a></li>
								<li><a href="gallery.jsp" id="gallery" class="">Gallery</a></li>
								
								<li><a href="Search.jsp" id="search" class="">Search</a></li>
								<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span data-letters="Services">Services</span><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="icons.html">Icons</a></li>
										<li><a href="typo.html">Typography</a></li>
										<li><a href="adopt.jsp" id="adopt" class="">Adopt</a></li>
									</ul>
								</li>
								<li><a href="contact.html" id="contact">Contact</a></li>
							</ul>
						</div>
						<div class="w3ls-bnr-icons social-icon navbar-right">
							<a href="#" class="social-button twitter"><i class="fa fa-twitter"></i></a>
							<a href="#" class="social-button facebook"><i class="fa fa-facebook"></i></a>
							<a href="#" class="social-button google"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="social-button dribbble"><i class="fa fa-dribbble"></i></a>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //navigation -->
		</div>

	<!-- //banner -->
	<!-- Modal1 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Sign In</h3>
						<div class="login-form">
							<form action="#" method="post">
								<input type="email" name="email" placeholder="E-mail" id="u_email" required=""> <span class="err_msg" id="email_err"> </span>
								<input type="password" name="password" placeholder="Password" required="">
								<div class="tp">
									<input type="submit" value="Sign In">
								</div>
							</form>
						</div>
						<div class="login-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
						<p><a href="#" data-toggle="modal" data-target="#myModal3"> Don't have an account?</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- Modal2 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
		<div class="modal-dialog">


			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Sign Up</h3>
						<div class="login-form">
							<form action="#" method="post" id="regform">
								<input type="text" name="user_name" placeholder="Username" id="user_name" required=""/><span class="err_msg" id="user_err"> </span>
								<input type="text" name="u_fname" placeholder="fname" id="u_fname" required=""/><span class="err_msg" id="fname_err"> </span> 
								<input type="text" name="u_lname" placeholder="lname" id="u_lname" required=""/><span class="err_msg" id="lname_err"> </span>
								<input type="email" name="reg_email" placeholder="Email" id="reg_email" required=""/><span class="err_msg" id="reg_email_err"> </span>
								<input type="password" class="password" name="Password" id="u_password1" placeholder="Password" required="" /><span class="err_msg" id="password1_err"> </span>
								<input type="password" class="password" name="Confirm Password" id="u_password2" placeholder="Confirm Password" required=""/><span class="err_msg" id="password2_err"> </span>
								<input type="submit" value="Sign Up" id="submitbutt">
							</form>
						</div>
						<p><a href="#"> By clicking register, I agree to your terms</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal2 -->

	<!-- welcome -->
	<script type="text/javascript">
		$(function(){
			$("#user_err").hide();
			$("#user_fname").hide();
			$("#user_lname").hide();
			$("#user_email").hide();
			//$("#reg_email").hide();
			$("#user_password1").hide();
			$("#user_password2").hide();

			var u_err = false;
			var u_fname = false;
			var u_lname = false;
			var u_email = false;
			var u_pass1 = false;
			var u_pass2 = false;
		
			$("#user_name").focusout(function(){
				//alert("test");
				var user=$("#user_name").val().length;
				if(user < 5)
				{
					$("#user_err").html("should be gr8er than 5");
					$("#user_err").show();
					$("#user_name").css("border-color","red");
				}
				else
					{ $("#user_err").hide();}
				$("#user_name").css("border-color","black");
			});
		
			$("#u_fname").focusout(function(){
				var fn=$("#u_fname").val().length;
				if(fn == 0)
				{
					$("#fname_err").html("Enter first name");
					$("#fname_err").show();
					$("#u_fname").css("border-color","red");
				}
				else
				{
					$("#fname_err").hide();
					$("#u_fname").css("border-color","black");
				}
			});
			$("#u_lname").focusout(function(){
				var ln=$("#u_lname").val().length;
				if(ln == 0)
				{
					$("#lname_err").html("Enter last name");
					$("#lname_err").show();
					$("#u_lname").css("border-color","red");
				}
				else
				{
					$("#lname_err").hide();
					$("#u_lname").css("border-color","black");
				}
			});

			
			$("#u_email").focusout(function(){
				var em=$("#u_email").val();
				var reg= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/
				if(reg.test(em) == false)
				{
					$("#email_err").html("Enter valid email address");
					$("#email_err").show();
					$("#u_email").css("border-color","red");
				}
				else
				{
					$("#email_err").hide();
					$("#u_email").css("border-color","black");
				}
			});

			$("#reg_email").focusout(function(){
				var em=$("#reg_email").val();
				var reg= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/
				if(reg.test(em) == false)
				{
					$("#reg_email_err").html("Enter valid email address");
					$("#reg_email_err").show();
					$("#reg_email").css("border-color","red");
				}
				else
				{
					$("#reg_email_err").hide();
					$("#reg_email").css("border-color","black");
				}
			});

			$("#u_password1").focusout(function(){
				var p1=$("#u_password1").val().length;
				
				if(p1 < 8)
				{
					$("#password1_err").html("Password must contain 8 character");
					$("#password1_err").show();
					$("#u_password1").css("border-color","red");
				}
				else
				{
					$("#password1_err").hide();
					$("#u_password1").css("border-color","black");
				}
			});

			$("#u_password2").focusout(function(){
				var p1=$("#u_password1").val();
				var p2=$("#u_password2").val();
				
				if(p1 != p2)
				{
					$("#password2_err").html("Password does not match");
					$("#password2_err").show();
					$("#u_password2").css("border-color","red");
				}
				else
				{
					$("#password2_err").hide();
					$("#u_password2").css("border-color","black");
				}
			});



		});
		
	
	
		
	</script>
	
	<!-- text-effect -->

	<!-- //copy right end here -->
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