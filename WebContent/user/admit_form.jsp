<%@page import="bean.PetCategory_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Admission</title>
<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
  <style type="text/css">
  .form-group input,select
  {
  	float:left;
  }
 .form-group input[type=text] ,select,option{
	border: 1px solid #e0e0e0;
	padding: 5px 18px;
	color: #616161;
	background: #fff;
	box-shadow: none !important;
	width: 100%;
	font-size: 1em;
	font-weight: bold;
	height: 40px;
	border-radius: 0;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	-ms-border-radius: 0px;
	-o-border-radius: 0px;
	-webkit-appearance: none;
	outline: none;
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
  function category_change()
  {
  	$('#breed').find('option').remove().end();
      //.append('<option value="whatever">text</option>')
      //.val('whatever')

  	//document.write("yup");
  	var val=$("#pet_category").val();
  	 
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
  				jQuery('<option/>', {
  	         		value: "0", // <option value="list[i]"> list[i] </option>
  	         		html: "--Select Breed--",
  	         		}).appendTo('#breed');
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
				<h2 style="color: #FF5722; font-size:5em;">Admission Form</h2>
<div class="tab-content" >
					<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="admit_form" method="post" enctype="multipart/form-data">
						<div class="form-group">
								<div class="col-sm-10">
							
							
							
							<div class="form-group">
								<label  class="col-sm-4 control-label">Pet Name</label>
								<div class="col-sm-5">
									<input type="text" class="form-control1" id="pet_name" name="pet_name" placeholder="">
								</div>
								
								</div>
						
							<% ArrayList<PetCategory_Bean> cList = new CategoryDao().getCategories(); %>
							  <div class="form-group"> 
								<label  class="col-sm-4 control-label">Category</label>
								<div class="col-sm-5">
								<select id="pet_category" class="form-control1" name="pet_category" onchange="category_change()">
									<option>---Select Category---</option>
									<% for (int i=0; i<cList.size();i++)
		{
		%>
		<option value=<%=cList.get(i).getCategory_id() %>> <%=cList.get(i).getCategory_name()%> </option>	
		<%}%>
								</select>
								<span class="err_msg" id="category_err"> </span>
								</div>
								
								 
					 	</div>
							
						<div class="form-group">  
						
								<label  class="col-sm-4 control-label">Breed</label>
								<div class="col-sm-5">
								<select id="breed" class="form-control1" name="pet_breed">
									<option>--Select Breed--</option>
								
								</select></div>
						</div>
							<div class="form-group">
								<label  class="col-sm-4 control-label">Age</label>
								<div class="col-sm-5">
									<input type="text" class="form-control1" id="age" name="age" placeholder="">
								</div>
								
								</div>
								
							<div class="form-group">
								<label  class="col-sm-4 control-label">Color</label>
								<div class="col-sm-5">
									<input type="text" class="form-control1" id="color" name="color" placeholder="">
								<span class="err_msg" id="color_err"> </span>
								</div>
								
								</div>
								<div class="form-group">
								<label for="radio" class="col-sm-4 control-label">Gender</label>
								<div class="col-sm-5">
									<div class="radio-inline"><label><input type="radio" name="gender" value="M"> Male</label></div>
									<div class="radio-inline"><label><input type="radio" name="gender" value="F"> female</label></div>
									
								</div>
							</div>
						<div class="form-group">
								<label  class="col-sm-4 control-label">Appointment Date</label>
           						<div  class="col-sm-5" id="date_container"> 
           						<input type="text" id="datepicker1" name="admission_date"/>
           						
           						<p class="err_msg" id="date_err" style="color:red"><b></b></p>
           						</div>
           				</div>
           					
				        <div class="form-group">
           						<label  class="col-sm-4 control-label">Upload Image</label>
           						<div class="col-sm-5" >
           							<input type="file" class="form-control1" placeholder="" id="image_path" name="pet_image"/>
           						</div>
           						<!-- <div id="upload_btn">
           							<div class="list-group col-sm-1" >
  										<button type="button" class="list-group-item list-group-item-action active" style="background-color:#FF5722">
  							 				Upload
  										</button>
  									</div>
  									
  							</div> -->
  						</div>
           				<div class="form-group">
           						<label  class="col-sm-4 control-label">Appointment Time</label>
           						
           						<div class="col-sm-5">
								<select id="breed" class="form-control1" name="appointment_time">
									<option>--Select Time</option>
									<option> 11:00 AM </option>
									<option> 12:00 PM </option>
								
								</select></div>
           						
           						<!-- <div id="timestamps">
           							<div class="list-group col-sm-1" >
  										<button type="button" class="list-group-item list-group-item-action active">
  							 				11:00
  										</button>
  									</div>
  									<div class="list-group col-sm-1">
  										<button type="button" class="list-group-item list-group-item-action active">
  							 				12:00
  									</button>
  								</div>
  							</div> -->
  						</div>
  					<div class="form-group">
  							<div class="list-group col-sm-4"></div>
  								<div class="list-group col-sm-4" >
  									<button type="Submit"  class="form-control1 list-group-item list-group-item-action active"
  											style="background-color:#FF5722;
  											font-family: sans-serif;
  											margin-top: 20px;
  												font-size: 18px;
  												z-index: 0" id="submitbutton">
  										SUBMIT
  									</button>
  								</div>
  								</div>
  								</div>
							<!--  <div class="col-sm-2"> <img src="<%=request.getParameter("imgsrc")%>"/></div>-->
  							
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
	
	var category_err = true;
	var date_err=true;
	var color_err=true;
	
	$("#color").focusout(function(){
		$("#color_err").hide();
		var color = $("#color").val();
		if ( color == ""){
			$("#color_err").show();
			$("#color_err").html("Please mention the color");
			color_err=true;
		}		
		else
		{
			color_err=false;
			$("#color_err").hide();
			
		}
	});
	
	$("#pet_category").focusout(function(){
		$("#category_err").hide();
		var category = $("#pet_category").val();
		if (category == "---Select---")
			{
			$("#category_err").show();
			$("#category_err").html("Please select a category");
			category_err=true;
			}
		else
			{
			category_err=false;
			}
		});
	
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
	        	date_err=true;
	        	
	            
	        }
	        else
	        	{
	        	date_err=false;
	        	}
	        
	       
	      
	});
$("#submitbutton").click(function(){
		
		if(category_err==false && date_err==false && color_err==false)
			{
			$("#admit_form").attr('action','../AdmitPetServlet');
			$("#admit_form").submit();
			}
		else
			{
			alert("There are errors on the page");
			//document.write("asdasd");
			}
		
		
	});	
	
});

</script>
				
</body>
</html>