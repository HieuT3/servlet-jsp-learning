<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Customers - Evergreen Bookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Customers Management</h1>
			<h3><a href="customer_form.jsp">Create new Customer</a></h3>
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
					<th>E-mail</th>
					<th>Full Name</th>
					<th>Registered Date</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="customer" items="${listCus}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${customer.customerId}</td>
						<td>${customer.email}</td>
						<td>${customer.fullname}</td>
						<td>${customer.registerDate}</td>
						<td>
							<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp;
							<a id="delete_customer" href="#" data="${customer.customerId}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script src="../js/customer.js"></script>
</html>