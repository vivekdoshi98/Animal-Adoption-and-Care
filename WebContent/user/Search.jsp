<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>About US</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:include page="home_links.jsp"></jsp:include>
<style type="text/css">
.agileits-banner {
	 background: url(../images/search.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
	 .banner-w3text h2 {
    font-size: 6em;
    letter-spacing: 10px;
    display:none;
}
</style>
<style type="text/css">
.title
{
	font-size: 5em;
	color : red;
	font-family: Impact;
	font-style: italic;
	padding: 20px;
	text-align: center;
	letter-spacing: 5px;
}
tr td
{	
	padding:5px;
	margin-left:20px;
	box-sizing: border-box;
	font-family: sans-serif;
	font-size: 20px;
	
}
.tabcont .label1
{
text-align: center;
}

.tabcont
{
	width: 100%;
	height: 350px;
	border-radius: 10px;
}

.tabcont .buttcont{
		height: 15%
}

.tabcont .buttcont button{
	
	width: 24.85%;
	height: 100%;
	float:center;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 10px;
	font-family: sans-serif;
	background-color: grey;
}

.tabcont .buttcont button:hover{
	background-color: #d7d4d4;
} 

.tabcont .tabpanel{
	
	width: 50%;
	height:85%;
	background-color: gray;
	color: white;
	
	padding-top: 15px;
	padding-bottom: 15px;
	box-sizing: border-box;
	font-family: sans-serif;
	font-size: 20px;
	
}

.feild1{
	float: left;
}

.clin{
	padding-top: 50px;
}
</style>
</head>
<body>
<div class="agileits-banner about-w3banner">
<jsp:include page="header1.jsp">
	<jsp:param value="search" name="page"/>
	</jsp:include>
</div>
<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;">
	<h1 class="title"> SEARCH </h1>	
<div align="center" class="tabcont">
	<div class="buttcont" >
		<button style="font-size: 25px;font-variant:small-caps;" onclick="showPanel(0,'#e57508')"> 			Search Animals</button>
		<button style="font-size: 25px;font-variant:small-caps;" onclick="showPanel(1,'#f44336')"> 			Search Clinics</button> 
		
		<!-- <button data-toggle="collapse" data-target="#Search_animal" data-dismiss="tabpanel"> 		Search Animals</button>
		<button data-toggle="collapse" data-target="#Search_clinic" data-dismiss="tabpanel"> 		Search Clinics</button> -->
		
	</div>
	<div class="collapse tabpanel" id="Search_animal"> 
		<form method="post" id="searchanimal" action="adopt.jsp" >
			<table style="width:100%">
			<tr>
				<td class="label1" style="width:40%">
					Breed : 
				</td>
				<td style="width:60%">
					 <select name="breed" >
									<option value="select"></option>
  									<option value="Dog">Dog</option>
  									<option value="Cat">Cat</option>
  									<option value="Bird">Bird</option>
  									<option value="Other">Other</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="label1">
					Sex : 
				</td>
				<td>
					<select name="sex" >
					<option value="select"></option>
  									<option value="M">Male</option>
  									<option value="F">Female</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td class="label1">
				 	Age:  
				</td>
				<td>
					<select name="age">
					<option value="select"></option>
					<option value="Puppy">Puppy</option>
					<option value="Young">Young</option>
					<option value="Adult">Adult</option>
					<option value="Senior">Senior</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="label1">
					Color :
				</td>
				<td>
					 <select name="color" >
				 			<option value="select"></option>
  							<option value="Black">Black</option>
  							<option value="Brindle">Brindle</option>
  							<option value="Brown">Brown/Chocolate</option>
  							<option value="Grey">Grey/Blue/Silver/Salt/Pepper</option>
  							<option value="Merle">Merle</option>
  							<option value="red">Red/Golden/Orange/Chestnut</option>
  							<option value="silver">Silver & Tan (Yorkie colors)</option>
  							<option value="Tan">Tan/Yellow/Fawn</option>
  							<option value="TriColor">TriColor (Tan Brown & Black & White)/option>
  							<option value="White">White</option>
					</select> 
				</td>
				</tr>
				<tr>
					<td class="label1">
					Size :
					</td>
					<td>
					 	<select name="size" >
									<option value="select"></option>
									<option value="S">Small 11kg or less</option>
  									<option value="M">Medium 12-27kg</option>
  									<option value="L">Large 28-45 kg</option>
  									<option value="XL">X-Large 46kg or more</option>
						</select>
					</td>
				</tr>
				<tr>
				<td colspan="2" style="padding-top:20px;">
				<input type="button" name="search" value="Search" style="margin-left:180px;">
				</td>
			</tr>
				</table>
		</form>
	</div>
	<div class="tabpanel collapse"   class="clin" id="Search_clinic">
		<form> <p></p>
		 <p></p>
		<input type="text" name="Location" size=70 placeholder="Location">
		<p>Breed : <select name="breed" >
									<option value="select"></option>
  									<option value="Dog">Dog</option>
  									<option value="Cat">Cat</option>
  									<option value="Bird">Bird</option>
  									<option value="Other">Other</option>
					</select> </p>
	</form>
	</div>
	
</div>
</div>
<script type="text/javascript">
var tabbutton=document.querySelectorAll(".tabcont .buttcont button");
var tabpanel=document.querySelectorAll(".tabcont .tabpanel");

function showPanel(panelIndex,ColorCode) {
	tabbutton.forEach(function(node){
	node.style.backgroundColor="";
	node.style.color="";
	});
	tabbutton[panelIndex].style.backgroundColor=ColorCode;
	tabbutton[panelIndex].style.color="white";
	tabpanel.forEach(function(node){
		node.style.display="none";
	});
	tabpanel[panelIndex].style.display="block";
	tabpanel[panelIndex].style.backgroundColor=ColorCode;
}

</script>

</body>
</html>