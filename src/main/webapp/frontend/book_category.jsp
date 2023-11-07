<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Books in ${category.name}</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<br/>
		
		<div align="center">
			<h2>${category.name}</h2>
		</div>
		
		<div align="center" style="width: 80%; margin:0 auto;">
			<c:forEach var="book" items="${listBook}">
				<div style="float: left; display: inline-block; margin: 20px;">
					<div>
						<a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" width="200" height="240"></a>
						<a href="view_book?id=${book.bookId}"><h5><b>${book.title}</b></h5></a>
						<h4>Rating *****</h4>
						<h4><i>By ${book.author}</i></h4>
						<h4><b>$${book.price}</b></h4>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<br/>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script src="js/home.js"></script>

</html>