<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Book Order - Evergreen Bookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<fmt:setLocale value="en_US"/>
		<div align="center">
			<h1>Book Order Management</h1>
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
					<th>Order ID</th>
					<th>Ordered By</th>
					<th>Book Copies</th>
					<th>Total</th>
					<th>Payment Method</th>
					<th>Status</th>
					<th>Order Date</th>
					<th>Action</th>
				</tr>
				<c:forEach var="bookOrder" items="${listOrder}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${bookOrder.orderId}</td>
						<td>${bookOrder.customer.fullname}</td>
						<td>${bookOrder.bookCopies}</td>
						<td>$<fmt:formatNumber value="${bookOrder.total + bookOrder.shippingCost}"></fmt:formatNumber></td>
						<td>${bookOrder.paymentMethod}</td>
						<td>${bookOrder.status}</td>
						<td>${bookOrder.orderDate}</td>
						<td>
							<a href="detail_order?orderId=${bookOrder.orderId}">Detail</a> &nbsp;
							<a href="edit_order?orderId=${bookOrder.orderId}">Edit</a> &nbsp;
							<a id="delete_order" href="javascript:delete_order(${bookOrder.orderId})">Delete</a>
							
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script type="text/javascript">
		function delete_order(orderId) {
			if(confirm('Are you sure want to delete this order?')) {
				window.location.href = 'delete_order?orderId=' + orderId;
			}
		}
	</script>
</html>