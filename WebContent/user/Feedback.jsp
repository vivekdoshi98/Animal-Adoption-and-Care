<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
<style type="text/css">
.agileits-banner {
	 background: url(../user/images/birdie.jpg) no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
  </style>
<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="../user/css/styles.css">
  
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="Contact" name="page"/>
</jsp:include>
</div> 
<div class="container-fluid" style="background:url(images/shifu.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
	<div class="grid_3 grid_4" style="postion:relative;top:500px">
		<div class="tab-content" >
		
			<form class="tab-pane active" id="feedback_form" >
				<div class="wrapper">
					<div class="contact-form">
						<div class="title">Feedback by Hooman</div>
							<div class="input-fields">
								<div class="items">
									<label for="msg" class="label">message</label>
									<textarea id="feedback_text" class="text-area" name="feedback_text">
									
									</textarea> <span class="err_msg" id="feedback_err"> </span>
								</div>
							</div>
						<div class="btn" id="submit_btn">SUBMIT</div>
					</div>
				</div>				
			
			</form>
		</div>
	</div>
</div>		 
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
  $(function(){
	  $("#feedback_err").hide();
	  
	  var p_feedback=false;
	  $("#feedback_text").focusout(function(){
			var f=$("#feedback_text").val().length;
			
			if(f==0)
			{
				$("#feedback_err").html("Please write your feedback");
				$("#feedback_err").show();
				//$("#status").css("border-color","red");
				p_feedback=false;
			}
			else
			{ 
				$("#feedback_err").hide();
				//$("#status").css("border-color","#ddd");
				p_feedback=true;
			}
		});
	   $("#submit_btn").click(function(){
		 if(p_feedback==true)
			 {
			 $("#feedback_form").attr('action','../InsertFeedback');
			 	$("#feedback_form").submit();
			 }
		 else
			 {
			 alert("Form have error");
			 }
		  
	  }); 
  });
	</script> 							

				
</body>
</html>
