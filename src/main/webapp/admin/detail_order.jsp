<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Order details - Evergreen Bookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Details of Order ID: ${bookOrder.orderId}</h1>
		</div>
		
		<div align="center">
			<h2>Order Overview:</h2>
			<table border="1px solid" cellpadding="5">
				<tr>
					<td>Ordered By:</td>
					<td>${bookOrder.customer.fullname}</td>
				</tr>
				<tr>
					<td>Book Copies:</td>
					<td>${bookOrder.bookCopies}</td>
				</tr>
				<tr>
					<td>Total Amount:</td>
					<td>$${bookOrder.total}</td>
				</tr>
				<tr>
					<td>Recipient Name:</td>
					<td>${bookOrder.recipientName}</td>
				</tr>
				<tr>
					<td>Recipient Phone:</td>
					<td>${bookOrder.recipientPhone}</td>
				</tr>
				<tr>
					<td>Ship to:</td>
					<td>${bookOrder.shippingAddress}</td>
				</tr>
				<tr>
					<td>Payment Method</td>
					<td>${bookOrder.paymentMethod}</td>
				</tr>
				<tr>
					<td>Order Status:</td>
					<td>${bookOrder.status}</td>
				</tr>
				<tr>
					<td>Order Date:</td>
					<td>${bookOrder.orderDate}</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<h2>Ordered Books:</h2>
			<table border="1px solid" cellpadding="5">
				<tr>
					<th>Index</th>
					<th>Book Title</th>
					<th>Author</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Sub Total</th>
				</tr>
				<c:forEach var="order" items="${bookOrder.orderDetails}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${order.book.title}</td>
						<td>${order.book.author}</td>
						<td>$${order.book.price}</td>
						<td>${order.quantity}</td>
						<td>$<fmt:formatNumber value="${order.quantity * order.book.price}"></fmt:formatNumber></td>
					</tr>
				</c:forEach>
					<tr>
						<td align="right" colspan="4">TOTAL:</td>
						<td>${bookOrder.bookCopies}</td>
						<td><fmt:formatNumber value="${bookOrder.total}"></fmt:formatNumber></td>
					</tr>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>