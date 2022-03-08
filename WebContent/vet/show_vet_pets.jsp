<%@page import="dao.PetDao"%>
<%@page import="bean.PetBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show pets</title>
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
									
									<li>Show Pets</li>
								</ul>
							</div>
						</div>
					<div class="inner_content_w3_agile_info">
						<div class="agile_top_w3_grids">
						<h3 class="w3_inner_tittle two">PETS</h3>
						<form action="vet_pet_detail.jsp" method="post">
						<button type = "submit" class = "btn btn-warning">UPDATE PET DETAILS</button>
						</form>
						</div>
						</div>
			</div>
			<% ArrayList<PetBean> petList = new PetDao().getAllPets(); %>
			<div class="inner_content">	
		<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <!-- <th>Pet ID</th>
                 -->
                 <th>Pet Name</th>
                <th>Pet Category</th>
                <th>Pet Breed</th>
                <th>Age</th>
                <th>Health</th>
                <th>Vet Attended </th>
                <th> Image </th>
                <th>Edit</th>
            </tr>
            
        </thead>
        <tbody>
        		<% for (int i=0;i<petList.size();i++)
        		{
        			PetBean p = petList.get(i);	
        			
        		%>
        		<tr>
        			<%-- <td><%=p.getPet_id() %></td> --%>
        			<td><%=p.getPet_name() %></td>
        			<td><%=p.getCategory_Name()%></td>
        			<td> <%=p.getBreed_name() %> </td>
        			<td> <%=p.getAge() %></td>
        			<td> <%=p.getHealth_details() %></td>
        			<td> <%=p.getVet_name() %></td>
        			<td> <img src="../images/<%=p.getImage1()%>" height=150px width=150px alt=<%=p.getImage1() %>> </td>
        			<td> <a href="vet_edit_pet.jsp?id=<%=p.getPet_id()%>">Click to edit</a></td>
        		
        		</tr>	
        			
        			
        			
        			<%} %>
        </tbody>
        </table>
        </div>
</div>
</body>
</html>