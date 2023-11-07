<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Login</title>
	</head>
	<body>
		<div align="center">
			<h1>BookStore Adminstration</h1>
			<h2>Admin Login</h2>
			
			<c:if test="${message != null}">
				<h3>${message}</h3>
			</c:if>
			
			<form id="formLogin" action="${pageContext.request.contextPath}/admin/login" method="post">
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