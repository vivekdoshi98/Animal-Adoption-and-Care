<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="home_links.jsp"></jsp:include>
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
	else if (page=="logout")
		{
		$("#heading").html("See you Soon Human");
		}
	else if (page=="clinics")
		{
		document.getElementById("clinics").className="active"
		}
	else if (page=="Services")
	{
	document.getElementById("Services").className="active"
	}
	else if (page=="Contact")
	{
	document.getElementById("Contact").className="active"
	}
	});
	
	
	 
	</script>
	
	<jsp:include page="home_links.jsp"></jsp:include>
</head>

<body>
<% String popup ="";
			popup= request.getParameter("popupsignup"); 
				
	String popupSignIn="";
		popupSignIn= request.getParameter("err");
%>

<script>
<% if (popupSignIn!=null){ 
	%>
					$(window).on('load',function(){
					
					$('#myModal2').modal('show'); 
					$("#cred_err").show();
					$("#cred_err").html(" Invalid Email or Password");
					});
					<%}
else{ %>
$("#cred_err").hide();
$("#cred_err").html("");
	
<%}
	%>

	<% if (popup!=null){ 
		if (popup.equals("yes")) { %>
						$(window).on('load',function(){
						
						$('#myModal3').modal('show'); 
						});
						<%}}%>
	</script>

	<!-- banner -->
	<!-- <div class="agileits-banner"> -->
		<div class="bnr-agileinfo">
			<div class="banner-top w3layouts">
				<div class="container">
					<ul class="agile_top_section">
						<li style="width:24%">
							<p> A A C</p>
						</li>
						<li style="width:30%">
							<p><span class="glyphicon glyphicon-envelope"></span> aac.shelter@gmail.com </p>
						</li>
						<%
							String name = (String)session.getAttribute("isLoggedIn");
							
						%>
						<% if(name == null) { %>
						<li><a class="sign" href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a></li>
						<% }
						else
						{
							name=name.substring(0,name.indexOf('@'));
						%>
							<li style="text-align:right; width:24%"><a class="sign" href="myProfile.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> <%= name%></a></li>
							<li style="text-align:right; width:20%"><a class="sign" href="../LogoutServlet"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
							<%} %>					
					</ul>
				</div>
			</div>
			<div class="banner-w3text w3layouts">
				
				<!-- <h3><p class="w3_text">Dog Cat Pet Care </p></h3> -->
				
						
					
				
				<h2 class="w3ls_agile" id="heading">Animal Adoption and Care</h2>
				
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
								<li><a href="index.jsp" id="home" class="">Home</a></li>
								<li><a href="about.jsp" id="about" class="">About</a></li>
								<li><a href="gallery.jsp" id="gallery" class="">Gallery</a></li>
								
								<!-- <li><a href="Search.jsp" id="search" class="">Search</a></li> -->
								<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="Services"><span data-letters="Services">Services</span><span class="caret"></span></a>
									<ul class="dropdown-menu">
										
										<li><a href="adopt.jsp" id="adopt" class="">Adopt</a></li>
										<li><a href="admit_form.jsp" id="admit" class="">Admit a Pet</a></li>
										<li><a href="Financial_donation.jsp" id="admit" class="">Donate Funds</a></li>
										<li><a href="Non_financial_donation.jsp" id="admit" class="">Donate</a></li>
									</ul>
								</li>
								<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="Contact"><span data-letters="Services">Contact</span><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="contact.jsp" id="contact">Our Contact Details</a></li>
										<li><a href="user_query.jsp" id="query">Submit Queries</a></li>
										<li><a href="Feedback.jsp" id="feedback">Send Feedback</a></li>
										
										
									</ul>
								</li>
								<li><a href="view_clinics.jsp" id="clinics" class="">Clinics</a></li>
								
							</ul>
						</div>
						<!--  <div class="w3ls-bnr-icons social-icon navbar-right">
							<a href="#" class="social-button twitter"><i class="fa fa-twitter"></i></a>
							<a href="#" class="social-button facebook"><i class="fa fa-facebook"></i></a>
							<a href="#" class="social-button google"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="social-button dribbble"><i class="fa fa-dribbble"></i></a>
						</div> -->
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //navigation -->
		</div>

<!-- ------------------------------SIGN IN POPUP ------------- -->

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
							<form action="../SignInUser" method="post">
								<input type="email" name="email" placeholder="E-mail" id="u_email" required=""> <span class="err_msg" id="email_err"> </span>
								<input type="password" name="password" placeholder="Password" required="">
								<br/>
								<span style="color:red; margin:auto" id="cred_err" > </span>
								<div class="tp">
								<h6> <a href="../ForgotPass.jsp"> Forgot Password..?</a></h6>
								</div>
								<div class="tp">
									<input type="submit" value="Sign In">
								</div>
							</form>
						</div>
					<!-- 	<div class="login-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div> -->
						<p><a href="#" data-toggle="modal" data-target="#myModal3"> Don't have an account?</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- --------------SIGNUP POPUP---------- -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
		<div class="modal-dialog">


			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Sign Up</h3>
						<div class="login-form">
							<form  method="get" id="regform">
								<!--  <input type="text" name="user_name" placeholder="Username" id="user_name" required=""/><span class="err_msg" id="user_err"> </span> -->
								
								
								
								<input type="text" name="first_Name" placeholder="fname" id="u_fname" required=""  /><span class="err_msg" id="fname_err"> </span> 
								
								<input type="text" name="last_Name" placeholder="lname" id="u_lname" required=""  /><span class="err_msg" id="lname_err"> </span>
								
								<input type="email" name="reg_email" placeholder="Email" id="reg_email" required="" /><span class="err_msg" id="reg_email_err" > </span>
								
								<input type="password" class="password" name="password" id="u_password1" placeholder="Password" required="" /><span class="err_msg" id="password1_err"> </span>
								
								<input type="password" class="password" name="confPassword" id="u_password2" placeholder="Confirm Password" required=""/><span class="err_msg" id="password2_err"> </span>
								
								<input type="text" name="contact" placeholder="Contact Number" required="false" > <br/>
								
								Gender: Male  <input type="radio" name="gender" value="M"> &nbsp; Female  <input type="radio" name="gender" value="F"/> <br>
								
								<input type="text" name="dob" placeholder="DOB: DD-MMM-YYYY">
								
								<input type="hidden" name="user_type_id" value="3"/> <br/>
								
								<input type="hidden" name="popupsignup" value="yes"/>
								
								<input type="submit" value="Sign Up" id="submitbutt">
							</form>
						</div>
						<p><a href="#"> Click Sign Up to be a part of the community</a></p>
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

			//var u_err = false;
			var u_fname = false;
			var u_lname = false;
			var u_email = false;
			var u_pass1 = false;
			var u_pass2 = false;
		
			$("#user_name").focusout(function(){
				alert("test");
				var user=$("#user_name").val().length;
				if(user < 5)
				{
					$("#user_err").html("Length should be atleast 5 characters");
					$("#user_err").show();
					$("#user_name").css("border-color","red");
					// u_err = false;
				}
				else
					{ $("#user_err").hide();}
				$("#user_name").css("border-color","black");
				// u_err = true;
			});
		
			$("#u_fname").focusout(function(){
				var fn=$("#u_fname").val().length;
				if(fn == 0)
				{
					$("#fname_err").html("Enter first name");
					$("#fname_err").show();
					$("#u_fname").css("border-color","red");
					 u_fname = false;
				}
				else
				{
					$("#fname_err").hide();
					$("#u_fname").css("border-color","black");
					 u_fname = true;
				}
			});
			$("#u_lname").focusout(function(){
				var ln=$("#u_lname").val().length;
				if(ln == 0)
				{
					$("#lname_err").html("Enter last name");
					$("#lname_err").show();
					$("#u_lname").css("border-color","red");
					 u_lname = false;
					
				}
				else
				{
					$("#lname_err").hide();
					$("#u_lname").css("border-color","black");
					 u_lname = true;
					
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
					 u_email = false;
					
				}
				else
				{
					$("#email_err").hide();
					$("#u_email").css("border-color","black");
					 u_email = true;
					
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
					 u_email = false;
					
				}
				else
				{
					$("#reg_email_err").hide();
					$("#reg_email").css("border-color","black");
					 u_email = true;
					 $.ajax({
							url : '../IsEmailRegistered',
							data : {
								email : em
							},
							success : function(text) {
								
								//$('#ajaxGetUserServletResponse').text(responseText);
								 var isAvailable = text;
								//document.write(isAvailable);
									if (isAvailable == "yes")
										{
											$("#reg_email_err").hide();
											$("#reg_email").css("border-color","black");
										}
									else
										{
										$("#reg_email_err").html("Email already Registered");
										$("#reg_email_err").show();
										$("#reg_email").css("border-color","red");
										u_email=true;
										}
							}
						
							
						});
					
				}
				
				 
				
				
			});

			$("#u_password1").focusout(function(){
				var p1=$("#u_password1").val().length;
				
				if(p1 < 8)
				{
					$("#password1_err").html("Password must contain 8 character");
					$("#password1_err").show();
					$("#u_password1").css("border-color","red");
					
					 u_pass1 = false;
				
				}
				else
				{
					$("#password1_err").hide();
					$("#u_password1").css("border-color","black");
					 u_pass1 = true;
					
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
					 u_pass2 = false;
				}
				else
				{
					$("#password2_err").hide();
					$("#u_password2").css("border-color","black");
					 u_pass2 = true;
				}
			});
			$("#submitbutt").click(function(){
				  
				 /* if( u_err == false ||
					 u_fname == false ||
					 u_lname == false  ||
					 u_email == false ||
					 u_pass1 == false ||
					 u_pass2 == false) 
					 {
					 alert("Form has errors");	
					 }*/
				 if (true)
					 {
					 	
					 	$("#regform").attr('action','../InsertUser');
					 	$("#regform").submit();
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