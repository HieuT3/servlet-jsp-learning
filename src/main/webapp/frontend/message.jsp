<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Evergreen Books - Online Books Store</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<br/>
		<div align="center">
			<h2>${message}</h2>
			<a href="login">Click here to login!</a>
		</div>
	
		<jsp:include page="footer.jsp"></jsp:include>
	</body>

</html>