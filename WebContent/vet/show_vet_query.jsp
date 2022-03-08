<%@page import="dao.QueryDao"%>
<%@page import="bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show health query</title>
<jsp:include page="vet_header.jsp"></jsp:include>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	
	
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">$(document).ready(function() {
	    $('#example').DataTable();
	} ); </script>

</head>
<body>
<div class="wthree_agile_admin_info">
<div class="inner_content">
				   

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									
									<li>Healthcare Queries</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">HEALTHCARE RELATED QUERIES</h3>
						<form action="vet_answer_query.jsp" method="post">
						<button type = "submit" class = "btn btn-warning">ANSWER QUERY</button>
						</form>
						</div>
						</div>
			</div>
			<% ArrayList<QueryBean> petList = new QueryDao().getHealthQueries(); %>
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Query By</th>
                <th>Query</th>
                <th>Query Type</th>
                <th>Answer</th>
                <th>Submission date</th>
                <th>Answer Date</th>
                <th>Operation</th>
                </tr>
            
        </thead>
        <tbody>
        		<% for (int i=0;i<petList.size();i++)
        		{
        			QueryBean p = petList.get(i);	
        			
        		%>
        		<tr>
        			<%-- <td><%=p.getQuery_id() %></td> --%>
        			<td><%=p.getUser_name() %></td>
        			<td><%=p.getQuery_text()%></td>
        			<td> <%=p.getQuery_type() %> </td>
        			<td> <%= p.getQuery_ans()==null ? " " : p.getQuery_ans() %></td>
        			<td> <%=p.getQuery_sub_date() %></td>
        			<td> <%=p.getQuery_ans_date() == null ? " " :p.getQuery_ans_date().substring(0,11) %></td>
        			<td> <a href="vet_answer_query.jsp?id=<%=p.getQuery_id()%>"><%= p.getQuery_ans()==null ? "Answer" : "" %></a></td>
        			
        		</tr>	
        			
        			
        			
        			<%} %>
        </tbody>
        </table>
</div>
</body>
</html>