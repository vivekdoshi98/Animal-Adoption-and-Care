<%@page import="dao.NonFinancialDonationDao"%>
<%@page import="bean.NonFinancialDonationBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Non-Financial Donation</title>
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
	ArrayList<NonFinancialDonationBean> finList = new ArrayList<NonFinancialDonationBean>();
	finList = new NonFinancialDonationDao().getNonFinancialDonations();
	

				  
%>
				   

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_donation.jsp">Donation</a><span>«</span></li>
									<li>Non-Financial Donation</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Non-Financial Donation</h3>
						
						</div>
						</div>
			</div>
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <!-- <th>Non Financial Donation ID</th> -->
                <th>Donation By</th>
                <th>Donation Description</th>
                <th>Appointment Time</th>
                <th>Donation Date</th>
                
                
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<finList.size(); i++)
        		{
        		NonFinancialDonationBean fBean = finList.get(i);
        			
        	%>
        		<tr>
        			<%-- <td><%= fBean.getNon_financial_donation_id() %></td> --%>
        			<td><%= fBean.getFirst_name()%> </td>
        			<td><%= fBean.getDonation_desc()%></td>
        			<td><%= fBean.getAppointment_time()%></td>
        			<td><%= fBean.getDonation_date().substring(0,11) %></td>
        			
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>