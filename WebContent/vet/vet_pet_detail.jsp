<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Details</title>
<jsp:include page="vet_header.jsp"></jsp:include>
</head>
<body>
<div class="inner_content">
				   

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="main-page.jsp">Home</a><span>«</span></li>
									<li><a href="show_vet_pets.jsp">Show Pet</a><span>«</span></li>
									
									<li>Pet Details</li>
								</ul>
							</div>
						</div>
						
					<!-- //breadcrumbs -->
		<div class="wthree_general graph-form agile_info_shadow ">
						<h3 class="w3_inner_tittle two">Pet Details</h3>
							<div class="grid-1 ">
								<div class="form-body">
									<form class="form-horizontal">
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet ID:</label>
												<div class="col-sm-8"><textarea name="query_text" id="query_text" cols="15" rows="5" class="form-control1"></textarea></div>
												
											</div>
											
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet Name:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="pet_name" placeholder="" name="pet_name" disabled="">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet Category:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="pet_category" placeholder="" name="pet_category">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Pet Breed:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="pet_breed" placeholder="" name="pet_breed">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Age:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="age" placeholder="" name="age">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Gender:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="gender" placeholder="" name="gender">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Color:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="color" placeholder="" name="color">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Status:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="status" placeholder="" name="status">
												</div>
											</div>
											<div class="form-group">
												<label for="" class="col-sm-2 control-label">Vet Attendant:</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="vet" placeholder="" name="vet">
												</div>
											</div>
											
											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">Health Details:</label>
												<div class="col-sm-8"><textarea name="health_details" id="health_details" cols="50" rows="4" class="form-control1"></textarea></div>
											</div>
										<button type="submit" class="btn btn-warning" onclick="" style='width:100px;margin:0 50%;position:relative;left:-50px;'>SUBMIT</button>
								</form>
							</div>
					</div>
										
											
		</div>			
		
		
		</div>
</body>
</html>