<%@page import="dao.PetDao"%>
<%@page import="bean.PetBean"%>
<%@page import="dao.AdoptionDao"%>
<%@page import="bean.AdoptionBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adoption Confirmation</title>
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
img{
border: 3px groove floralwhite !important; 
opacity:0.5;
}
table { 
width:80%;
margin:auto;
border: 1px solid white;
border-collapse:collapse;
text-align:center;
font-size:30px;
table-layout:fixed;
background:grey;
opacity:1;
color:white !important;   
margin-top:100px;
}
td{
padding:10px;
border:1px solid white;
width:50%;
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

<div class="grid_3 grid_4"></div>
<p align="center"><img width="15%" src="images/adop_confi.png"/></p>
<br>
<h1 style="color:white" align="center"> ADOPTION CONFIRMED !</h1>
<div class="grid_3 gird_4">
<% AdoptionBean adopBean = new AdoptionDao().getAdoption(Integer.parseInt(request.getParameter("id"))); 

PetBean p = new PetDao().getPet(adopBean.getPet_id());

%>
<table>
<tr>
	<td> NAME OF THE ADOPTER </td>
	<td> <%=adopBean.getUser_name() %></td>
</tr>
<tr>
	<td>ALLOCATED TIME SLOT  </td>
	<td><%=adopBean.getAppointment_time() %></td>
</tr>
<tr>
	<td> ANIMAL TYPE </td>
	<td><%=p.getCategory_Name() %></td>
</tr>
<tr>
	<td> ANIMAL BREED </td>
	<td><%=p.getBreed_name() %></td>
</tr>
<tr>
	<td> ANIMAL NAME (if any) </td>
	<td><%=p.getPet_name() == null? " " : p.getPet_name() %></td>
</tr>
</table>
</div>
</div>


</body>
</html>