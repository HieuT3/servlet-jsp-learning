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
			<h1>Edit My Profile</h1>
		</div>
		
		<div id="message" align="center" style="display: none;">
			<h3 id="message_content"></h3>
		</div>
		
		<div align="center">
			<form action="update_profile" id="update_form" method="post">
				<table>
					<tr>
						<td>E-mail Address:</td>
						<td><b>${loggedCustomer.email}</b>(Cannot be changed)</td> 
					</tr>
					<tr>
						<td>Full Name:</td>
						<td><input type="text" name="fullname" value="${loggedCustomer.fullname}" required></td> 
					</tr>
					<tr>
						<td>Phone Number:</td>
						<td><input type="text" name="phone" value="${loggedCustomer.phone}" required></td> 
					</tr>
					<tr>
						<td>Address:</td>
						<td><input type="text" name="address" value="${loggedCustomer.address}" required></td> 
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" name="city" value="${loggedCustomer.city}" required></td> 
					</tr>
					<tr>
						<td>Zipcode:</td>
						<td><input type="text" name="zipcode" value="${loggedCustomer.zipcode}" required></td> 
					</tr>
					<tr>
						<td>Country:</td>
						<td><input type="text" name="country" value="${loggedCustomer.country}" required></td> 
					</tr>
					<tr>
						<td colspan="2"><i>(leave password fields blank if you don't want to change password)</i></td>
					</tr>
					<tr>
						<td>New Password:</td>
						<td><input type="password" id="password" name="password"></td> 
					</tr>
					<tr>
						<td>Confirm New Password:</td>
						<td><input type="password" id="rePassword" name="rePassword"></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Save"/>
							<input type="button" value="Cancel" onclick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="./js/home.js"></script>
</html>