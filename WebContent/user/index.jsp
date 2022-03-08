<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Animal Adoption and Care</title>
<jsp:include page="home_links.jsp"></jsp:include>
<!-- //web-fonts -->
</head>
<style type="text/css">
.agileits-banner {
	 background: url(../user/images/a.jpg)no-repeat center 0px;
	 }
</style>
<body>
	
	<div class="agileits-banner">

		<jsp:include page="header1.jsp">
			<jsp:param value="index" name="page" />

		</jsp:include>

	</div>
		<!-- //welcome -->
	<!-- /services -->
	<div class="agile_secives " id="services">
		<div class="container">
			<h3 class="agileits-title two">What we Do</h3>
			<div class="markets-grids">
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-eye" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Adoption</h5>
							<p>Ease in adopting a pet.Take home your desired pet.<br/><br/></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-ambulance" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Admission</h5>
							<p>Ease in admitting a pet. Any pet needing a shelter can be admitted.</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-medkit" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Clinic Search</h5>
							<p>Locate clinic near you.<br/><br/><br/></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-flask" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Pet Daycare</h5>
							<p>Leave your pet and worries here with us.<br/><br/></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-line-chart" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Veterinary Help</h5>
							<p>Our vet will attend to your pet.Also you can post any query which will be solved.</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 w3ls-markets-grid">
					<div class="agileits-icon-grid">
						<div class="icon-left">
							<i class="fa fa-clock-o" aria-hidden="true"></i>
						</div>
						<div class="icon-right">
							<h5>Notify you</h5>
							<p>Notify the availability of your desired pet for adopton.<br/><br/></p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //services -->

	<!-- about -->
	<!--  
	<div class="services">
		<div class="container">
			<h3 class="agileits-title">Need More Services?</h3>
			<div class="top_tabs_agile">
				<div id="horizontalTab" class="top_tabs_agile">
					<ul class="resp-tabs-list">
						<li>
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>Dog Health Care
						</li>
						<li>
							<i class="fa fa-random" aria-hidden="true"></i> Pet Vaccinations
						</li>
						<li>
							<i class="fa fa-cogs" aria-hidden="true"></i> Support Adoption
						</li>
						<li>
							<i class="fa fa-shield" aria-hidden="true"></i>Pet Barber Service
						</li>
					</ul>
					<div class="resp-tabs-container">
						<div class="tab1">
							<div class="services-right-agileits">
								<h4>Dog Health Care</h4>
								<p class="para-agileits-w3layouts">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis suscipit et dui ut cursus. Ut tortor nisi, congue quis
									orci at, posuere mattis est. Nunc sollicitudin nisi lorem, eget aliquet leo scelerisque eu. Cras placerat, ligula
									nec bibendum aliquam, nibh massa venenatis leo, at convallis sem est a sapien.consectetur adipiscing elit</p>
								<a href="single.html" class="button button-isi"><span>Read More </span><i class="icon glyphicon glyphicon-arrow-right"></i></a>
							</div>
						</div>

						<div class="tab2">
							<div class="services-right-agileits bar-grids bargrids-left">
								<h4>Pet Vaccinations </h4>
								<h6>Vaccination 1 <span> 80% </span></h6>
								<div class="progress">
									<div class="progress-bar progress-bar-striped active" style="width: 80%">
									</div>
								</div>
								<h6>Vaccination 2 <span> 70% </span></h6>
								<div class="progress  w3-agile">
									<div class="progress-bar progress-bar-striped active" style="width: 70%">
									</div>
								</div>
								<h6>Vaccination 3<span>90% </span></h6>
								<div class="progress  w3-agile">
									<div class="progress-bar progress-bar-striped active" style="width: 90%">
									</div>
								</div>
								<h6>Vaccination 4<span> 75% </span></h6>
								<div class="progress  w3-agile prgs-w3agile-last">
									<div class="progress-bar progress-bar-striped active" style="width: 75%">
									</div>
								</div>
							</div>

						</div>
						<div class="tab3">
							<div class="services-right-agileits img-top">
								<h4>Support Adoption</h4>
								<p class="para-agileits-w3layouts">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis suscipit et dui ut cursus. Ut tortor nisi, congue quis
									orci at, posuere mattis est. Nunc sollicitudin nisi lorem, eget aliquet leo scelerisque eu. Cras placerat, ligula
									nec bibendum aliquam, nibh massa venenatis leo, at convallis sem est a sapien.consectetur adipiscing elit</p>
								<a href="single.html" class="button button-isi"><span>Read More </span> <i class="icon glyphicon glyphicon-arrow-right"></i></a>
							</div>
						</div>
						<div class="tab4">
							<div class="services-right-agileits">
								<h4>Pet Barber Service</h4>
								<p class="para-agileits-w3layouts">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis suscipit et dui ut cursus. Ut tortor nisi, congue quis
									orci at, posuere mattis est. Nunc sollicitudin nisi lorem, eget aliquet leo scelerisque eu. Cras placerat, ligula
									nec bibendum aliquam, nibh massa venenatis leo, at convallis sem est a sapien.consectetur adipiscing elit</p>
								<a href="single.html" class="button button-isi"><span>Read More </span> <i class="icon glyphicon glyphicon-arrow-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>-->
	<!-- //services -->
	<!-- w3-agilesale -->
	<div class="w3-agilesale welcome">
		<div class="container">
			<h3 class="agileits-title two">
				Pet Adoption. Be Part of Something <span>Beautiful!</span>
			</h3>
			<a href="contact.html" class="button button-isi"><span>Contact
					Us </span><i class="icon glyphicon glyphicon-arrow-right"></i></a>
		</div>
	</div>
	<div class="copy-w3right">
		<div class="container">
			<div class="top-nav bottom-w3lnav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="gallery.jsp">Gallery</a></li>
					<li><a href="icons.html">Icons</a></li>
					<li><a href="typo.html">Typography</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</div>
			<!--  	<p>© 2017 Pets Care. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p> -->
		</div>
	</div>


	<jsp:include page="home_scripts.jsp"></jsp:include>

	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>




</body>
</html>