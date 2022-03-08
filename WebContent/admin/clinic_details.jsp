<%@page import="dao.ClinicDao"%>
<%@page import="bean.ClinicBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clinic Details</title>
<script type ="text/javascript">

function toggle(source){
	
	checkboxes = document.getElementsByName("clinicID");
	var n = checkboxes.length;
	
	for(var i=0; i<n; i++){
		checkboxes[i].checked = source.checked;
	}
}
</script>
<jsp:include page="admin_header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	
	
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">$(document).ready(function() {
	    $('#example').DataTable();
	} );</script>
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
									<li>Clinic</li>
								</ul>
							</div>
						</div>
						<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Clinic Details</h3>
						
						<button type = "button" class = "btn btn-warning" onclick="location.href='add_clinic.jsp'">ADD CLINIC</button>
						
						</div>
						</div>
	</div>
	<%
	ArrayList<ClinicBean> cList = new ArrayList<ClinicBean>();
	cList = new ClinicDao().getAllClinics();
					  
%>	
	<div class="inner_content">	
	<form action="#" method="post">
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Clinic ID</th>
                <th>Clinic Name</th>
                <th>Owner Name</th>
                <th>Address</th>
                <th>Location</th>
                <th>Website</th>
                <th>Contact</th>
                <th> Edit </th>
                <th> Delete <input type ="checkbox" name="clinicID" onClick="toggle(this)"/></th>
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<cList.size(); i++)
        		{
        			ClinicBean cBean = cList.get(i);
        			
        	%>
        		<tr>
        			<td><%=cBean.getClinic_id() %></td>
        			<td><%=cBean.getClinic_name() %></td>
        			<td><%=cBean.getClinic_owner() %></td>
        			<td><%=cBean.getCl_addressLine1() %> <br> <%=cBean.getCl_addressLine2()%></td>
        			<td><iframe src=<%=cBean.getLocation()%> width="200" height="200" frameborder="0" style="border:0" allowfullscreen></iframe></td>
        			<td><%=cBean.getWebsite() %></td>
        			<td><%=cBean.getContact() %></td>
        			<td><a href="#?id='<%=cBean.getClinic_id()%>'"></a> Click to edit </td>
        			<td><input type="checkbox" name="clinicID" value=<%=cBean.getClinic_id()%>/></td>
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	<button type = "submit" class = "btn btn-warning" >Delete Selected Clinics</button>
        	
        	</form>
        	</div>
</div>
</body>
</html>