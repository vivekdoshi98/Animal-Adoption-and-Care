<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Query</title>
<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
<style type="text/css">
#bg
{	
	text-align: center;
	
	background-position:10% 50%; 
	background-size: cover;
	margin-bottom:0px;
	height: 500px;
	
	
}

h2
{
	color: #FF5733;
	
  	text-align: center;
  	font-size: 6em;
  		padding: 20px;
	
	letter-spacing: 5px;
}
  label{
  	font-family: sans-serif;
  	color: rgb(255, 87, 34);
  	color:white !important;
  	font-size: 18px;
  	
  }
 .my_container
{
	position: relative;
	top: 50%;
	left: 50%;
	font-family: cursive;
	color: white;
	transform: translate(-50%);
	padding: 90px 90px;
	width: 80%;
	height: 300px;
	box-sizing: border-box;
	background: rgba(0,0,0,.6);
}
.aac_logo
{
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	position: absolute;
	top: calc(-100px/2);
	left: calc(50% - 50px);
	}
	
textarea{
font-size:1.5em !important;
}
	
</style>
</head>
<body style="background: url(images/dal.jpg)no-repeat center 0px;
	 background-position: 50% 22%; background-size: cover">

<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="Contact" name="page"/>
</jsp:include>
</div> 
<div class="grid_3 grid_4" id="bg">
	<h2 class="w3ls-hdg" style="color: #FF5722;font-size: 5em;padding:50px; -webkit-text-stroke: 2px black;">Query</h2>
	<div class="tab-content">
		
				
		<div class="my_container">
			<img src="../admin/images/aac_logo_t1.jpg" class="aac_logo">
		<div class="tab-pane active" id="horizontal-form">
		
			<form class="form-horizontal" id="query_form">
			<div class="form-group">
					<label for="radio" class="col-sm-4 control-label">Query Type:</label>
					<div class="col-sm-8" style="text-align:center">
						<div class="radio-inline"><label><input type="radio" name="query_type" value="H"> Health Care related Query</label></div>
						<div class="radio-inline"><label><input type="radio" name="query_type" value="N"> Non Health Care related Query</label></div>
					</div>
				</div>
				<div class="form-group">
					<label for="txtarea1" class="col-sm-4 control-label">Query:</label>
					<div class="col-sm-8">
					<textarea name="query_text" id="query_text" cols="3	0" rows="8" class="form-control1"></textarea><span class="err_msg" id="query_err" style="font-weight:bold"> </span></div>
				</div>
				<input type="submit" id="submit_btn" value="SUBMIT"  style="height:50px; width:200px; background:#E44F0F; color:white" />
			</form> 
		</div>
	</div>
</div>
</div>

	<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	
	 <script type="text/javascript">
  $(function(){
	  $("#query_err").hide();
	  
	  var p_query=false;
	  $("#query_text").focusout(function(){
			var q=$("#query_text").val().length;
			
			if(q==0)
			{
				$("#query_err").html("Please write your query");
				$("#query_err").show();
				//$("#status").css("border-color","red");
				p_query=false;
			}
			else
			{ 
				$("#query_err").hide();
				//$("#status").css("border-color","#ddd");
				p_query=true;
			}
		});
	  $("#submit_btn").click(function(){
		  
		 if(p_query == true)
			 {
			 	$("#query_form").attr('action','../InsertQuery');
			 	$("#query_form").submit();
			 }
		 else
			 {
			 	alert("Form has errors");
			 }
		 
		  
	  });
  });
	</script>
</body>
</html>