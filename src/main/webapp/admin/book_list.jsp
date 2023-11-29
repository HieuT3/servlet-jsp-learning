<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Manage Books - JBookstore Administration</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<fmt:setLocale value="en_US"/>
		<div align="center">
			<h1>Books Management</h1>
			<h3><a href="new_book">Create new Book</a></h3>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if>
		
		<div align="center">
			<table border="1px solid" cellpadding="5">
				<tr>
					<th>Index</th>
					<th>Id</th>
					<th>Image</th>
					<th>Title</th>
					<th>Author</th>
					<th>Category</th>
					<th>Price</th>
					<th>Last updated</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="book" items="${listBook}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${book.bookId}</td>
						<td>
							<img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110" />
						</td>
						<td style="max-width: 400px;">${book.title}</td>
						<td>${book.author}</td>
						<td>${book.category.name}</td>
						<td>$${book.price}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${book.lastUpdateTime}"/></td>
						<td>
							<a href="edit_book?id=${book.bookId}">Edit</a> &nbsp;
							<a id="delete_book" href="javascript:deleteBook(${book.bookId})">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script type="text/javascript">
		
		function deleteBook(bookId) {
			if(confirm('Are you sure want to delete this book?')) {
				window.location.href = 'delete_book?id=' + bookId;
			}
		}
	</script>
</html>