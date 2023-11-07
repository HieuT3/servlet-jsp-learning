<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Review</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
			<h1>Edit Review</h1>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if> 
		
		<div align="center">
			<form action="update_review" method="POST">
			<input type="hidden" name="id" value="${review.reviewId}">
				<table>
					<tr>
						<td align="right">Book:</td>
						<td align="left"><b>${review.book.title}</b></td> 
					</tr>
					<tr>
						<td align="right">Rating:</td>
						<td align="left"><b>${review.rating}</b></td> 
					</tr>
					<tr>
						<td align="right">Customer:</td>
						<td align="left"><b>${review.customer.fullname}</b></td> 
					</tr>
					<tr>
						<td align="right">Headline:</td>
						<td align="left"><input type="text" name="headline" value="${review.headline}" required></td> 
					</tr>
					<tr>
						<td align="right">Comment:</td>
						<td align="left"><textarea name="comment">${review.comment}</textarea></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Save" />
							<input type="button" value="Cancel" onclick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>