<%@page import="bean.NonFinancialDonationBean"%>
<%@page import="bean.FinancialDonationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donation Confirmation</title>
<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<style type="text/css">
.agileits-banner {
	 background: url(../images/adopt_cover.jpg)no-repeat center 0px;
	 background-position: 50% 32%;

	 }
  </style>
 
 <style>
table { 
width:80%;
margin:auto;
border: 1px solid white;
border-collapse:collapse;
text-align:center;
font-size:30px;
table-layout:fixed;
background:grey;
opacity:0.8;
color:white;   
margin-top:100px;
}
td,th {
color:white;
border:1px solid #FFFFFF;
font-size:20px;
font-family:'roboto';
padding:15px;
width:50%;
}
h3,h4{
font-family:'roboto',serif;
}

</style>
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="donation" name="page"/>
</jsp:include>
</div>
<% NonFinancialDonationBean qBean = (NonFinancialDonationBean)session.getAttribute("nonfinBean"); %>
<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">
<p align="center"><img src="images/tick.png" width="100"/></p>
<h1 style="color:white" align="center"> DONATION SUBMITTED SUCCESSFULLY !</h1>
</div>
<div class="grid_3 grid_4">
</div>
	
		<table>
			<tr>
				<th> USERNAME </th>
				<td> <%= qBean.getFirst_name() %></td>
			</tr>
			<tr>
				<th> Donation Description </th>
				<td> <%=qBean.getDonation_desc() %> </td>
			</tr>
			<tr>
				<th> Donation Date and time </th>
				<td> <%= qBean.getAppointment_time() %> </td>
			</tr>
	
		
		</table>
	<br/><br/><br/>



<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	
	</div>

</body>
</html>