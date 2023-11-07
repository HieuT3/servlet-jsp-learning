<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Profile Management</title>
		<style type="text/css">
			td {
				padding: 3px 8px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Profile Management</h1>
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
			<h2>Welcome, ${loggedCustomer.fullname}</h2>
			<table>
				<tr>
					<td><b>E-mail Address:</b></td>
					<td>${loggedCustomer.email}</td> 
				</tr>
				<tr>
					<td><b>Full Name:</b></td>
					<td>${loggedCustomer.fullname}</td> 
				</tr>
				<tr>
					<td><b>Phone Number:</b></td>
					<td>${loggedCustomer.phone}</td> 
				</tr>
				<tr>
					<td><b>Address:</b></td>
					<td>${loggedCustomer.address}</td> 
				</tr>
				<tr>
					<td><b>City:</b></td>
					<td>${loggedCustomer.city}</td> 
				</tr>
				<tr>
					<td><b>Zipcode:</b></td>
					<td>${loggedCustomer.zipcode}</td> 
				</tr>
				<tr>
					<td><b>Country:</b></td>
					<td>${loggedCustomer.country}</td> 
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td colspan="2" align="center"><a href="edit_profile">Edit My Profile</a></td>
				</tr>
			</table>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>

</html>