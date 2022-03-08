<%@page import="bean.UserBean"%>
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
		
	

</script>
<script type="text/javascript">

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
.signin-form td{
	margin: 2px solid #fdffb5; 
	padding:10px;
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
<% UserBean user = (UserBean) request.getSession().getAttribute("userObj"); %>
			<!-- /pages_agile_info_w3l -->

	<div class="pages_agile_info_w3l" style="background: url(../images/pet1.jpg)no-repeat">
							<!-- /login -->
		 <div class="over_lay_agile_pages_w3ls two">
			<div class="registration">
								
				<div class="signin-form profile" style="width:100%; background:#0a0a0acc">
					<h2 style="color: white">User Registered</h2>
																							
					<div class="login-form">
													
														
						<table style="width:100%;">
							<tr>
								<td style="width:50%">
									Username :
							 	</td>
								<td style="width:50%">
									<%=user.getFirst_Name() + " " + user.getLast_Name() %>
							 	</td>
							</tr>
							<tr>
								<td style="width:50%">
									Email :
							 	</td>
								<td style="width:50%">
									<%= user.getEmail() %>
							 	</td>
							</tr>
							<tr>
								<td style="width:50%">
									Address:
							 	</td>
								<td style="width:50%">
									<%=user.getAddress_Line1() + "\n" + user.getAddress_Line2() + "\n" %>
							 	</td>
							</tr>
							<tr>
								<td style="width:50%">
									Pan Number
							 	</td>
								<td style="width:50%">
									<%=user.getPan_number() %>
							 	</td>
							</tr>
							<tr>
								<td style="width:50%">
									User Type:
							 	</td>
								<td style="width:50%">
									<% if (Integer.parseInt(user.getUser_type_id()) == 1){  
											out.print("Admin");
									}
									else 
									{
										out.print("VET");
									}
									%>									
							 	</td>
							</tr>
															
						</table>											
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


</body>
</html>