<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
<form action="ReportDonationByUsers">
<input type="text" name="category_id"/>
<input type="text" id="datepicker1" name="datepicker1"/>
<input type="text" id="datepicker2" name="datepicker2"/>

<input type="submit">
</form>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 							
<script>
$("#datepicker1").datepicker({dateFormat:'dd/mm/yy'});
$("#datepicker2").datepicker({dateFormat:'dd/mm/yy'});
 </script>
</body>
</html>