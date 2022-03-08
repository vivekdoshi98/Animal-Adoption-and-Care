<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Non-financial donations</title>


<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
  <style type="text/css">
  .form-group input,select
  {
  	float:left;
  }

  .form-group img
  {
  		height:300px;
  		width: 300px;
  		float: right;
  		border-radius:10px;
  		margin-right: 100px;
  }
  h2,h3
  {
  	color: #FF5722;
  	text-align: center;
  	font-size: 6em;
  		padding: 20px;

	letter-spacing: 5px;
  }
  label
  {
  	font-family: sans-serif;
  	color: rgb(255, 87, 34);
  	color: white !important;
  	font-size: 18px;
  	
  }
  
.agileits-banner {
	 background: url(../images/adopt_cover1.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
  </style>
<script type="text/javascript">
/*function state_change()
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
}*/
</script>
  </head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="Services" name="page"/>
</jsp:include>
</div> 
<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">
				<h2 style="color: #FF5722; font-size:5em;">Non-Financial Donation</h2>
<div class="tab-content" >
					<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="nonfin_form" >
						<div class="form-group">
								<div class="col-sm-10">
							<div class="form-group">
								<label  class="col-sm-4 control-label">Donation description</label>
								<div class="col-sm-4"><textarea name="donation_description" id="donation_description" cols="50" rows="4" class="form-control1"></textarea>
								<div class="col-sm-12"><span class="err_msg" id="desc_err"> </span></div>
								</div>
							</div>
						<div class="form-group">
								<label  class="col-sm-4 control-label">Appointment Date</label>
           						<div  class="col-sm-6" id="date_container"> 
           						<input type="text" id="datepicker1" name="appointment_date"/>
           						<br/>
           						<p class="help-block" id="date_err" style="color:red; font-weight:bold"><b></b></p>
           						</div>
           				</div>
           					
           				<div class="form-group">
           						<label  class="col-sm-4 control-label">Appointment Time</label>
           						<div class="col-sm-4" >
           							<select id="selected_time" class="form-control1" name="appointment_time">
									<option>--Select Time--</option>
									<option> 11:00 AM </option>
									<option> 12:00 PM </option>
									<option> 01:00 PM </option>
								
								</select>
           						</div>
           						
  							<span class="err_msg" id="time_err"> </span>
  						</div>
  						<div class="form-group">
  							<div class="list-group col-sm-4"></div>
  								<div class="list-group col-sm-4" >
  									<button type="Submit" class="form-control1 list-group-item list-group-item-action active"
  											style="background-color:#FF5722;
  											font-family: sans-serif;
  											margin-top: 20px;
  												font-size: 18px;
  												z-index: 0"
  												id="submit_btn">
  										Donate Now
  									</button>
  								</div>
  								</div>
  				           			
		
							
							
						</form>
					</div>
				</div>
		</div>
</div>
				 
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 							
<script>
$("#datepicker1").datepicker();
</script>
<script type="text/javascript">

$(function(){
$("#timestamps").find('button').click(function(){
		
		$("#selected_time").val($(this).html());
	});
});

$(function(){
	
	var err_date=false;
	var err_desc=false;
	var err_time=false;
	
	$("#datepicker1").change(function(){
		$("#date_err").hide();
		$("#date_err").html("");
		var dateString = $("#datepicker1").datepicker( "getDate" );
		//document.write(dateString);
		 var myDate = new Date(dateString);
		 
	        var today = new Date();
	     	//document.write(myDate + " ------ " + today);   
	        if ( myDate < today ) { 
	        	
	        	$("#date_err").html("Don't Enter a date in the Past!")
	        	$("#date_err").show();
	        	err_date=false;
	            
	        }
	        else
	        {
	        	$("#date_err").hide();
	        	err_date=true;
	        }
	      });
	$("#donation_description").focusout(function(){
		var desc=$("#donation_description").val().length;
		if(desc == 0)
		{
			$("#desc_err").html("Please enter the description");
			$("#desc_err").show();
			err_desc=false;
		}
		else
		{ 
			$("#desc_err").hide();
			err_desc=true;
		}
	});
	
	$("#selected_time").focusout(function(){
		var l=$("#selected_time").val.trim.length();
		if(l==0)
		{
			$("#time_err").html("Please select an appointment time");
			$("#time_err").show();
			err_time=false;
		}
		else
		{
			$("#time_err").hide();
			err_time=true;
		}
		
		 
	 });
	$("#submit_btn").click(function(){
		 if(err_date==true && err_desc==true) //&& err_time==true)
			 {
				$("#nonfin_form").attr('action','../InsertNonFinancialDonation');
			 	$("#nonfin_form").submit();			 
			 }
		 else
			 {
			
			 	alert("Form have error");
			 }
		  
	  }); 

});

</script>
				
</body>
</html>
