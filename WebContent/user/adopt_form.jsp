<%@page import="dao.CityDao"%>
<%@page import="bean.CityBean"%>
<%@page import="bean.PetCategory_Bean"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adoption Form</title>


<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
  <style type="text/css">
  .form-group input,select
  {
  	float:left;
  	font-size:1em !important;
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
  	color:white !important;
  	font-size: 18px;
  	
  }
  
.agileits-banner {
	 background: url(../images/adopt_cover1.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
  </style>
  <script type="text/javascript">
  function category_change()
  {
  	$('#breed').find('option').remove().end();
      //.append('<option value="whatever">text</option>')
      //.val('whatever')

  	//document.write("yup");
  	var val=$("#category_drop").val();
  	 
  	 var xhttp = new XMLHttpRequest();
  	
  	  $.ajax({
  			url : '../AjaxCategory',
  			data : {
  				category : val
  			},
  			success : function(text) {
  				//document.write(text);
  				//$('#ajaxGetUserServletResponse').text(responseText);
  				 var list = text.split(":");
  				
  				 for(var i=0; i< list.length;i++)
  	        	 {
  					 var str = list[i].split(",");
  					
  				 			jQuery('<option/>', {
          	         		value: str[0], // <option value="list[i]"> list[i] </option>
          	         		html: str[1]
          	         		}).appendTo('#breed'); //appends to select if parent div has id dropdown
  						 
  				}
  					 
  			}
  		
  			
  		}); 
  }

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
				<h2 style="color: #FF5722; font-size:5em;">Adoption Form</h2>
<div class="tab-content" >
					<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="adoptionForm" action="../InsertAdoption">
						<div class="form-group">
								<div class="col-sm-10">
							
							
							
							<div class="form-group">
								<label  class="col-sm-4 control-label">Pet</label>
								<div class="col-sm-6">
									<input type="text" class="form-control1" id="petName" placeholder="pet Name" value="<%=request.getParameter("petName") %>">
								</div>
								
								</div>
							<input type="hidden" name="selectedPetId" value='<%=request.getParameter("selectedPetId") %>'/>
							<% ArrayList<PetCategory_Bean> categories = new CategoryDao().getCategories(); %>
							  <div class="form-group"> 
								<label  class="col-sm-4 control-label">Category</label>
								<div class="col-sm-6">
								<select id="category_drop" class="form-control1" onchange="category_change()">
									<option ><%=request.getParameter("category")%>
									</option>
									
								</select></div>
								
								 
					 	</div>
							
						<div class="form-group">  
						
								<label  class="col-sm-4 control-label">Breed</label>
								<div class="col-sm-6"><select id="breed" class="form-control1">
									<option ><%=request.getParameter("breed") %></option>
								
								</select></div>
						</div>
							
							
						<div class="form-group">
								<label  class="col-sm-4 control-label">Appointment Date</label>
           						<div  class="col-sm-6" id="date_container"> 
           						<input type="text" id="datepicker1" name="adoption_date"/>
           						<br/>
           						<!-- <button type="button" id="date_check"> Check availability</button> -->
           						<p class="help-block" id="date_err" style="color:red;font-weight:bold"><b></b></p>
           						</div>
           				</div>
           					
           				<div class="form-group">
           						<label  class="col-sm-4 control-label">Appointment Time</label>
           						<div class="col-sm-6" >
           							<select id="breed" class="form-control1" name="appointment_time">
									<option>--Select Time--</option>
									<option> 11:00 AM </option>
									<option> 12:00 PM </option>
								
								</select>
           						</div>
           						
  						</div>
  						<br/><br/>
  				<h3 style="color: #FF5722; font-size:3em;"> Please Fill Additional Personal Details</h3>
           			<div class="form-group">
							<label  class="col-sm-4 control-label">Address Line 1</label>
								<div class="col-sm-6">
									<input type="text" name="address_Line1" class="form-control1" id="add_line1" placeholder="Street"> <span class="err_msg" id="add1_err"> </span>
									
								</div>
								
					</div>
				
					<div class="form-group">
							<label  class="col-sm-4 control-label">Address Line 2</label>
								<div class="col-sm-6">
									<input type="text"  name="address_Line2" class="form-control1" id="add_line2" placeholder="Area"> <span class="err_msg" id="add2_err"> </span>
								</div>
								
					</div>
					 <div class="form-group"> 
								<label  class="col-sm-4 control-label">City</label>
								<div class="col-sm-6">
								<select id="city" class="form-control1" onchange="state_change()">
									<option>----SELECT----</option>
									<% ArrayList<CityBean> cityList = new CityDao().getCities(); 
																		for (int i=0;i<cityList.size();i++)
																		{
																	%>
																	
																	<option value=<%=cityList.get(i).getCity_id()%>> <%=cityList.get(i).getCity_Name()%> </option>
																	
																
																<%} %>
									
								</select><span class="err_msg" id="city_err"> </span></div>
								
								 
					 </div>
					  <div class="form-group"> 
								<label  class="col-sm-4 control-label">Area</label>
								<div class="col-sm-6">
								<select id="area" class="form-control1" name="area_id">
									<option>----SELECT----</option>
									
								</select><span class="err_msg" id="area_err"> </span></div>
								
								 
					 </div>
					 
					 <div class="form-group"> 
								<label  class="col-sm-4 control-label">Pin Code</label>
								<div class="col-sm-6">
									<input type="text" name="pincode" class="form-control1" id="pin" placeholder="6-Digit Pin Code"> <span class="err_msg" id="pin_err"> </span>
								</div>
								
								
								 
					 </div>
					 
					  <div class="form-group"> 
								<label  class="col-sm-4 control-label">Pan Number</label>
								<div class="col-sm-6">
									<input type="text" name="pan_number" class="form-control1" id="pan" placeholder="10-Digit Pan Number"> <span class="err_msg" id="pan_err"> </span>
								</div>
								<div class="col-sm-2">
									<p style="color: #FF5722;
  									   font: bold 14px arial;"> 
  									   	For Income Tax Benefits 
  								 	</p>
								</div>
								
								 
					 </div>
  					<div class="form-group">
  							<div class="list-group col-sm-4"></div>
  								<div class="list-group col-sm-4" >
  									<button type="Submit" class="form-control1 list-group-item list-group-item-action active"
  											style="background-color:#FF5722;
  											font-family: sans-serif;
  											margin-top: 20px;
  												font-size: 18px;">
  										SUBMIT
  									</button>
  								</div>
  							</div>
  						</div>
					<div class="col-sm-2"> <img src="<%=request.getParameter("imgsrc")%>"/></div>
  							
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

	
	$("#datepicker1").change(function(){
		$("#date_err").hide();
		$("#date_err").html("");
		var dateString = $("#datepicker1").datepicker( "getDate" );
		//document.write(dateString);
		 var myDate = new Date(dateString);
		 
	        var today = new Date();
	     	//document.write(myDate + " ------ " + today);   
	        if ( myDate < today ) 
	        { 
	           	$("#date_err").html("Don't Enter a date in the Past!")
	        	$("#date_err").show();
	        }
	       });
	$("#add_line1").focusout(function(){
		var add1=$("#add_line1").val().length;
		if(add1 == 0)
		{
			$("#add1_err").html("Please enter Address line 1");
			$("#add1_err").show();
			
		}
		else
		{ 
			$("#add1_err").hide();
		}
	});
	
	$("#add_line2").focusout(function(){
		var add2=$("#add_line2").val().length;
		if(add2 == 0)
		{
			$("#add2_err").html("Please enter Address line 2");
			$("#add2_err").show();
			
		}
		else
		{ 
			$("#add2_err").hide();
		}
	});
	$("#pan").focusout(function(){
		var p=$("#pan").val();
		//var pinlen=$("#cl_pincode").val().length;
		var pat1=/^\d{10}$/;
		if(!pat1.test(p))
		{
			$("#pan_err").html("Enter valid pan number");
			$("#pan_err").show();
		}
		else
		{ 
			$("#pan_err").hide();
		}
	});
	$("#pin").focusout(function(){
		var p=$("#pin").val();
		//var pinlen=$("#cl_pincode").val().length;
		var pat1=/^\d{6}$/;
		if(!pat1.test(p))
		{
			$("#pin_err").html("Enter valid pin code");
			$("#pin_err").show();
		}
		else
		{ 
			$("#pin_err").hide();
		}
	});
	
	$("#city").focusout(function(){
		var status=$("#city").val();
		
		if(status == "----SELECT----")
		{
			$("#city_err").html("Please choose a State");
			$("#city_err").show();
			//p_state=false;
		}
		else
		{ 
			$("#city_err").hide();
			//p_status=true;
		}
	});
	
	$("#area").focusout(function(){
		var status=$("#area").val();
		
		if(status == "----SELECT----")
		{
			$("#area_err").html("Please choose a city");
			$("#area_err").show();
			//p_state=false;
		}
		else
		{ 
			$("#area_err").hide();
			//p_status=true;
		}
	});
});

</script>
				
</body>
</html>