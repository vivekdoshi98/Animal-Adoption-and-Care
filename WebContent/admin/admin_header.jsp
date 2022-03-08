<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Animal Adoption and Care- An Admin Panel</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Esteem Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/export.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/flipclock.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/circles.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style_grid.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
</head>
<body>
<div class="wthree_agile_admin_info">
		  <!-- /w3_agileits_top_nav-->
		  <!-- /nav-->
		  <div class="w3_agileits_top_nav">
			<ul id="gn-menu" class="gn-menu-main">
			  		 <!-- /nav_agile_w3l -->
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><i class="fa fa-bars" aria-hidden="true"></i><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller scrollbar1">
							<ul class="gn-menu agile_menu_drop">
								<li><a href="main-page.html"> <i class="fa fa-tachometer"></i> Dashboard</a></li>
								<li>
									<a href="middle_manage_users.jsp"><i class="fa fa-cogs" aria-hidden="true"></i>Manage <i class="fa fa-angle-down" aria-hidden="true"></i></a> 
									<ul class="gn-submenu">
										<!--  <li class="mini_list_agile"><a href="buttons.html"><i class="fa fa-caret-right" aria-hidden="true"></i> Buttons</a></li>
										<li class="mini_list_w3"><a href="grids.html"> <i class="fa fa-caret-right" aria-hidden="true"></i> Grids</a></li>-->
										<li class="mini_list_w3"><a href="show_pets.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Pets</a></li>
										<li class="mini_list_w3"><a href="show_admin.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Admins</a></li>
										<li class="mini_list_w3"><a href="show_vet.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Vet Attendant</a></li>
										<li class="mini_list_w3"><a href="clinic_details.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Clinics</a></li>
										
									</ul>
								</li>
								<li>
								<a href="middle_appointments.jsp"><i class="fa fa-calendar" aria-hidden="true"></i>Appointments<i class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul class="gn-submenu">
								<li class="mini_list_w3"><a href="show_adoptions.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Adoption</a></li>
								<li class="mini_list_w3"><a href="show_admissions.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Admission</a></li>
								<li class="mini_list_w3"><a href="#"> <i class="fa fa-caret-right" aria-hidden="true"></i>Non-Financial donation</a></li>
								</ul>
								</li>
								<li>
								<a href="middle_donation.jsp"><i class="fa fa-money" aria-hidden="true"></i>Donations<i class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul class="gn-submenu">
								<li class="mini_list_w3"><a href="show_fin_donation.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Financial</a></li>
								<li class="mini_list_w3"><a href="show_nonfin_donation.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Non-Financial</a></li>
								</ul>
								</li>
								<li>
								<a href="middle_reports.jsp"><i class="fa fa-file" aria-hidden="true"></i>Reports<i class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul class="gn-submenu">
								<li class="mini_list_w3"><a href="report_admission.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Adoption Report</a></li>
								<li class="mini_list_w3"><a href="report_adoptions.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Admission Report</a></li>
								<li class="mini_list_w3"><a href="report_donation.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Donation Report</a></li>
								<li class="mini_list_w3"><a href="report_pet.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Pet Report</a></li>
								<li class="mini_list_w3"><a href="report_clinics.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Clinic Report</a></li>
								
								</ul>
								</li>
								<li>
								<a href="middle_queries.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Queries<i class="fa fa-angle-down" aria-hidden="true"></i></a>
								<ul class="gn-submenu">
								<li class="mini_list_w3"><a href="#"> <i class="fa fa-caret-right" aria-hidden="true"></i>Healthcare Related </a></li>
								<li class="mini_list_w3"><a href="show_query.jsp"> <i class="fa fa-caret-right" aria-hidden="true"></i>Non-Healthcare Related</a></li>
								</ul>
								</li>
								<li><a href="show_feedback.jsp"> <i class="fa fa-comments"></i>Feedback</a></li>
								
								
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<!-- //nav_agile_w3l -->
				<li class="second logo"><h1><a href="main-page.jsp"><i class="fa fa-graduation-cap" aria-hidden="true"></i>AAC</a></h1></li>
					<li class="second admin-pic">
				       <ul class="top_dp_agile">
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/aac_logo_t1.jpg" style="width:60px" height="50px" alt=""> </span> 
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="edit_profile.jsp"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
									
						</ul>
				</li>
				<li class="second w3l_search" style="float:right ; padding:10px">
				 
						<!-- <form action="#" method="post">
							<input type="search" name="search" placeholder="Search here..." required="" size="40">
							<button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
						</form> -->
					
				</li>
				

			</ul>
			<!-- //nav -->
			
		</div>
		
	</div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

	<!-- /amcharts -->
				<script src="js/amcharts.js"></script>
		       <script src="js/serial.js"></script>
				<script src="js/export.js"></script>	
				<script src="js/light.js"></script>
				<!-- Chart code -->
	 

		
		<script src="js/modernizr.custom.js"></script>
		
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
			
	
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
		<script src="js/flipclock.js"></script>
	
	<script type="text/javascript">
		var clock;
		
		$(document).ready(function() {
			
			clock = $('.clock').FlipClock({
		        clockFace: 'HourlyCounter'
		    });
		});
	</script>
<script src="js/bars.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>

<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

</body>
</html>