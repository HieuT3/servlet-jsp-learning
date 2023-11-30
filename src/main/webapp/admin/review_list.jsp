<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Review - JBookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Review Management</h1>
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
					<th>Book</th>
					<th>Rating</th>
					<th>headline</th>
					<th>Customer</th>
					<th>Review On</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="review" items="${listReview}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${review.reviewId}</td>
						<td>${review.book.title}</td>
						<td>${review.rating}</td>
						<td>${review.headline}</td>
						<td>${review.customer.fullname}</td>
						<td>${review.reviewTime}</td>
						<td>
							<a href="edit_review?id=${review.reviewId}">Edit</a> &nbsp;
							<a href="javascript:deleteReview(${review.reviewId})">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="../js/review.js"></script>
</html>