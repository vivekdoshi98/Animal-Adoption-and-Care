<%@page import="dao.CityDao"%>
<%@page import="bean.CityBean"%>
<%@page import="dao.UserDao"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<jsp:include page="admin_header.jsp"></jsp:include>
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
<div class="wthree_agile_admin_info">
<div class="inner_content">
<%
int id = (Integer) session.getAttribute("id");
UserBean uBean = new UserDao().getMyData(id);  %>
					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li>Edit Profile</li>
								</ul>
							</div>
						</div>
						<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<div class="forms-main_agileits">
						<div class="wthree_general graph-form agile_info_shadow ">
							<h3 class="w3_inner_tittle two">Edit Profile </h3>
								<div class="grid-1 ">
									<div class="form-body" >
										<form class="form-horizontal" action="#">
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Email</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="email" name="email" value="<%=uBean.getEmail() %>" >
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">First Name</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="first_name" name="first_name" value=<%=uBean.getFirst_Name() %> >
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Last Name</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="last_name" name="last_name" value=<%=uBean.getLast_Name()%>>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">DOB</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="dob" name="dob" value=<%=uBean.getDob()%> >
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Contact Number</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="contact" name="contact" value=<%=uBean.getContact() %>>
											</div> 
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Address Line 1</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="addressline_1" name="addressline_1" value=<%=uBean.getAddress_Line1() %>>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Address Line 2</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="addressline_2" name="addressline_2" value=<%=uBean.getAddress_Line2() %>>
											</div>
										</div>
										<div class="form-group">
											<label for="focusedinput" class="col-sm-2 control-label">Pincode</label>
											<div class="col-sm-8">
												<input type="text" class="form-control1" id="pincode" name="pincode" value=<%=uBean.getPincode() %> >
											</div> 
										</div>
										<div class="form-group">
											<label for="selector1" class="col-sm-2 control-label">City</label>
											<div class="col-sm-8"><select name="city" id="city" class="form-control1" onchange="state_change()">
													<option></option>
													<% ArrayList<CityBean> cityList = new CityDao().getCities(); 
																		for (int i=0;i<cityList.size();i++)
																		{
																	%>
																	
																	<option value=<%=cityList.get(i).getCity_id()%>> <%=cityList.get(i).getCity_Name()%> </option>
																	
																
																<%} %>
												</select></div>
										</div>
										<div class="form-group">
											<label for="selector1" class="col-sm-2 control-label">Area</label>
											<div class="col-sm-8"><select name="area" id="area" class="form-control1">
													<option></option>
													<option></option>
													<option></option>
													<option></option>
												</select></div>
										</div>
										<div class="col-sm-offset-2"> 
											<button type = "button"  class = "btn btn-warning" onclick="document.location.href='../admin_changePass.jsp'">CHANGE PASSWORD</button>
										
											<button type = "submit" class = "btn btn-warning">SAVE PROFILE</button>
										</div>
						
										
									</form>
								</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
</div>
</body>
</html>