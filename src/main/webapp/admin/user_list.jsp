<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Users - JBookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Users Management</h1>
			<h3><a href="user_form.jsp">Create new User</a></h3>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if>
		
		<div align="center">
			<table border="1px solid" cellpadding="5">
				<tr>
					<th>Index</th>
					<th>Id</th>
					<th>Email</th>
					<th>Full Name</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="user" items="${listUsers}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${user.userId}</td>
						<td>${user.email}</td>
						<td>${user.fullName}</td>
						<td>
							<a href="edit_user?id=${user.userId}">Edit</a> &nbsp;
							<a id="delete_user" href="javascript:deleteUser(${user.userId})">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="/BookStoreWeb/js/user.js"></script>
</html>