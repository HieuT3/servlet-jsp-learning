<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register New Customer</title>
			
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Register New Customer</h1>
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
			<form action="register_customer" id="register_form" method="POST">
				<table>
					<tr>
						<td align="right">E-mail Address:</td>
						<td align="left"><input type="text" id="email" name="email" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Full Name:</td>
						<td align="left"><input type="text" id="fullname" name="fullname" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Password:</td>
						<td align="left"><input type="password" id="password" name="password" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Confirm Password:</td>
						<td align="left"><input type="password" id="rePassword" name="rePassword" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Phone Number:</td>
						<td align="left"><input type="text" id="phone" name="phone" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Address:</td>
						<td align="left"><input type="text" id="address" name="address" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">City:</td>
						<td align="left"><input type="text" id="city" name="city" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Zipcode:</td>
						<td align="left"><input type="text" id="zipcode" name="zipcode" size="20" required/></td> 
					</tr>
					<tr>
						<td align="right">Country:</td>
						<td align="left"><input type="text" id="country" name="country" size="20" required/></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Register" id="register_submit"/>
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