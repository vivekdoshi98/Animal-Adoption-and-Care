<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
	margin:0;
	padding: 0;
	background: url(admin/images/sadpup.jpg);
	background-size: cover;
	font-family: sans-serif;
}

.forgot
{
	position: absolute;
	top:50%;
	left:50%;
	font-family: cursive;
	color: white;
	transform: translate(-50%,-50%);
	padding: 90px 90px;
	width: 450px;
	height: 300px;
	box-sizing: border-box;
	background: rgba(0,0,0,.5);
}

.user
{
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	position: absolute;
	top: calc(-100px/2);
	left: calc(50% - 50px);
	}

h2{
	margin 0;
	padding: 0 0 20px;
	color: white;
}
input
{
    width: 100%;
    padding: 0.8em 0.8em;
    font-size: 1em;
    margin: 1em 0;
    outline: none;
    color: #888;
    border: none;
    border: 1px solid #b9c0c3;
    letter-spacing: 1px;
    text-align: center;
}
}
</style>
</head>
<body>
<div class="forgot">
			<img src="admin/images/aac_logo_t1.jpg" class="user">
			<h2 style="padding-left: 7%"> Set New Password </h2>
			
			<form class="my" action="ForgotPassword">
				<p align="center">Email </p>
				<p align="center">
				<input type="text" size="40" name="email" placeholder="Enter the email id"></p>
				<!--<p>Password</p>
				<input type="password" name="" placeholder="****">-->
			<p align="center">	<input type="submit" style="font-family: cursive; " name="" value="Send Details"></p>
				</form>
				
		</div>

</body>
</html>