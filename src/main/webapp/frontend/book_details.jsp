<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${book.title}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
	
		<div align="center">
			<table style="width: 80%; border: none;">
				<tr>
					<td colspan="3" align="left">
						<h2>${book.title}</h2> by ${book.author}
					</td>
				</tr>
				<tr>
					<td style="padding: 10px 10px 0 0;" rowspan="2">
						<img src="data:image/jpg;base64,${book.base64Image}" width="240" height="300">
					</td>
					<td style="padding-top: 10px;" valign="top" align="left">
						Rating: *****
					</td>
					<td style="padding-left: 30px;" valign="top" rowspan="2" width="20%">
						<h2>$${book.price}</h2>
						<br/> <br/>
						<button data="${book.bookId}" id="add_btn" type="submit">Add to Cart</button>
					</td>
				</tr>
				<tr>
					<td style="text-align: justify;" valign="top">
						${book.description}
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<h2>Customer Reviews</h2>
					</td>
					<td colspan="2" align="center">
						<button>Write a customer review</button>
					</td>
				</tr>
			</table>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
		<script src="js/home.js"></script>
</html>