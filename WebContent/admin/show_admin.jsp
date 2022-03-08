<%@page import="dao.UserDao"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Admin</title>
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
	ArrayList<UserBean> userList = new ArrayList<UserBean>();
	userList = new UserDao().getAllAdmins();
	

				  
%>

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_manage_users.jsp">Manage</a><span>«</span></li>
									<li>Show Admin</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">ADMINS</h3>
						<form action="Register.jsp?type_id='1'" method="post">
						<button type = "submit" class = "btn btn-warning">ADD ADMIN</button>
						</form>
						</div>
						</div>
			</div>
		
		<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>DOB</th>
                <th>Address</th>
                <th>Contact </th>
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<userList.size(); i++)
        		{
        			UserBean userBean = userList.get(i);
        			
        	%>
        		<tr>
        			<td><%=userBean.getUser_id() %></td>
        			<td><%=userBean.getFirst_Name() %> </td>
        			<td><%=userBean.getLast_Name() %></td>
        			<td><%=userBean.getEmail() %></td>
        			<td><%=userBean.getDob().substring(0,11) %></td>
        			<td><%=userBean.getAddress_Line1() %> <br> <%=userBean.getAddress_Line2() %></td>
        			<td><%=userBean.getContact() %></td>
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>