<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer Login</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h2>Customer Login</h2>
			
			<c:if test="${message != null}">
				<h3>${message}</h3>
			</c:if>
			
			<form action="login" method="post">
				<table>
					<tr>
						<td>Email:</td>
						<td><input type="text" name="email" id="email" size="20" required></td>
					</tr>	
					<tr>
						<td>Password:</td>
						<td><input type="password" name="password" id="password" size="20" required></td>
					</tr>	
					<tr>
						<td><button type="submit">Login</button></td>
					</tr>		
				</table>
			</form>
		</div>
	</body>
</html>