<%@page import="dao.CityDao"%>
<%@page import="bean.CityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDao"%>
<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<jsp:include page="home_links.jsp"></jsp:include>
<style type="text/css">
.agileits-banner {
	 background: url(../images/adopt_cover.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
  </style>
  <link rel="stylesheet" href="../user/css/profilecss.css">
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="myHeader.jsp">
	<jsp:param value="adopt" name="page"/>
</jsp:include>
</div> 
<div class="container-fluid" style="background:url(images/doggodoubt.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;
   	padding-left: 29em;" >
<div>
<%

	int id = (Integer) session.getAttribute("id");
	
	UserBean uobj = new UserDao().getMyData(id);
	
%>
		<div class="contact-form">
			<div class="title">Edit Pawfile</div>

			<div class="input-fields">
					<div class="items">
						<label for="name" class="label">First Name</label>
						<input id="name" type="text" class="input" value=<%=uobj.getFirst_Name()%>>
					</div>
					<div class="items">
						<label for="email" class="label">Last Name</label>
						<input id="email" type="text" class="input" value=<%=uobj.getLast_Name() %>>
					</div>
					<div class="items">
						<label for="subject" class="label">Email</label>
						<input id="subject" type="text" class="input" value=<%=uobj.getEmail()%>>
					</div>
					<div class="items">
						<label for="subject" class="label">Contact</label>
						<input id="subject" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="input" maxlength="10" value=<%=uobj.getContact()%>>
					</div>
					<div class="items">
						<label for="subject" class="label">Date of Birth</label>
						<input id="subject" type="date" class="input" value=<%= uobj.getDob()%>>
					</div>
					<div class="items">
						<label for="msg" class="label">Address Line One</label>
						<textarea id="msg" class="text-area" ><%= uobj.getAddress_Line1()%></textarea>
					</div>
					<div class="items">
						<label for="msg" class="label">Address Line Two</label>
						<textarea id="msg" class="text-area"><%=uobj.getAddress_Line2()%></textarea>
					</div>
					
						<div class="items">
						<label for="subject" class="label" >City</label>
						
						<select id="city" onchange="state_change()">
						<% ArrayList<CityBean> cityList = new CityDao().getCities(); 
																		for (int i=0;i<cityList.size();i++)
																		{
																	%>
																	
																	<option value=<%=cityList.get(i).getCity_id()%>> <%=cityList.get(i).getCity_Name()%> </option>
																	
																
																<%} %>
							
						</select>
					</div>
						<div class="items">
						<label for="subject" class="label" >Area</label>
						<select id="area">
							<option value=<%=uobj.getArea_id()%>></option>
						</select>
					</div>
					<div class="items">
						<label for="subject" class="label">PAN Number</label>
						<input id="subject" value=<%=uobj.getPan_number() %> type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="input" maxlength="10">
					</div>	

			</div>
				
			<div class="btn">CHANGE</div>
		</div>
</div>	
</div>


<script src="js/SmoothScroll.min.js"></script>
<jsp:include page="home_scripts.jsp"></jsp:include>
</body>
</html>