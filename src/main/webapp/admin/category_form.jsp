<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:if test="${category != null}">
			<title>Edit Category</title>
		</c:if>
		<c:if test="${category == null}">
			<title>Create New Category</title>
		</c:if>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<c:if test="${category != null}">
				<c:set var="action" value="update_category"></c:set>
				<h1>Edit Category</h1>
			</c:if>
			<c:if test="${category == null}">
				<c:set var="action" value="create_category"></c:set>
				<h1>Create New Category</h1>
			</c:if>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if> 
		
		<div align="center">
			<form action="${action}" method="POST">
			<input type="hidden" name="id" value="${category.categoryId}">
				<table>
					<tr>
						<td align="right">Name:</td>
						<td align="left"><input type="text" id="name" name="name" value="${category.name}" size="20"/></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<c:if test="${category != null}">
								<input type="submit" value="Save" />
							</c:if>
							<c:if test="${category == null}">
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
	
	<script src="/BookStoreWeb/js/category.js"></script>
</html>