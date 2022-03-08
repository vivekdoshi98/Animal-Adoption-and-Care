<%@page import="dao.ClinicDao"%>
<%@page import="bean.ClinicBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinics</title>

<jsp:include page="home_links.jsp"></jsp:include>
<style type="text/css">
	
.table > thead > tr > th, .table > tbody > tr > th, 
.table > tfoot > tr > th, .table > thead > tr > td, 
.table > tbody > tr > td,
 .table > tfoot > tr > td	
 {
 
 	font-size: 0.9em;

color: #000 !important;

border-top: none !important;
 }
 td
 {
 border-bottom: 2px solid black !important;
 }
 
	
	
.agileits-banner {
	 background: url(../user/images/others.jpg)no-repeat center 0px;
	 background-position: 50%;
	 }
	</style>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	
	
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">$(document).ready(function() {
	    $('#clinics').DataTable();
	} );</script>
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="clinics" name="page"/>
	</jsp:include>
</div>
<%
	ArrayList<ClinicBean> cList = new ArrayList<ClinicBean>();
	cList = new ClinicDao().getAllClinics();
					  
%>	
	<div class="container-fluid" style="padding-top:50px;">
	<div class="grid_3 grid_4" style="postion:relative;top:500px; margin-left:60px">
	<form action="#" method="post">
		<table id="clinics" class="table table-dark" style="width:100%; color:black">
        <thead style="font-weight:bold; font-size:20px; color:black !important">
            <tr>
                
                <th>Clinic Name</th>
                <th>Owner Name</th>
                <th>Address</th>
                <th>Location</th>
                <th>Website</th>
                <th>Contact</th>
                
            </tr>
        </thead>
        <tbody style="font-weight:bold; font-size:20px; color:black !important">
        	<%for (int i=0; i<cList.size(); i++)
        		{
        			ClinicBean cBean = cList.get(i);
        			
        	%>
        		<tr>
        			
        			<td><%=cBean.getClinic_name() %></td>
        			<td><%=cBean.getClinic_owner() %></td>
        			<td><%=cBean.getCl_addressLine1() %> <br> <%=cBean.getCl_addressLine2()%></td>
        			<td><iframe src=<%=cBean.getLocation()%> width="200" height="200" frameborder="0" style="border:0" allowfullscreen></iframe></td>
        			<td><%=cBean.getWebsite() %></td>
        			<td><%=cBean.getContact() %></td>
        				
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	
        	
        	</form>
        	</div>
</div>

<script src="js/SmoothScroll.min.js"></script>
<jsp:include page="home_scripts.jsp"></jsp:include>

</body>
</html>