<%@page import="dao.UserDao"%>
<%@page import="bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.QueryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show query</title>
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
									<li><a href="middle_queries.jsp">Non Healthcare</a><span>«</span></li>
									<li>Show Queries</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">NON-HEALTHCARE RELATED QUERIES</h3>
						<form action="admin_answer_query.jsp" method="post">
						<button type = "submit" class = "btn btn-warning">ANSWER QUERY</button>
						</form>
						</div>
						</div>
			</div>
			<%
	ArrayList<QueryBean> qList = new ArrayList<QueryBean>();
	qList = new QueryDao().getNonHealthQueries();
	
%>
			
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                
                <th>User Id</th>
                <th>Query Text</th>
                <th>Query Answer</th>
                <th>Query Submission</th>
                <th>Query Answer Submission</th>
                <th> Edit Responses </th>
                
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<qList.size(); i++)
        		{
        			QueryBean qBean = qList.get(i);
        			
        	%>
        		<tr>
        			
        			<td><%=new UserDao().getUserName(qBean.getUser_id())%></td>
        			<td><%=qBean.getQuery_text()%></td>
        			<td><%=qBean.getQuery_ans() == null ? "" : qBean.getQuery_ans()%></td>
        			<td><%=qBean.getQuery_sub_date().substring(0,11)%></td>
        			<td><%=qBean.getQuery_ans_date() == null ? "" : qBean.getQuery_ans_date().substring(0,11)%></td>
        			<td><a href="admin_answer_query.jsp?query_id=<%=qBean.getQuery_id()%>
        			&query_user_id=<%=qBean.getUser_id() %>
        			&query_text='<%=qBean.getQuery_text()%>'&query_sub_date=<%=qBean.getQuery_sub_date()%>
        			&query_ans=<%=qBean.getQuery_ans()%>">Edit Query Response</a></td>
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>