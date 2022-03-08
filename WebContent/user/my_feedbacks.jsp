<%@page import="javax.mail.Session"%>
<%@page import="dao.FeedbackDao"%>
<%@page import="bean.Feedback"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Feedback</title>

<jsp:include page="home_links.jsp"></jsp:include>
<style type="text/css">
.agileits-banner {
	 background: url(../images/adopt_cover.jpg)no-repeat center 0px;
	 background-position: 50% 32%;
	
	 }
  </style>
   <style>
table { 
width:80%;
margin:auto;
border: 1px solid grey;
border-collapse:collapse;
text-align:center;
font-size:30px;
table-layout:fixed;
color:orange;   
margin-top:100px;
}
td {
color:white !important;
border-color:grey !important;
border:1px solid #FFFFFF;
font-family:"roboto",serif;
padding:5px !important;
width:35%;
}

</style>
  
</head>
<body>

<%
	int id=(Integer)session.getAttribute("id");
	ArrayList<Feedback> qList = new ArrayList<Feedback>();
	qList = new FeedbackDao().getUserFeedback(id);
					  
%>
<div class="agileits-banner about-w3banner">
<jsp:include page="myHeader.jsp">
	<jsp:param value="donation" name="page"/>
</jsp:include>
</div> 
<script src="js/SmoothScroll.min.js"></script>
<jsp:include page="home_scripts.jsp"></jsp:include>
<div class="container-fluid" style="background:url(images/a1.jpg) no-repeat;
    background-size: cover;
    min-height: 630px;
    padding-top: 6em;" > 
<div class="grid_3 grid_4">

			<h2 style="color: #FF5722; font-size:5em;">Your Feedbacks</h2>
			<table> 
			<% for (int i=0; i<qList.size(); i++)
        		{
        		Feedback qb = qList.get(i);
        			
        	%>
<tr style="background:black 0.5;">
<td  style="text-align:center;font-family:roboto" colspan=2> MY FEEDBACKS: </td>  
 
 </tr>
 	<tr><td> FEEDBACK DATE : </td> 
 	<td><%=qb.getFeedback_date().substring(0,11) %></td> 
 	</tr>
 	<tr>
 	<td> FEEDBACK TITLES : </td>
 	<td><%=qb.getFeedback_text() %></td>
 	</tr>
 	<%} %>
  </table>
	</div>
</div>

</body>
</html>