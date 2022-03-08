<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Animal Adoption and Care</title>
<jsp:include page="home_links.jsp"></jsp:include>
<!-- //web-fonts -->
</head>
<style type="text/css">
.agileits-banner {
	 background: url(../user/images/a.jpg)no-repeat center 0px;
	 }
</style>
<body>
	
	<div class="agileits-banner">

		<jsp:include page="header1.jsp">
			<jsp:param value="logout" name="page" />

		</jsp:include>
		
		<jsp:include page="home_scripts.jsp"></jsp:include>

	<script src="js/easy-responsive-tabs.js"></script>
</div>
</body>
</html>