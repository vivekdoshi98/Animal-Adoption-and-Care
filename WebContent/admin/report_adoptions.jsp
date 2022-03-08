<%@page import="bean.PetCategory_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Adoption Report</title>
<jsp:include page="admin_header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
	<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#date_to_cri").hide();
		$("#date_from_cri").hide();
		$("#category_cri").hide();
		
	})
	function criteria_change(){
		
	
		//document.write($("#criteria").val());
		var c=$("#criteria").val();
		if (c==0)
			{
			$("#date_cri").hide();
			$("#category_cri").hide();
			$("#date_to_cri").hide();
			$("#date_from_cri").hide();
			
			
			}
		else if(c==1)
			{
			$("#category_cri").hide();
			$("#date_to_cri").show();
			$("#date_from_cri").show();
			$("#adoptReportForm").attr('action','../ReportAdoptionByDate');
			
			}
		else
			{
			$("#category_cri").show();
			$("#date_to_cri").hide();
			$("#date_from_cri").hide();
			$("#adoptReportForm").attr('action','../ReportAdoptionByCategory');
			}
		
		
	}
	
	</script>

</head>
<body>
<div class="wthree_agile_admin_info">
<div class="inner_content">

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_reports.jsp">Reports</a><span>«</span></li>
									<li>Adoption Reports</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Reports of Adoption</h3>
										
						<div class="grid-1">
						<div class="form-body">
						<form class="form-horizontal" id="adoptReportForm">
						<div class="form-group">
							<label class="col-sm-4 control-label">Criteria:</label>
							<div class="col-sm-4">	
									<select class="form-control1 col-sm-8" id="criteria" name="criteria" onchange="criteria_change()">
									<option value="0">All</option>
									<option value="1">Date</option>
									<option value="2">Category</option>
										</select>
								</div> 
							 </div>
							 
							 <div class="form-group" id="category_cri" visible="false">
							 <label class="col-sm-4 control-label">Category</label>
							<div class="col-sm-4">
								<% ArrayList<PetCategory_Bean> cList = new CategoryDao().getCategories(); %>
									
									<select class="form-control1" name="category_id" id="category_id">
									
									<option>----Select Category----</option>
									<% for (int i=0; i<cList.size();i++)
									{
									%>
										<option value=<%=cList.get(i).getCategory_id() %>> <%=cList.get(i).getCategory_name()%> </option>	
									<%}%>
								</select>
							</div>
							 </div>
							 <div class="form-group" id="date_from_cri">
								 <label class="col-sm-4 control-label">From:</label>
								 <div class="col-sm-4">
								 <input type="text" id="datepicker1" name="datepicker1"/>
							</div>
							</div>
							
							<div class="form-group" id="date_to_cri">								
								 <label class="col-sm-4 control-label">To:</label>
								 <div class="col-sm-4">
								 <input type="text" id="datepicker2" name="datepicker2"/>								
								</div>		
							</div>	
							 <div class="form-group" style="text-align:center">
							 <button id="sumbit_button"  type = "submit" class = "btn btn-warning">Generate</button>
							 </div>
							</form>
							
						
						</div>
						</div>
						
						</div>
						
							
								</div>
						</div>
						</div>
						
						
						


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 							
<script>
$("#datepicker1").datepicker({dateFormat:'dd/mm/yy'});
$("#datepicker2").datepicker({dateFormat:'dd/mm/yy'});
</script>


</body>
</html>