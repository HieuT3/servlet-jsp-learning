<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.bookstore.controller.frontend.shoppingcart.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shopping Cart</title>
		<style type="text/css">
			td {
				text-align: center;
			}
			i {
			 cursor: pointer;
			}
		</style>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h2>Your Cart Details</h2>
			<c:set var="cart" value="${sessionScope.cart}"></c:set>
			<c:if test="${cart == null || cart.getTotalQuantity() == 0}">
				<h1>Your cart is empty. Keep shopping to find a product!</h1>
			</c:if>
			<c:if test="${cart.getTotalQuantity() > 0}">
				<c:set var="items" value="${cart.getItems()}"></c:set>
				<div align="center">
					<table border="1px solid" cellpadding="5">
						<tr>
							<th>No</th>
							<th>Book</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
							<th><a href="clear_cart">Clear Cart</a></th>
						</tr>
				 		<c:forEach var="item" items="${items}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td width="300px">
									<img src="data:image/jpg;base64,${item.key.base64Image}" width="84" height="110" />
									<h4>${item.key.title}</h4>
								</td>
								<td>
									<div class="minus-btn" data-item="${item.key.bookId}" style="display: inline-block;">
										<i class="fa fa-minus" aria-hidden="true"></i>
									</div> 
									<div style="display: inline-block;">
										<p class="quantity${item.key.bookId}">${item.value}</p>
									</div>
									<div class="add-btn" data-item="${item.key.bookId}" style="display: inline-block;">
										<i class="fa fa-plus" aria-hidden="true"></i>
									</div> 
									</td>
								<td>$${item.key.price}</td>
								<td>$<fmt:formatNumber value="${item.key.price * item.value}" type="number" pattern="#,##0.00"></fmt:formatNumber></td>
								<td>
									<button data-item="${item.key.bookId}" class="delete-btn">Remove</button>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2"></td>
							<td>${cart.getTotalQuantity()} book(s)</td>
							<td colspan="3"> Total: $<fmt:formatNumber value="${cart.getTotalAmount()}" type="number" pattern="#,##0.00"></fmt:formatNumber></td>
						</tr>
					</table>
					<br> <br>
					<a href="checkout">Checkout</a>
				</div>
				
			</c:if>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="./js/cart.js"></script>
</html>