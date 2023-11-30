<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:if test="${customer != null}">
			<title>Edit Customer</title>
		</c:if>
		<c:if test="${customer == null}">
			<title>Create New Customer</title>
		</c:if>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
		<c:set var="action" value="null" ></c:set>
			<c:if test="${customer != null}">
				<h1>Edit Customer</h1>
				<c:set var="action" value="update_customer" ></c:set>
			</c:if>
			<c:if test="${customer == null}">
				<h1>Create New Customer</h1>
				<c:set var="action" value="create_customer" ></c:set>
			</c:if>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if>
		
		<div id="message" align="center" style="display: none;">
			<h3 id="message_content"></h3>
		</div>
		
		<div align="center">
			<form action="${action}" id="register_form" method="POST">
			<input type="hidden" name="id" value="${customer.customerId}">
				<table>
					<tr>
						<td align="right">E-mail Address:</td>
						<td align="left"><input type="text" id="email" name="email" size="20" value="${customer.email}" required/></td> 
					</tr>
					<tr>
						<td align="right">Full Name:</td>
						<td align="left"><input type="text" id="fullname" name="fullname" size="20" value="${customer.fullname}" required/></td> 
					</tr>
					<tr>
						<td align="right">Password:</td>
						<td align="left"><input type="password" id="password" name="password" size="20" value="${customer.password}" required/></td> 
					</tr>
					<tr>
						<td align="right">Confirm Password:</td>
						<td align="left"><input type="password" id="rePassword" name="rePassword" size="20" value="${customer.password}" required/></td> 
					</tr>
					<tr>
						<td align="right">Phone Number:</td>
						<td align="left"><input type="text" id="phone" name="phone" size="20" value="${customer.phone}" required/></td> 
					</tr>
					<tr>
						<td align="right">Address:</td>
						<td align="left"><input type="text" id="address" name="address" size="20" value="${customer.address}" required/></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<c:if test="${customer != null}">
								<input type="submit" value="Save" />
							</c:if>
							<c:if test="${customer == null}">
								<input type="submit" value="Create" />
							</c:if>
							<input type="button" value="Cancel" onclick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
		
	</body>
	
	<script src="../js/home.js"></script>
	<script type="text/javascript">
	</script>
	
</html>