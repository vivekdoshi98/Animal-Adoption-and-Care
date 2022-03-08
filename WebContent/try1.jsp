<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width">
</head>
<body>
<form action="checkEmail.jsp" method="POST">
<!-- Note that the amount is in paise = 50 INR -->
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="rzp_test_juC2mpj79nAsIM"
    data-amount="500"
    data-buttontext="Pay with Razorpay"
    data-name="Animal Adoption and Care"
    data-description="Donating to the cause"
    data-image="E:\TY PROJ\Template\AAC\WebContent\images\aac_logo_t1.jpg"
    data-prefill.name=""
    data-prefill.email=""
    data-theme.color="#F37254"
></script>
<input type="hidden" value="Hidden Element" name="hidden">
</form>
<!--  <form action="AdmitPetServlet" method="post" enctype="multipart/form-data">
<input type="file" name="pet_image"/>

<input type="submit"> -->

</body>
</html>