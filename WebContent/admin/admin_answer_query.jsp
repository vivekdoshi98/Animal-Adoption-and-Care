<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Non Healthcare Queries</title>
<jsp:include page="admin_header.jsp"></jsp:include>
</head>
<body>
<div class="inner_content">
				   

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_queries.jsp">Non Healthcare</a><span>«</span></li>
									<li><a href="show_query.jsp">Show Queries</a><span>«</span></li>
									<li>Answer Query</li>
								</ul>
							</div>
						</div>
						
					<!-- //breadcrumbs -->
		<div class="wthree_general graph-form agile_info_shadow ">
						<h3 class="w3_inner_tittle two">Queries</h3>
							<div class="grid-1 ">
								<div class="form-body">
									<form class="form-horizontal" action="../QueryResponse">
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY:</label>
												<div class="col-sm-8">
												<textarea name="query_text" id="query_text" style="height:100px;text-align:left;" class="form-control1">
												<%=request.getParameter("query_text").trim() %>
												</textarea></div>
												
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY BY:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="user_id" placeholder="" name="user_id"
													value="<%=request.getParameter("query_user_id") %>"
													>
												</div>
											</div>
											<!-- <div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY TYPE:</label>
											    <div class="col-sm-8">
													<input type="text" class="form-control1" id="query_type" placeholder="" name="query_type">
												</div>
											</div> -->
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">QUERY POSTED ON:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="query_submission_date" placeholder="" name="query_submission_date"
													value="<%=request.getParameter("query_sub_date")%>"
													>
												</div>
											</div>
											
											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">QUERY ANSWER:</label>
												<div class="col-sm-8">
												<textarea name="query_answer" id="query_answer" cols="50" rows="10" class="form-control1" style="height:100px;text-align:left;">
												<%=request.getParameter("query_ans") == null ? " " : request.getParameter("query_ans").trim()   %>
												</textarea></div>
											</div>
											
											<input type="hidden" name="query_id" value="<%=request.getParameter("query_id").trim() %>"/>
										<button type="submit" class="btn btn-warning" onclick="" style='width:100px;margin:0 50%;position:relative;left:-50px;'>SUBMIT</button>
								</form>
							</div>
					</div>
										
											
		</div>			
		
		
		</div>
</body>
</html>