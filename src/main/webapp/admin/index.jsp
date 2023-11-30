<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<title> JBookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div align="center">
		<h1>Administrative Dashboard</h1>
	</div>
	
	<div align="center">
		<hr width="60%"/>
		<h2>Quick Actions:</h2>
		<b>
			<a href="./new_book">New Book</a>
			<a href="./user_form.jsp">New User</a>
			<a href="./category_form.jsp">New Category</a>
			<a href="./customer_form.jsp">New Customer</a>
		</b>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>