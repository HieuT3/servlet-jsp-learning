<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Checkout</title>
		<style type="text/css">
			#cart td {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Reviews Your Order Details</h1>
		</div>
		
		<div align="center">
			<c:set var="cart" value="${sessionScope.cart}"></c:set>
			<c:set var="customer" value="${sessionScope.loggedCustomer}"></c:set>
			<table id="cart" border="1px solid" cellpadding="5">
				<tr>
					<th>No</th>
					<th>Book</th>
					<th>Author</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Sub Total</th>
				</tr>
				<c:forEach var="item" items="${cart.getItems()}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td width="300px">
							<img src="data:image/jpg;base64,${item.key.base64Image}" width="84" height="110" />
							<h4>${item.key.title}</h4>
						</td>
						<td>${item.key.author}</td>
						<td>$${item.key.price}</td>
						<td>${item.value}</td>
						<td>$<fmt:formatNumber value="${item.key.price * item.value}"></fmt:formatNumber></td>
					</tr>
				</c:forEach>
					<tr>
						<td align="right" colspan="4">TOTAL:</td>
						<td>${cart.getTotalQuantity()}</td>
						<td>$<fmt:formatNumber value="${cart.getTotalAmount()}" minFractionDigits="2"></fmt:formatNumber></td>
					</tr>
			</table>
			<br>
			<h1>Your Shipping Information:</h1>
			<form action="place_order" method="post">
				<table>
					<tr>
						<td align="right">Recipient Name:</td>
						<td align="left"><input type="text" id="fullname" name="fullname" size="20" value="${customer.fullname}" required/></td> 
					</tr>
					<tr>
						<td align="right">Recipient Phone:</td>
						<td align="left"><input type="text" id="phone" name="phone" size="20" value="${customer.phone}" required/></td> 
					</tr>
					<tr>
						<td align="right">Street Address:</td>
						<td align="left"><input type="text" id="address" name="address" size="20" value="${customer.address}"  required/></td> 
					</tr>
					<tr>
						<td align="right">City:</td>
						<td align="left"><input type="text" id="city" name="city" size="20" value="${customer.city}" required/></td> 
					</tr>
					<tr>
						<td align="right">Zipcode:</td>
						<td align="left"><input type="text" id="zipcode" name="zipcode" size="20" value="${customer.zipcode}" required/></td> 
					</tr>
					<tr>
						<td align="right">Country:</td>
						<td align="left"><input type="text" id="country" name="country" size="20" value="${customer.country}" required/></td> 
					</tr>
				</table>
				&nbsp; &nbsp; &nbsp;
				<h2>Payment:</h2>
				<label>Chose your payment method:</label>
				<select>
					<option>Cash On Delivery</option>
				</select>
				<br> <br>
				<input type="submit" value="Place Order">
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>