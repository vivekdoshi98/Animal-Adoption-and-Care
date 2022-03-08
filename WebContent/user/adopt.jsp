<%@page import="bean.PetBean"%>
<%@page import="dao.PetDao"%>
<%@page import="bean.PetCategory_Bean"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adopt a PET</title>





<jsp:include page="home_links.jsp"></jsp:include>
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
<style type="text/css">
label{
color:black;
font-wight:bold;
font-size:20px;
}
ul,table
{
	margin-top: 0px 0px !important;
	margin-bottom: 0px !important;
	margin-left: 0px !important;
	margin-right: 0px !important;
}
.border-curve
{
	border-radius:25px;	
}
.table li,select
{
	margin-bottom: 10px;
	background-color: #FF5722;
}
.table td
{

	padding: 5px;
	margin: 20px;
	text-align: center;
	/* align-items: center;
	align-content: center; */
}
.table img
{
 border: 4px solid #ddd;
  border-radius: 4px;
	height:300px;
  	width: auto;  		
}


.agileits-banner {
	 background: url(../images/adopt_cover1.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }

</style>
<script type="text/javascript">
$(function(){
	$(".table a").click(function()
			{
				
				var imgsrc = $(this).find('img').attr('src');
				var petName= $(this).find('h4').html();
				var id= $(this).find('p:hidden').html();
				var category= $(this).find('p:nth-child(3)').html();
				var breed= $(this).find('p:nth-child(5)').html();
				//var category = $(this).find('img').attr('src');
				//document.write(imgsrc);
				$(this).attr('href',"adopt_form.jsp?selectedPetId="+id+"&imgsrc="+imgsrc+"&petName="+petName+"&category="+category+"&breed="+breed);
			});
	
});		
		
		
	
	</script>
	
</head>
</head>
<body>

 <div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="adopt" name="page"/>
</jsp:include>
</div> 

<div class="container-fluid" style="background:url(images/g6.jpg)no-repeat;
	background-size: cover;">


<%ArrayList<PetBean> petList = new PetDao().getAvailablePets();
ArrayList<PetCategory_Bean> cList = new CategoryDao().getCategories();
%>
<table style="width:100%">
<tr>
<td style="width:30%">
<!-- category breed select table -->
<form id="adoptSearchForm" action="adoptSearch.jsp">
<table class="table" id="linkTable" style="height:100%">
	<tr style="height: 50px;">
	<td>
	<div class="form-group">
		
		<label for="selector1" class="col-sm-4 control-label">Pet Category</label>
		<div class="col-sm-8">
		<select name="pet_category" id="pet_category" class="form-control1" onchange="category_change()">
		<option>---Select Category---</option>
		<% for (int i=0; i<cList.size();i++)
		{
		%>
		<option value=<%=cList.get(i).getCategory_id() %>> <%=cList.get(i).getCategory_name()%> </option>	
		<%}%>
</select></div>
		</div>
		</td>
		 </tr>
		<tr> 
		<td>
											<div class="form-group">
												<label for="selector1" class="col-sm-4 control-label">Pet Breed</label>
												<div class="col-sm-8">
												<select name="breed" id="breed" class="form-control1" >
													<option>---Select Breed----</option>
												</select></div>
											</div>
	
	</td> 
	</tr>
	<tr>
		<td>
			<input type="submit" id="submit_btn" value="Search"  style="height:50px; width:200px; background:#E44F0F; font-size:2em; color:white" /> </td> </tr>
	</table>
	</form>
	<!-- /category select -->
	</td>
	<td style="width:70%">
	<!-- adopt pets -->
	<table class="table">
	
	<% System.out.println("pet list size " + petList.size()); 
	PetBean pet2=null;
	for (int i=0; i<petList.size();i+=2){ 
		System.out.println("i " + i);
		PetBean pet1 = petList.get(i);
		if((petList.size()-1)%2!=0 || (i+1)<petList.size()-1){
		pet2 = petList.get(i+1);}
	%>
	<tr>
	<td >
		
 		<div class="card" style="width: 30rem; text-align:center; margin: 0px auto;">
					<a href="adopt_form.jsp" class="imghvr-hinge-right figure">
						<img src="../images/<%=pet1.getImage1()%>" alt="" title="Pets Care Image"/> 
						
						<div class="agile-figcaption">
						 <h4><%=pet1.getPet_name() %></h4>
						<p hidden="true"> <%=pet1.getPet_id() %> </p>
						 
						  <p><%= pet1.getCategory_Name() %></p> <br/>
						  <p> <%=pet1.getBreed_name() %></p> <br/>
						  <p> AGE: <%=pet1.getAge() %>
						  </p>
						</div>
					</a>
				</div>			
	
	
		
		</td>
		<td >
	<%if(pet2 !=null){ %>
 		<div class="card" style="width: 30rem; text-align:center; margin: 0px auto;">
					<a href="adopt_form.jsp" class="imghvr-hinge-right figure">
						<img src="../images/<%=pet2.getImage1()%>" alt="" title="Pets Care Image"/> 
						<div class="agile-figcaption">
						  <h4><%= pet2.getPet_name() %></h4>
						  <p hidden="true"> <%=pet2.getPet_id() %> </p>
						 
						  <p><%= pet2.getCategory_Name() %></p> <br/>
						  <p> <%=pet2.getBreed_name() %></p> <br/>
						  <p> AGE: <%=pet2.getAge() %>
						  </p>
						  
						</div>
					</a>
				</div>	
				<%} %>		
	
	
		
		</td>
		
	

	</tr>
	<% } %>
	
	
	
	
	</table>
	</td>
	</tr>
</table>
<!-- /adoptpets -->
	
</div>



<!-- <div class="subscribe wthree-sub">
		<div class="container">
			<h4>Subscribe Now</h4>
			<form action="#" method="post">
				<input type="email" name="email" placeholder="Enter your Email..." required="">
				<input type="submit" value="Subscribe">
				<div class="clearfix"> </div>
			</form>
			<div class="w3lsfoter-icons social-icon">
				<a href="#" class="social-button twitter"><i class="fa fa-twitter"></i></a>
				<a href="#" class="social-button facebook"><i class="fa fa-facebook"></i></a>
				<a href="#" class="social-button google"><i class="fa fa-google-plus"></i></a>
				<a href="#" class="social-button dribbble"><i class="fa fa-dribbble"></i></a>
			</div>
		</div>
	</div> -->
	<!-- //subscribe -->
	
	
<!-- copy rights start here -->
	<div class="copy-w3right">
		<div class="container">
			<div class="top-nav bottom-w3lnav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="gallery.jsp">Gallery</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>
		<!--  	<p>© 2017 Pets Care. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p> -->
		</div>
	</div>
	<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
</body>

</html>


<!-- 
		<table class="table table-dark rounded">
			
			<tr>
					<td>
			<ul class="list-group">
			
 					 <li class="list-group-item d-flex justify-content-between align-items-center">
    						DOGS				
   					 <span class="badge badge-primary badge-pill"> &check;</span>
 					 </li></ul>
 				</td>
 				</tr>
 				<tr>
 				<td>
 			<ul class="list-group">
 			 <li class="list-group-item d-flex justify-content-between align-items-center">
  					CATS
    			<span class="badge badge-primary badge-pill">2</span>
 			 </li></ul>
 			 </td></tr> <tr> <td>
 			 <ul class="list-group">
 			 <li class="list-group-item d-flex justify-content-between align-items-center">
   				BIRDS
  			  <span class="badge badge-primary badge-pill">1</span>
			  </li></ul>
			</td>
			
			</tr>
			
		</table>  -->