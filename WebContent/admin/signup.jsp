
    <!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Esteem  An Admin Panel Category Flat Bootstrap Responsive Website Template | Sign Up :: w3layouts</title>
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
		$('#city').find('option').remove().end();
	    //.append('<option value="whatever">text</option>')
	    //.val('whatever')
	
	//	document.write("yup");
		var val=$("#state").val();
		 
		 var xhttp = new XMLHttpRequest();
		
		  $.ajax({
				url : '../AjaxState',
				data : {
					state : val
				},
				success : function(text) {
					
					//$('#ajaxGetUserServletResponse').text(responseText);
					 var list = text.split(" ");
					
					 for(var i=0; i< list.length;i++)
		        	 {
						 
					 jQuery('<option/>', {
	        	         value: list[i], // <option value="list[i]"> list[i] </option>
	        	         html: list[i]
	        	         }).appendTo('#city'); //appends to select if parent div has id dropdown
	        	 }
				}
			
				
			}); 
	}
	

	
		/*xhttp.onreadystatechange=function()
		{
			
			if(xhttp.readyState==4 && xhttp.status==200)
				{*/ 
				
				/* $.ajax({ type: "GET",   
				     url: "/AjaxState?state="+val,   
				     success : function(text)
				     {
				         var list = text
				        // $.each(list, function(index, value) { 
				        	 for(var i=0; i< list.length;i++)
				        	 {
				        	 //creates option tag
				        	   jQuery('<option/>', {
				        	         value: list[i],
				        	         html: list[i]
				        	         }).appendTo('#city'); //appends to select if parent div has id dropdown
				        	 }
				         });
				         // This will show the values. Change "alert" for $('div#mydiv').html(value) or so
				     }
				}); */
			/*	}
			xhttp.open("GET","AjaxState?state=" + val,true);
			xhttp.send();
		}*/
	

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
</head>
<body>
			<!-- /pages_agile_info_w3l -->

						<div class="pages_agile_info_w3l">
							<!-- /login -->
							   <div class="over_lay_agile_pages_w3ls two">
								<div class="registration">
								
												<div class="signin-form profile">
													<h2>Sign up Form</h2>
													<div class="login-form">
														<form action="../AjaxState" method="post">
															<input type="text" name="First_Name" placeholder="First Name" required="false">
															<input type="text" name="Last_Name" placeholder="Last Name" required="false">
															<input type="tel" name="Contact" placeholder="Contact Number" required="false">
																<input type="email" name="email" placeholder="E-mail" required="false" id="reg_email">
																<span class="err_msg" id="reg_email_err"> </span>

																<input type="password" name="password" placeholder="Password" required="false">
																<input type="password" name="password" placeholder="Confirm Password" required="false">
																<p> State: <select id="state" onchange="state_change()">
																	<option value="select">---Select----</option>
																	<option value="Gujarat">Gujarat </option>
																	<option value="Maharashtra">Maharashtra</option>
																
																
																</select><br/>
																<p> City: <select id="city">
																	<option value="select">---Select-- </option>
																
																</select></p>
							
															<div class="tp">
																<input type="submit" value="SIGN Up">
															</div>
														</form>
													</div>
													
													<p><a href="#"> By clicking Sign Up, I agree to your terms</a></p>
													
													 <h6><a href="main-page.html">Back To Home</a><h6>
												</div>
										</div>
										<!--copy rights start here-->
											<div class="copyrights_agile two">
												 <p>© 2017 Esteem. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
											</div>	
											<!--copy rights end here-->
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