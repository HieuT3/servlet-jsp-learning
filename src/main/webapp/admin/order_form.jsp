<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Order - Evergreen Bookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Edit Order ID: ${bookOrder.orderId}</h1>
		</div>
		<form action="update_order" method="post">
			<div align="center">
				<table style="border: none;" cellpadding="5">
					<tr>
						<td>Ordered By:</td>
						<td>${bookOrder.customer.fullname}</td>
					</tr>
					<tr>
						<td>Order Date:</td>
						<td>${bookOrder.orderDate}</td>
					</tr>
					<tr>
						<td>Recipient Name:</td>
						<td><input type="text" name="recipientName" value="${bookOrder.recipientName}"></td>
					</tr>
					<tr>
						<td>Recipient Phone:</td>
						<td><input type="text" name="recipientPhone" value="${bookOrder.recipientPhone}"></td>
					</tr>
					<tr>
						<td>Ship to:</td>
						<td><input type="text" name="shippingAddress" value="${bookOrder.shippingAddress}"></td>
					</tr>
					<tr>
						<td>Payment Method:</td>
						<td>
							<select>
								<option>${bookOrder.paymentMethod}</option>	
							</select>
						</td>
					</tr>
					<tr>
						<td>Order status:</td>
						<td>	
							<select>
								<option>Processing</option>
								<option>Shipping</option>
								<option>Completed</option>
								<option>Canceled</option>
							</select>
						</td>
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
						<th><a href="">Add Books</a></th>
					</tr>
					<c:forEach var="order" items="${bookOrder.orderDetails}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>
								<h4>${order.book.title}</h4>
							</td>
							<td>${order.book.author}</td>
							<td>$<fmt:formatNumber value="${order.book.price}"></fmt:formatNumber></td>
							<td><input type="text" name="quantity" value="${order.quantity}" size="5"></td>
							<td>$<fmt:formatNumber value="${order.subtotal}"></fmt:formatNumber></td>
							<td><a href="">Remove</a></td>
						</tr>
					</c:forEach>
						<tr>
							<td align="right" colspan="4">TOTAL:</td>
							<td>${bookOrder.bookCopies}</td>
							<td>$<fmt:formatNumber value="${bookOrder.total}"></fmt:formatNumber></td>
						</tr>
				</table>
			</div>
			&nbsp; &nbsp; &nbsp;
			<div align="center">
				<input type="submit" value="Save">
				&nbsp; &nbsp; &nbsp;	
				<input type="button" value="Cancel">
			</div>
		</form>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>