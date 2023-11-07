<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My Orders</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>My Orders</h1>
		</div>
			<div align="center">
				<c:if test="${fn:length(listOrder) == 0}">
					<h2>You have not placed any orders.</h2>
				</c:if>
				<c:if test="${fn:length(listOrder) > 0}">
					<table border="1px solid" cellpadding="5">
						<tr>
							<th>Index</th>
							<th>Order ID</th>
							<th>Quantity</th>
							<th>Total Amount</th>
							<th>Order Date</th>
							<th>Status</th>
							<th></th>
						</tr>
						<c:forEach var="order" items="${listOrder}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${order.orderId}</td>
								<td>${order.bookCopies}</td>
								<td>$${order.total}</td>
								<td>${order.orderDate}</td>
								<td>${order.status}</td>
								<td><a href="view_detail_order?orderId=${order.orderId}">View Detail</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>