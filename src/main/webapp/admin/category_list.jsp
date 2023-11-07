<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Category - Evergreen Bookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Category Management</h1>
			<h3><a href="category_form.jsp">Create new Category</a></h3>
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
					<th>Name</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="category" items="${list}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${category.categoryId}</td>
						<td>${category.name}</td>
						<td>
							<a href="edit_category?id=${category.categoryId}">Edit</a> &nbsp;
							<a href="javascript:deleteCategory(${category.categoryId})">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script src="/BookStoreWeb/js/category.js"></script>
</html>