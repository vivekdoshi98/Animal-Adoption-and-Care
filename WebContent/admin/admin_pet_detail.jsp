<%@page import="dao.PetDao"%>
<%@page import="bean.PetBean"%>
<%@page import="dao.CategoryDao"%>
<%@page import="bean.PetCategory_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Details</title>
<jsp:include page="admin_header.jsp"></jsp:include>

<script>
	
function category_change()
{
	$('#breed').find('option').remove().end();
    //.append('<option value="whatever">text</option>')
    //.val('whatever')

	//document.write("yup");
	var val=$("#pet_category").val();
	 
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

<div class="inner_content">
					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="middle_manage_users.jsp">Manage</a><span>«</span></li>
									<li><a href="show_pets.jsp">Show Pets</a><span>«</span></li>
									<li>Pet Details</li>
									
								</ul>
							</div>
							<%
		String flag=request.getParameter("id");
							int petid;
							if(flag != null){
		petid=Integer.parseInt(request.getParameter("id"));}
							else
								petid=0;
		PetBean pd = new PetDao().getSpecificPet(petid);
							
		
		//flag=true;
	
	/* else
		flag=false;
 */
				  
%>
						
					<!-- //breadcrumbs -->
		<div class="wthree_general graph-form agile_info_shadow ">
						<h3 class="w3_inner_tittle two">Pet Details</h3>
							<div class="grid-1 ">
								<div class="form-body">
									<form class="form-horizontal" id="urchoice">
											<!-- <div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet ID:</label>
												<div class="col-sm-8">
												<input type="text" class="form-control1" id="pet_id" placeholder="" name="pet_id">
												</div>
												
											</div> -->
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet Name:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="pet_name" placeholder="" name="pet_name" value=<%=flag == null ? "" :pd.getPet_name()%> >
												</div>
											</div>
											<% ArrayList<PetCategory_Bean> categories = new CategoryDao().getCategories(); %>
											<div class="form-group">
												<label for="selector1" class="col-sm-2 control-label">Pet Category</label>
												<div class="col-sm-8">
												<select name="pet_category" id="pet_category" class="form-control1" onchange="category_change()">
													<% for (int i=0; i<categories.size();i++)
														{
														
														%>
														<option value=<%=categories.get(i).getCategory_id() %>> <%=categories.get(i).getCategory_name()%> </option>	
													
													<%}%>
													
												</select></div>
											</div>
											<div class="form-group">
												<label for="selector1" class="col-sm-2 control-label">Pet Breed</label>
												<div class="col-sm-8">
												<select name="pet_breed" id="pet_breed" class="form-control1">
													<option></option>
													
												</select></div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Age:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="age" placeholder="" name="age" value=<%=flag == null ? "" :pd.getAge()%> >
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Gender:</label>
												<div class="col-sm-8">
													<div class="radio-inline"><label><input type="radio" name="gender" value="M" style="height:15px; width:15px"> Male</label></div>
													<div class="radio-inline"><label><input type="radio" name="gender" value="F" style="height:15px; width:15px"> Female</label></div>
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Color:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="color" placeholder="" name="color" value=<%=flag == null ? "" :pd.getColor()%> >
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Status:</label>
												<div class="col-sm-8">
												<select name="status" id="status" class="form-control1">
													<option>----SELECT----</option>
													<option value="A">Available</option>
													<option value="U">Not Available</option>
													
													
												</select><span class="err_msg" id="status_err"> </span></div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 conrol-label" style="postion:relative;left:85px;">Upload Image:</label>
												<div class="col-sm-8">
													<input type = "file" class="form-control1" id="image_path" name = "image_path" size = "50" />
									         		<!-- <input type = "submit" class="btn btn-warning" value=<%=flag == null ? "Upload Image" :pd.getImage1()%>  /> -->
									         	</div>
									         </div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Vet Attendant:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="vet" placeholder="" name="vet" value=<%=flag == null ? "" :pd.getVet_name()%> >
												</div>
											</div>
											
											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">Health Details:</label>
												<div class="col-sm-8"><textarea name="health_details" id="health_details" cols="50" rows="4" class="form-control1" value=<%=flag==null?"":pd.getHealth_details() %> ></textarea></div>
											</div>
										<button type="submit" id="submitbutton" class="btn btn-warning" onclick="" style='width:100px;margin:0 50%;position:relative;left:-50px;'>SUBMIT</button>
								</form>
							</div>
					</div>
										
											
		</div>			
		
		
	</div>
</div>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script type="text/javascript">
  $(function(){
	  $("#status_err").hide();
	  
	  var p_status=false;
	  $("#status").focusout(function(){
			var status=$("#status").val();
			
			if(status == "----SELECT----")
			{
				$("#status_err").html("Please choose pet's status");
				$("#status_err").show();
				$("#status").css("border-color","red");
				p_status=false;
			}
			else
			{ 
				$("#status_err").hide();
				$("#status").css("border-color","#ddd");
				p_status=true;
			}
		});
	  $("#submitbutton").click(function(){
		 if(p_status==true)
			 {
				$("#urchoice").attr('action','../try.jsp');
				$("#urchoice").submit();
			 }
		 else
			 {
			 alert("Form has errors")
			 }
		 
	  });
	  
	  
  });
  </script>
</body>
</html>