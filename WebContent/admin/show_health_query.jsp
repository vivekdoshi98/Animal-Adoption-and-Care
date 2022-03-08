<%@page import="bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.QueryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show healthcare queries</title>
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
									<li><a href="middle_queries.jsp">Show Queries</a><span>«</span></li>
									<li>Healthcare</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">HEALTHCARE RELATED QUERIES</h3>
						<!-- <form action="admin_answer_query.jsp" method="post">
						<button type = "submit" class = "btn btn-warning">ANSWER QUERY</button>
						</form> -->
						</div>
						</div>
			</div>
			<%
	ArrayList<QueryBean> qList = new ArrayList<QueryBean>();
	qList = new QueryDao().getHealthQueries();
	
%>
			
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <!-- <th>Query ID</th> -->
                <th>Query By</th>
                <th>Query</th>
                <th>Answer</th>
                <th>Query Submission</th>
                <th>Query Answer Submission</th>
                
            </tr>
        </thead>
        <tbody>
        	<%for (int i=0; i<qList.size(); i++)
        		{
        			QueryBean qBean = qList.get(i);
        			
        	%>
        		<tr>
        			<%-- <td><%=qBean.getQuery_id()%></td>
        			 --%>
        			 <td><%=qBean.getUser_name()%></td>
        			<td><%=qBean.getQuery_text()%></td>
        			<td><%=qBean.getQuery_ans() == null ? "" : qBean.getQuery_ans()%></td>
        			<td><%=qBean.getQuery_sub_date()%></td>
        			<td><%=qBean.getQuery_ans_date() == null ? " " : qBean.getQuery_ans_date()%></td>
        			
        	</tr>
        	<% } %>
        	</tbody>
        	</table>
        	</div>
</div>
</body>
</html>