<%@page import="bean.CityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CityDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Register</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Esteem Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/snow.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style_grid.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">

<script>
	function state_change()
	{
		$('#area').find('option').remove().end();
	    //.append('<option value="whatever">text</option>')
	    //.val('whatever')
	
	//	document.write("yup");
		var val=$("#city").val();
		 
		 var xhttp = new XMLHttpRequest();
		
		  $.ajax({
				url : '../AjaxState',
				data : {
					city : val
				},
				success : function(text) {
					//document.write(text);
					//$('#ajaxGetUserServletResponse').text(responseText);
					 var list = text.split(":");
					 jQuery('<option/>', {
     	         		value: "0", // <option value="list[i]"> list[i] </option>
     	         		html: "Select Area"
     	         		}).appendTo('#area');
					 for(var i=0; i< list.length;i++)
		        	 {
						 var str = list[i].split(",");
						
						 
					 			jQuery('<option/>', {
	        	         		value: str[0], // <option value="list[i]"> list[i] </option>
	        	         		html: str[1]
	        	         		}).appendTo('#area'); //appends to select if parent div has id dropdown
							 
					}
						 
				}
			
				
			}); 
	}
	

	
		
	

</script>
<script type="text/javascript">
$(function(){
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
					}
		}
	
		
	}); 
	
	
});
});
</script>
<style>
.signin-form input[type="radio"]{
   width: 10%;
       padding: 0.8em 0.8em;
    font-size: 1em;
    margin: 1em 0;
    outline: none;
    color: #fdffb8;
    border: none;
    border: 1px solid #b9c0c3;
    letter-spacing: 1px;
    text-align: center;
    display: inline;
    font-weight: bold;
}
.signin-form input[type="email"], .signin-form input[type="text"], .signin-form input[type="password"], .signin-form input[type="tel"]{
	color:#fdffb8;
	font-weight: bold;
}
.signin-form select{
	background:none;
	color:#fdffb8;
	font-weight: bold;
}
.err_msg
{
color: red;
font-weight:bold;
}

</style>
</head>
<body >
			<!-- /pages_agile_info_w3l -->

						<div class="pages_agile_info_w3l" style="background: url(../images/pet1.jpg)no-repeat">
							<!-- /login -->
							   <div class="over_lay_agile_pages_w3ls two">
								<div class="registration">
								
												<div class="signin-form profile" style="width:100%; background:#0a0a0acc">
													<h2 style="color: white">Sign up Form</h2>
																							
															<div class="login-form">
													
																<form action="../InsertAdmin_Vet" method="post">
														<table style="width:100%;">
															<tr>
															<td style="width:50%; padding-right:20px">	
														<p>
															<input type="text" name="first_Name" placeholder="First Name"  id="fname">
															<span class="err_msg" id="fname_err"></span>
															
															<input type="text" name="last_Name" placeholder="Last Name" id="lname" required="false">
															<span class="err_msg" id="lname_err"></span>
															
															<input type="tel" name="contact" placeholder="Contact Number" id="contact" required="false">
															<span class="err_msg" id="contact_err"></span>
															
															<input type="email" name="email" placeholder="E-mail" required="false" id="reg_email">
																<span class="err_msg" id="reg_email_err"> </span>

															<input type="password" name="password" placeholder="Password" id="password" required="false">
															<span class="err_msg" id="pass1_err"></span>
															
															<input type="password" name="cpassword" placeholder="Confirm Password" id="cpassword" required="false">
															<span class="err_msg" id="pass2_err"></span>
															
														
														
																<p> <select name="city" id="city" onchange="state_change()">
																	<option value="select">---SELECT CITY----</option>
																	<% ArrayList<CityBean> cityList = new CityDao().getCities(); 
																		for (int i=0;i<cityList.size();i++)
																		{
																	%>
																	
																	<option value=<%=cityList.get(i).getCity_id()%>> <%=cityList.get(i).getCity_Name()%> </option>
																	
																
																<%} %>
																
																</select>
																<br/>
																<span class="err_msg" id="city_err"></span>
																</p>
														</td>
														
																<td style="width:50%; padding-top:0px;">
														<p>
																<select name="area_id" id="area">
																	<option>---Select Area-- </option>
																
																</select>
																<span class="err_msg" id="area_err"></span>
															<input type="text" name="address_line_1" id="adl1" placeholder="House Number / Plot no.">
															<span class="err_msg" id="adl1_err"></span>
															
															<input type="text" name="address_line_2" id="adl2" placeholder="Street">
															<span class="err_msg" id="adl2_err"></span>
															
															<input type="text" name="pincode" id="pincode" placeholder="pincode"/>
															<span class="err_msg" id="pin_err"></span>
															
															<span style="color:#fdffb8">Gender: &nbsp; &nbsp; &nbsp; Male </span><input type="radio" name="gender" value="M">  
															<span style="color:#fdffb8">Female</span>  <input type="radio" name="gender" value="F"/> <br>
															<input type="text" name="dob" placeholder="DOB: DD-MMM-YYYY">
															<input type="text" name="pan_Number" placeholder="PAN card number" id="pan">
															<span class="err_msg" id="pan_err"></span>
															
															</p>
															</td>
															</table>
															<input type="hidden" name="user_type_id" value="1"/>
															<div class="tp">
															<input type="hidden" name="user_type_id" value="<%=request.getParameter("type_id") %>"/>
																<input type="submit" value="SIGN Up">
															</div>
														
														</form>
														
													</div>
													
													
													 <h6><a href="main-page.jsp">Back To Home</a><h6>
												</div>
										</div>
										</div>
						</div>
							<!-- /login -->
<!-- //pages_agile_info_w3l -->


<!-- js -->

          <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
		  <script src="js/modernizr.custom.js"></script>
		
		   <script src="js/classie.js"></script>
		  <script src="js/gnmenu.js"></script>
		  <script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		 </script>
	
<!-- //js -->

<script src="js/screenfull.js"></script>
		<script>
		$(function () {
			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

			if (!screenfull.enabled) {
				return false;
			}

			

			$('#toggle').click(function () {
				screenfull.toggle($('#container')[0]);
			});	
		});
		</script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<script src="js/snow.js"></script>
 <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<script>
$(function(){
	fname_err=false;
	lname_err=false;
	con_err=false;
	email_err=false;
	pas1_err=false;
	pas2_err=false;
	adl1_err=false;
	adl2_err=false;
	pin_err=false;
	pan_err=false;
	
	
	$("#fname").focusout(function(){
		$("#fname_err").hide();
		var fname = $("#fname").val();
		if (fname == "")
			{
			 $("#fname_err").show();
			$("#fname_err").html("Please enter First Name");
			fname_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#fname_err").hide();
			fname_err=true;
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
								}
					}
				
					
				});
			
		}
		
		 
		
		
	});
	
	$("#lname").focusout(function(){
		$("#lname_err").hide();
		var lname = $("#lname").val();
		if (lname == "")
			{
			 $("#lname_err").show();
			$("#lname_err").html("Please enter last Name");
			lname_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#lname_err").hide();
			lname_err=true;
			}
		
		
	});
	$("#contact").focusout(function(){
		$("#contact_err").hide();
		var con = $("#contact").val();
		if (con == "")
			{
			 $("#contact_err").show();
			$("#contact_err").html("Please enter contact");
			con_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#contact_err").hide();
			con_err=true;
			}
		
		
	});
		
	$("#password").focusout(function(){
		$("#pass1_err").hide();
		var p1 = $("#password").val();
		if (p1 < 8)
			{
			 $("#pass1_err").show();
			$("#pass1_err").html("Password cannot be less than 8");
			pas1_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#pass1_err").hide();
			pas1_err=true;
			}
		
		
	});
	$("#cpassword").focusout(function(){
		$("#pass2_err").hide();
		var p1 = $("#password").val();
		var p2 = $("#cpassword").val();
		if (p1 != p2)
			{
			 $("#pass2_err").show();
			$("#pass2_err").html("Password do not match");
			pas2_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#pass2_err").hide();
			pas2_err=true;
			}
		
		
	});
	$("#adl1").focusout(function(){
		$("#adl1_err").hide();
		var fname = $("#adl1").val();
		if (fname == "")
			{
			 $("#adl1_err").show();
			$("#adl1_err").html("Please enter address line 1");
			adl1_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#adl1_err").hide();
			adl1_err=true;
			}
		
		
	});
	
	$("#adl2").focusout(function(){
		$("#adl2_err").hide();
		var fname = $("#adl2").val();
		if (fname == "")
			{
			 $("#adl2_err").show();
			$("#adl2_err").html("Please enter address line 2");
			adl2_err=false; 
		//	alert("asdasda");
			}
		else
			{
			$("#adl2_err").hide();
			adl2_err=true;
			}
		
		
	});
	$("#city").focusout(function(){
		$("#city_err").hide();
		var city = $("#city").prop('selectedIndex');
		if (city ==0 )
			{
			$("#city_err").show();
			$("#city_err").html("Please select a city");
			category_err=true;
			}
		else
			{
			category_err=false;
			}
		});
	$("#area").focusout(function(){
		$("#area_err").hide();
		var city = $("#area").prop('selectedIndex');
		if (city ==0 )
			{
			$("#area_err").show();
			$("#area_err").html("Please select an area");
			category_err=true;
			}
		else
			{
			category_err=false;
			}
		});
	
	
});

</script>



</body>
</html>