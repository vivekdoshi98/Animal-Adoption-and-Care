<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Query Confirmation </title>
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
opacity:0.5;
color:white;   
margin-top:100px;
}
td {
color:white;
border:1px solid #FFFFFF;

font-family:serif;
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
<h1 style="color:white" align="center"> QUERY SUBMITED SUCCESSFULLY !</h1>
</div>
<div class="grid_3 grid_4">
<h3 align="center" style="font-family:'roboto',serif;color:orange"> OUR TEAM WILL REVERT BACK TO YOUR QUERY ASAP</h3>
<br>
<h4 align="center" style="font-family:'roboto',serif;color:orange"> <marquee> NOTE: HEALTH RELATED QUERIES ARE DENOTED AS "H" AND NON-HEALTH RELATED QUERIES ARE DENOTED AS "N"</marquee></h4>
</div>

<table> 
<tr>
 <td> Name </td>  
 <td> </td>
 </tr>
 <tr>
 <td > Query Category </td>
 <td> </td></tr>
 <tr>
 <td> Query Details </td>
 <td> </td>
</tr></table>
</div>


</body>
</html>