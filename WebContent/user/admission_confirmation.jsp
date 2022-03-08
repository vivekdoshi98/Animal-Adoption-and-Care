<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admission Confirmation </title>
<jsp:include page="home_links.jsp"></jsp:include>
<script src="js/SmoothScroll.min.js"></script>
<jsp:include page="home_scripts.jsp"></jsp:include>
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
opacity:0.9;
color:white;   
margin-top:100px;
}
th{
border:1px solid #FFFFFF;
}
td {
color:white;
font-size:20px;
border:1px solid #FFFFFF;

font-family:roboto;
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

<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">

<p align="center"><img src="images/tick.png" width="100"/></p>
<h1 style="color:white" align="center"> ADMISSION CONFIRMED !</h1>
</div>
<div class="grid_3 grid_4">




<table> 


<tr>
 <td>User Name </td>  
 <td> <%=session.getAttribute("userName") %></td>
 </tr>
 <tr>
 <td > Pet Category </td>
 <td> <%=session.getAttribute("petCategory") %> </td>
 </tr>
 
 <tr>
 <td> Pet Name (if any) </td>
 <td><%=session.getAttribute("petName") %> </td>
</tr>
<tr>
<td> Appointment Date </td>
<td><%=((String)session.getAttribute("appointment")).substring(0,11) %></td>
</tr>
<tr>
<td> Appointment Time </td>
<td><%=((String)session.getAttribute("appointment")).substring(11,19) %></td>
</tr>

</table>
</div>


</body>
</html>