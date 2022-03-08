<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Financial donations</title>

<jsp:include page="home_links.jsp"></jsp:include>
<jsp:include page="home_scripts.jsp"></jsp:include>
	<script src="js/SmoothScroll.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	
  <style type="text/css">
  .form-group input,select
  {
  	float:left;
  }

  .form-group img
  {
  		height:50px;
  		width: 50px;
  		float: none;
  		border-radius:10px;
  		margin-right:20px;
  }
  h2,h3
  {
  	color: #FF5722;
  	text-align: center;
  	font-size: 6em;
  		padding: 20px;

	letter-spacing: 5px;
  }
  label
  {
  	font-family: sans-serif;
  	color: rgb(255, 87, 34);
  	color: black !important;
  	font-size: 18px;
  	
  }
  
.agileits-banner {
	 background: url(../images/adopt_cover1.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
	
  </style>
</head>
<body>


<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="Services" name="page"/>
</jsp:include>
</div> 
<div class="container-fluid" style="
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">
				<h2 style="color: #FF5722; font-size:5em;">Financial Donation</h2>
<div class="tab-content" >
					<div class="tab-pane active" id="horizontal-form">
						
						
<!-- Note that the amount is in paise = 50 INR -->
<form class="form-horizontal" id="fin_form" action="../InsertFinancialDonation" method="POST">
						 
						
						<div class="form-group">
								<div class="col-sm-10">
							<div class="form-group" style="text-align:right">
								<label  class="col-sm-4 control-label">Payment Amount</label>
								<div class="col-sm-8">
									<input type="text" name="payment_amount" class="form-control1" placeholder="More the merrier" id="amount"/> <span class="err_msg" id="amt_err"> </span>
								</div>
							</div>
					
           					<br/> <br/>
           				<div class="form-group">
					<label for="radio" class="col-sm-4 control-label"></label>
					
					<div class="col-sm-8" >
					
						<!-- <div class="radio-inline"><label> <input type="radio" name="payment_type" id="credit"><i class="fa fa-credit-card"></i> Credit Card</label></div>
						<div class="radio-inline"><label><input type="radio" name="payment_type" id="debit"><i class="fa fa-credit-card">  </i> Debit Card</label></div>
						 --><span class="err_msg" id="type_err"> </span>
						<img src="images/visa.png" alt="Visa" title=""/>
						<img src="images/master.png" alt="Master" title=""/>
					</div>
					
					<div class="col-md-4"></div>
					<div class="col-md-7 contact-right" style="text-align:center"> </div>
		
					
					<!-- <table>
						<tr>
							<td style="text-align:center;">
							<br/> <br/> -->
							
	
<input type="hidden" value="Hidden Element" name="hidden">
				
							<!-- </td>
						</tr>
					</table> -->
					<!-- <button type="Submit" class="form-control1 list-group-item list-group-item-action active"
  											style="background-color:#FF5722;
  											font-family: sans-serif;
  											margin-top: 20px;
  												font-size: 18px;"
  												id="submit_btn">
  												
										DONATE NOW
  										<input type="hidden" value="Hidden Element" name="hidden">
  									</button> -->
				</div>
				</div>
				</div>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="rzp_test_juC2mpj79nAsIM"
    data-amount="1500000"
    data-buttontext="Donate Now"
    data-name="Animal Adoption and Care"
    data-description="Donating to the cause"
    data-image="E:\TY PROJ\Template\AAC\WebContent\images\aac_logo_t1.jpg"
    data-prefill.name=""
    data-prefill.email=""
    data-theme.color="#F37254"
></script>
				
				
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
			var err_amt=false;
			$("#amount").focusout(function(){
				var amt=$("#amount").val();
				var pat1=/^[0-9]+$/;
				if(!pat1.test(amt))
				{
					$("#amt_err").html("Please enter valid amount.");
					$("#amt_err").show();
					err_amt=false;
				}
				else
				{ 
					$("#amt_err").hide();
					err_amt=true;
				}
			});
			 $("#submit_btn").click(function(){
				 if(err_amt==true)
					 {
					 $("#fin_form").attr('action','../try.jsp');
					 	$("#fin_form").submit();
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
