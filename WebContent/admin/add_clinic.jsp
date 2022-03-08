<%@page import="java.util.ArrayList"%>
<%@page import="bean.AreaBean"%>
<%@page import="dao.AreaDao"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Clinic</title>
<jsp:include page="admin_header.jsp"></jsp:include>
</head>
<body>
<div class="wthree_agile_admin_info">
<div class="inner_content">

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_manage_users.jsp">Manage</a><span>«</span></li>
									<li><a href="clinic_details.jsp" >Clinic</a><span>«</span></li>
									<li>Add Clinic</li>
								</ul>
							</div>
						</div>
						<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<div class="forms-main_agileits">
						<div class="wthree_general graph-form agile_info_shadow ">
							<h3 class="w3_inner_tittle two">Clinic Registration </h3>
								<div class="grid-1 ">
									<div class="form-body" >
										<form class="form-horizontal" action="#" id="formid" method="post">
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Clinic Name</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="clinic_name" name="clinic_name" value=<%= request.getParameter("clinic_name") == null ? "" : request.getParameter("clinic_name") %>> 
												<span class="err_msg" id="name_err"> </span>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Clinic Owner</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="clinic_owner" name="clinic_owner" ><span class="err_msg" id="owner_err"> </span>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Address Line 1</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="cl_addressline_1" name="cl_addressline_1"> <span class="err_msg" id="add1_err"> </span>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Address Line 2</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="cl_addressline_2" name="cl_addressline_2" ><span class="err_msg" id="add2_err"> </span>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Pincode</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="cl_pincode" name="cl_pincode" ><span class="err_msg" id="pin_err"> </span>
											</div> 
										</div>
																				<div class="form-group">
											<label for="selector1" class="col-sm-2 control-label">Area</label>
											<div class="col-sm-8"><select name="cl_area_id" id="cl_area_id" class="form-control1">
													<option>1</option>
													<% ArrayList<AreaBean> areaList = new AreaDao().getAllArea();
													for (int i=0;i<areaList.size();i++)
													{
													%>
													<option value=<%=areaList.get(i).getArea_id()%>> <%=areaList.get(i).getArea_Name()%> </option>
																<%} %>	
													</select></div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Contact Number</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="cl_contact" name="cl_contact" ><span class="err_msg" id="contact_err"> </span>
											</div> 
										</div>
										<div class="form-group">
											<label for="txtarea1" class="col-sm-2 control-label">Map Location</label>
											<div class="col-sm-8"><textarea name="txtarea1" id="cl_location" name="cl_location" cols="50" rows="4" class="form-control1"></textarea></div>
										</div>
										<div class="form-group">
											<label for="txtarea1" class="col-sm-2 control-label">Website</label>
										    <div class="col-sm-8"><textarea name="txtarea1" id="cl_website" name="cl_website" cols="50" rows="4" class="form-control1"></textarea></div>
										</div>
										<div class="col-sm-offset-2"> 
											<button type = "submit" class = "btn btn-warning" id="submitButton">SUBMIT CLINIC</button>
										</div> 
									</form>
								</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
		$(function(){
			$("#name_err").hide();
			$("#owner_err").hide();
			$("#add1_err").hide();
			$("#add2_err").hide();
			$("#pin_err").hide();
			$("#contact_err").hide();
			
			var cl_name = false;
			var cl_owner = false;
			var cl_add1 = false;
			var cl_add2 = false;
			var cl_pin = false;
			var cl_con = false;
		
			$("#clinic_name").focusout(function(){
				var clinic=$("#clinic_name").val().length;
				if(clinic == 0)
				{
					$("#name_err").html("Please enter Clinic's name");
					$("#name_err").show();
					$("#clinic_name").css("border-color","red");
					cl_name=false;
				}
				else
				{ 
					$("#name_err").hide();
					$("#clinic_name").css("border-color","#ddd");
					cl_name=true;
				}
			});
			
			$("#clinic_owner").focusout(function(){
				var own=$("#clinic_owner").val().length;
				if(own == 0)
				{
					$("#owner_err").html("Please enter Clinic's owner");
					$("#owner_err").show();
					$("#clinic_owner").css("border-color","red");
					cl_owner=false;
				}
				else
				{ 
					$("#owner_err").hide();
					$("#clinic_owner").css("border-color","#ddd");
					cl_owner=true;
				}
			});
		
			$("#cl_addressline_1").focusout(function(){
				var adl1=$("#cl_addressline_1").val().length;
				if(adl1 == 0)
				{
					$("#add1_err").html("Please enter Addressline 1");
					$("#add1_err").show();
					$("#cl_addressline_1").css("border-color","red");
					cl_add1=false;
				}
				else
				{ 
					$("#add1_err").hide();
					$("#cl_addressline_1").css("border-color","#ddd");
					cl_add1=true;
				}
			});
			
			$("#cl_addressline_2").focusout(function(){
				var adl1=$("#cl_addressline_2").val().length;
				if(adl1 == 0)
				{
					$("#add2_err").html("Please enter Addressline 2");
					$("#add2_err").show();
					$("#cl_addressline_2").css("border-color","red");
					cl_add2=false;
				}
				else
				{
					$("#add2_err").hide();
					$("#cl_addressline_2").css("border-color","#ddd");
					cl_add2=true;
				}
			});
			
			$("#cl_pincode").focusout(function(){
				var pin=$("#cl_pincode").val();
				var pinlen=$("#cl_pincode").val().length;
				var pat1=/^\d{6}$/;
				if(pinlen == 0)
				{
					$("#pin_err").html("Please enter Pincode");
					$("#pin_err").show();
					$("#cl_pincode").css("border-color","red");
					cl_pin=false;
				}
				else if(!pat1.test(pin))
				{
					$("#pin_err").html("Pincode should be of 6 digits");
					$("#pin_err").show();
					$("#cl_pincode").css("border-color","red");
					cl_pin=false;
				}
				
				else
				{ 
					$("#pin_err").hide();
					$("#cl_pincode").css("border-color","#ddd");
					cl_pin=true;}
			});
			
			$("#cl_contact").focusout(function(){
				var con=$("#cl_contact").val().length;
				if(con == 0)
				{
					$("#contact_err").html("Please Clinic's contact number.");
					$("#contact_err").show();
					$("#cl_contact").css("border-color","red");
					cl_con=false;
				}
				else
				{ 
					$("#contact_err").hide();
					$("#cl_contact").css("border-color","#ddd");
					cl_con=true;
				}
			});


		$("#submitButton").click(function(){
	
			if(cl_name == true &&  
					cl_owner == true &&
					cl_add1 == true &&
					cl_add2 == true &&
					cl_pin == true &&
					cl_con == true)
				{
					$("#formid").attr('action','../InsertClinic');
					$("#formid").submit();
				}
			else
				{
				alert("No errors please");
				}
	
		});
		
		
		});
		
	
	
		
	</script>
</body>
</html>