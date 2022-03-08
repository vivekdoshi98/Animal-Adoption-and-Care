<%@page import="dao.FeedbackDao"%>
<%@page import="bean.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Feedback</title>
<jsp:include page="admin_header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	
	
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">$(document).ready(function() {
	    $('#example').DataTable();
	} );</script>
</head>
<body>
<%
	ArrayList<Feedback> feedbackList = new ArrayList<Feedback>();
feedbackList = new FeedbackDao().getFeedbacks();
	

				  
%>
<div class="wthree_agile_admin_info">
<div class="inner_content">
				  

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>�</span></li>
									
									<li>Show Feedback</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Feedbacks</h3>
						
						</div>
						</div>
			</div>
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Feedback ID</th>
                <th>Feedback By</th>
                <th>Feedback</th>
                <th>Feedback Date</th>
                
                
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<feedbackList.size(); i++)
        		{
        		Feedback fBean = feedbackList.get(i);
        			
        	%>
        		<tr>
        			<td><%= fBean.getFeedback_id() %></td>
        			<td><%= fBean.getUser_name()%> </td>
        			<td><%= fBean.getFeedback_text()%></td>
        			<td><%= fBean.getFeedback_date().substring(0,11) %></td>
        			
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>