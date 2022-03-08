<%@page import="dao.PetDao"%>
<%@page import="bean.AdmissionBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admission</title>
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
<%
	ArrayList<AdmissionBean> aList = new ArrayList<AdmissionBean>();
	aList = new PetDao().getAdmittedPets();
	

				  
%>

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_appointments.jsp">Appointments</a><span>«</span></li>
									<li>Show Admissions</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Admissions</h3>
						
						</div>
						</div>
			</div>
		
		<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <!-- <th>Adoption ID</th>
                 -->
                 <th>Admitted By</th>
                <th>Pet's Name</th>
                <th>Appointment</th>
                <th>Adoption Date</th>
                
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<aList.size(); i++)
        		{
        			AdmissionBean aBean = aList.get(i);
        			
        	%>
        		<tr>
        			<%-- <td><%=aBean.getAdoption_id()%></td> --%>
        			<td><%=aBean.getUser_name()%></td>
        			<td><%=aBean.getPet_name()%></td>
        			<td><%=aBean.getAppointment_time().substring(0,16)%></td>
        			<td><%=aBean.getAdmission_date().substring(0,10)%></td>
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>