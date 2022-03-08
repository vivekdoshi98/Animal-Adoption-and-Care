<%@page import="bean.AreaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AreaDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Clinics Report</title>
<jsp:include page="admin_header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
	
	<script type="text/javascript" src ="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#area_cri").hide();
		
		
	})
	function criteria_change(){
		
	
		//document.write($("#criteria").val());
		var c=$("#criteria").val();
		if (c==0)
			{
			$("#area_cri").hide();
			
			}
		else
			{
			$("#area_cri").show();
			
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
									<li>Clinic Reports</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">Reports of Clinic</h3>
										
						<div class="grid-1">
						<div class="form-body">
						<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label">Criteria:</label>
							<div class="col-sm-4">	
									<select class="form-control1 col-sm-8" id="criteria" name="criteria" onchange="criteria_change()">
									<option value="0">All</option>
									<option value="1">Area</option>
									
										</select>
								</div> 
							 </div>
							 
							 <div class="form-group" id="area_cri">
							 <label class="col-sm-4 control-label">Area:</label>
							 <div class="col-sm-4">	
									<select class="form-control1 col-sm-8" id="area" name="area">
									<option value="0">---Select Area---</option>
									<% ArrayList<AreaBean> areaList = new AreaDao().getAllArea();
													for (int i=0;i<areaList.size();i++)
													{
													%>
													<option value=<%=areaList.get(i).getArea_id()%>> <%=areaList.get(i).getArea_Name()%> </option>
																<%} %>	
										</select>
								</div>
							 </div>
							 
							<div class="form-group" style="text-align:center">
							 <button id="sumbit_button"  type = "button" class = "btn btn-warning">Generate</button>
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
$("#datepicker1").datepicker();
$("#datepicker2").datepicker();
</script>


</body>
</html>