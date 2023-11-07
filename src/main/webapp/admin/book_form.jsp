<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:if test="${book != null}">
			<title>Edit Book</title>
		</c:if>
		<c:if test="${book == null}">
			<title>Create New Book</title>
		</c:if>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div align="center">
		<c:set var="action" value="null" ></c:set>
			<c:if test="${book != null}">
				<h1>Edit Book</h1>
				<c:set var="action" value="update_book" ></c:set>
			</c:if>
			<c:if test="${book == null}">
				<h1>Create New Book</h1>
				<c:set var="action" value="create_book" ></c:set>
			</c:if>
		</div>
		
		<c:if test="${message != null}">
			<div align="center">
				<h3>${message}</h3>
			</div>
		</c:if>
		
		<div align="center">
			<form action="${action}" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="bookId" value="${book.bookId}">
				<table style="border-spacing: 18px;">
					<tr>
						<td>Category:</td>
						<td>
							<select id="category" name="category" >
								<c:forEach var="category" items="${listCate}">
									<c:if test="${category.categoryId == book.category.categoryId}">
										<option value="${category.categoryId}" selected>
											${category.name}
										</option>
									</c:if>
									<c:if test="${category.categoryId != book.category.categoryId}">
										<option value="${category.categoryId}">
											${category.name}
										</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">Title:</td>
						<td align="left"><input type="text" id="title" name="title" size="20" value="${book.title}" required/></td> 
					</tr>
					<tr>
						<td align="right">Author:</td>
						<td align="left"><input type="text" id="author" name="author" size="20" value="${book.author}" required/></td> 
					</tr>
					<tr>
						<td align="right">ISBN:</td>
						<td align="left"><input type="text" id="isbn" name="isbn" size="20" value="${book.isbn}" required></td> 
					</tr>
					<tr>
						<td align="right">Publish Date:</td>
						<td align="left"><input type="date" id="publishDate" name="publishDate" value="${book.publishDate}" size="20" required></td> 
					</tr>
					<tr>
						<td align="right">Book Image:</td>
						<td align="left">
							<input type="file" id="bookImage" name="bookImage" size="20"> <br> <br>
							<img src="data:image/jpg;base64,${book.base64Image}" alt="Image Preview" id="thumbnail" width="84" height="110">
						</td> 
					</tr>
					<tr>
						<td align="right">Price:</td>
						<td align="left"><input type="text" id="price" name="price" size="20" value="${book.price}" required></td> 
					</tr>
					<tr>
						<td align="right">Description:</td>
						<td align="left"><textarea rows="5" cols="50" id="description" name="description" required>${book.description}</textarea></td> 
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center">
							<c:if test="${book != null}">
								<input type="submit" value="Save" />
							</c:if>
							<c:if test="${book == null}">
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
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			$('#bookImage').change(function() {
				showImageThumbnail(this);
			});
		});
		
		var bookImage = document.getElementById('bookImage');
		<c:if test="${book == null}">
			bookImage.required = true;
		</c:if>
	
		function showImageThumbnail(fileInput) {
			var file = fileInput.files[0];
			
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#thumbnail').attr('src', e.target.result);
			};
			
			reader.readAsDataURL(file);
		}
	</script>
</html>