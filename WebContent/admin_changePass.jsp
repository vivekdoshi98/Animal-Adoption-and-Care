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
	background: url(admin/images/happyk.jpg);
	background-size: cover;
	font-family: sans-serif;
}

.change
{
	font-size: 20px;
	position: absolute;
	top:45%;
	left:50%;
	font-family: cursive;
	color: white;
	transform: translate(-50%,-50%);
	padding: 60px 90px;
	width: 450px;
	height: 450px;
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

.h2{
	margin 0;
	padding: 0 0 20px;
	color: white;
}
.tb{
	height:40px;
	
}
.btn{
	height: 50px; 
	width: 150px; 
	background-blend-mode: color; 
	font-family: cursive;
	background-color:#f44336;
	border:none;
	color:white;
}
</style>
</head>
<body>

<div class="change">
			<img src="admin/images/aac_logo_t1.jpg" class="user">
			<h2  align="center"> Change Password </h2>
			<form>
				
				<p align="center"><input type="password" size="40" class="tb" name="" placeholder="Enter the Old password"></p>

				<p align="center"><input type="password" size="40" class="tb" name="" placeholder="Enter the New password"></p>

				<p align="center"><input type="password" size="40"  class="tb" name="" placeholder="Confirm the New password"></p>

				<!--<p>Password</p>
				<input type="password" name="" placeholder="****">-->
			<p align="center">	<input type="submit" class="btn"  name="" value="Change Password"></p>
				</form>
		</div>

</body>
</html>