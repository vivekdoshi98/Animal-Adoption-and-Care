<%@page import="bean.QueryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query Confirmation</title>
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
td {
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
	<jsp:param value="Query" name="page"/>
</jsp:include>
</div>
<% QueryBean qBean = (QueryBean)session.getAttribute("queryBean"); %>
<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">
<p align="center"><img src="images/tick.png" width="100"/></p>
<h1 style="color:white" align="center"> QUERY SUBMITED SUCCESSFULLY !</h1>
</div>
<div class="grid_3 grid_4">
<h3 align="center" style="font-family:'roboto',serif;color:orange"> OUR TEAM WILL REVERT BACK TO YOUR QUERY ASAP</h3>
<br>
<h4 align="center" style="font-family:'roboto',serif;color:orange"> <marquee> NOTE: HEALTH RELATED QUERIES ARE DENOTED AS "H" AND NON-HEALTH RELATED QUERIES ARE DENOTED AS "N"</marquee></h4>
</div>
	
		<table>
			<tr>
				<th> USERNAME </th>
				<td> <%= qBean.getUser_name() %></td>
			</tr>
			<tr>
				<th> Query Submitted </th>
				<td> <%=qBean.getQuery_text() %> </td>
			</tr>
			<tr>
				<th> Date of Submission </th>
				<td> <%= qBean.getQuery_sub_date() %> </td>
			</tr>
			<tr>
				<th> Query Type </th>
				<td> <%= qBean.getQuery_type() %> </td>
			</tr>
			
		
		</table>
	<br/><br/><br/>



<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	
	</div>
</body>
</html>