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

<title>Admission Report</title>
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
		$("#breed_cri").hide();
		
		
	})
	function criteria_change(){
		
	
		//document.write($("#criteria").val());
		var c=$("#criteria").val();
		if (c==0)
			{
			$("#date_cri").hide();
			$("#category_cri").hide();
			$("#breed_cri").hide();
			$("#date_to_cri").hide();
			$("#date_from_cri").hide();
			
			}
		else if(c==1)
			{
			$("#category_cri").hide();
			$("#breed_cri").hide();
			$("#date_to_cri").show();
			$("#date_from_cri").show();
			$("#reportAdmissionForm").attr('action','../ReportAdmissionByDate');
			
			
			}
		else
			{
			$("#date_to_cri").hide();
			$("#date_from_cri").hide();
			$("#category_cri").show();
			$("#breed_cri").show();
			$("#reportAdmissionForm").attr('action','../ReportAdmissionByCategory');
			
			}
		
		
	}
	
	</script>
	<script type="text/javascript">
  function category_change()
  {
  	$('#breed').find('option').remove().end();
      //.append('<option value="whatever">text</option>')
      //.val('whatever')

  	//document.write("yup");
  	var val=$("#category_id").val();
  	 
  	 var xhttp = new XMLHttpRequest();
  	
  	  $.ajax({
  			url : '../AjaxCategory',
  			data : {
  				category : val
  			},
  			success : function(text) {
  				//document.write(text);
  				//$('#ajaxGetUserServletResponse').text(responseText);
  				 var list = text.split(":");
  				
  				jQuery('<option/>', {
 	         		value: "0", // <option value="list[i]"> list[i] </option>
 	         		html: "Select Breed"
 	         		}).appendTo('#breed');
  				 for(var i=0; i< list.length;i++)
  	        	 {
  					 var str = list[i].split(",");
  					
  				 			jQuery('<option/>', {
          	         		value: str[0], // <option value="list[i]"> list[i] </option>
          	         		html: str[1]
          	         		}).appendTo('#breed'); //appends to select if parent div has id dropdown
  						 
  				}
  					 
  			}
  		
  			
  		}); 
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
									<li>Admission Reports</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Reports of Pet Admission</h3>
										
						<div class="grid-1">
						<div class="form-body">
						<form class="form-horizontal" id="reportAdmissionForm">
						<div class="form-group">
							<label class="col-sm-4 control-label">Criteria:</label>
							<div class="col-sm-4">	
									<select class="form-control1 col-sm-8" id="criteria" name="criteria" onchange="criteria_change()">
									<option value="0">All</option>
									<option value="1">Date</option>
									<option value="2">Category & Breed</option>
									
										</select>
								</div> 
							 </div>
							 
							 <div class="form-group" id="category_cri" >
							 <label class="col-sm-4 control-label">Category</label>
							<div class="col-sm-4">
								<% ArrayList<PetCategory_Bean> cList = new CategoryDao().getCategories(); %>
									
									<select class="form-control1" name="category_id" id="category_id" onchange="category_change()">
									
									<option>----Select Category----</option>
									<% for (int i=0; i<cList.size();i++)
									{
									%>
										<option value=<%=cList.get(i).getCategory_id() %>> <%=cList.get(i).getCategory_name()%> </option>	
									<%}%>
								</select>
							</div>
							
							 </div>
							 <div class="form-group" id="breed_cri">
							<label class="col-sm-4 control-label">Breed</label>
							 <div class="col-sm-4">
							 <select id="breed" class="form-control1" name="breed">
									<option>--Select Breed--</option>
									
								
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