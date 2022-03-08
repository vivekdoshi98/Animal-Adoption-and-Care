<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	
	ArrayList<String> dog = new ArrayList<String>();
	dog.add("dog1");
	dog.add("dog2");
	
	
	
String s=request.getParameter("id");
	out.println(s);
	
	if (s.equals("dog"))
	{
		RequestDispatcher rd = request.getRequestDispatcher("adopt.jsp");
		request.setAttribute("animal",dog); // adopt animal = dog 
	
		rd.forward(request, response);
		
	}
%>



</body>
</html>