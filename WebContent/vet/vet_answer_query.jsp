<%@page import="dao.QueryDao"%>
<%@page import="bean.QueryBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Healthcare Queries</title>
<jsp:include page="vet_header.jsp"></jsp:include>
</head>
<body>
<div class="inner_content">
				   

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="show_vet_query.jsp">Healthcare Queries</a><span>«</span></li>
									
									<li>Answer Query</li>
								</ul>
							</div>
						</div>
						
					<!-- //breadcrumbs -->
					
					<%
		
		int queryid=Integer.parseInt(request.getParameter("id"));
		QueryBean qb = new QueryDao().getSpecificQueries(queryid);
		%>
					
		<div class="wthree_general graph-form agile_info_shadow ">
						<h3 class="w3_inner_tittle two">Queries</h3>
							<div class="grid-1 ">
								<div class="form-body">
									<form class="form-horizontal">
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY:</label>
												<div class="col-sm-8">
												<textarea name="query_text" readonly id="query_text" cols="15" rows="5" class="form-control1" ><%=qb.getQuery_text() %></textarea></div>
												
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY BY:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" readonly id="user_id" placeholder="" name="user_id" value=<%=qb.getUser_name() %>>
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY TYPE:</label>
											    <div class="col-sm-8">
													<input type="text" class="form-control1" readonly id="query_type" placeholder="" name="query_type" value="Healthcare related query">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY POSTED ON:</label>
												<div class="col-sm-8">
													<input type="date" class="form-control1" readonly id="query_submission_date" placeholder="" name="query_submission_date" value=<%=qb.getQuery_sub_date()%>>
												</div>
											</div>
											
											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">QUERY ANSWER:</label>
												<div class="col-sm-8"><textarea name="query_answer" id="query_answer" cols="50" rows="4" class="form-control1" value=<%=qb.getQuery_ans()==null ? "" : "" %>></textarea></div>
											</div>
											
										<button type="submit" class="btn btn-warning" onclick="" style='width:100px;margin:0 50%;position:relative;left:-50px;'>SUBMIT</button>
								</form>
							</div>
					</div>
										
											
		</div>			
		
		
		</div>
</body>
</html>