<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:if test="${user != null}">
			<title>Edit User</title>
		</c:if>
		<c:if test="${user == null}">
			<title>Create New User</title>
		</c:if>
			
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
		<c:set var="action" value="null" ></c:set>
			<c:if test="${user != null}">
				<h1>Edit User</h1>
				<c:set var="action" value="update_user" ></c:set>
			</c:if>
			<c:if test="${user == null}">
				<h1>Create New User</h1>
				<c:set var="action" value="create_user" ></c:set>
			</c:if>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if>
		
		<div align="center">
			<form action="${action}" method="POST">
			<input type="hidden" name="id" value="${user.userId}">
				<table>
					<tr>
						<td align="right">Email:</td>
						<td align="left"><input type="text" id="email" name="email" size="20" value="${user.email}"/></td> 
					</tr>
					<tr>
						<td align="right">FullName:</td>
						<td align="left"><input type="text" id="fullname" name="fullname" size="20" value="${user.fullName}"/></td> 
					</tr>
					<tr>
						<td align="right">Password:</td>
						<td align="left"><input type="password" id="password" name="password" size="20" value="${user.password}"/></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<c:if test="${user != null}">
								<input type="submit" value="Save" />
							</c:if>
							<c:if test="${user == null}">
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
</html>