<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Search Result</title>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<br/>
		<div align="center">
			<div align="center" style="width: 85%; margin: 0 auto">
				<c:set var="list" value="${listBook}"></c:set>
				<c:if test="${list.size() > 0}">
					<h2>Result search for "${keyword}":</h2>
					<c:forEach var="book" items="${list}">
						<div style="display: inline-block; margin: 20px;">
							<div>
								<a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" width="200" height="240"></a>
								<a href="view_book?id=${book.bookId}"><h5><b>${book.title}</b></h5></a>
								<h4>Rating *****</h4>
								<h4><i>By ${book.author}</i></h4>
								<h4><b>$${book.price}</b></h4>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${list.size() == 0}">
					<h2>Sorry, we couldn't find any results for "${keyword}"</h2>
				</c:if>
		</div>
	</div>
		<br/>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	
	<script src="js/home.js"></script>
	
</html>