<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div align="center">
	<div>
		<a href="./"><img src="./images/BookstoreLogo.png"/></a>
	</div>
	
	<div>
		<form action="search_book" method="get">
			<input id="search_content" type="text" name="keyword" size="50">
			<input id="search_btn" type="submit" value="Search"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${loggedCustomer == null}">
				<a href="./login">Sign In</a> |
				<a href="./register">Register</a> |
			</c:if>
			<c:if test="${loggedCustomer != null}">
				<a href="view_profile"><c:out value="Welcome, ${loggedCustomer.fullname} |"></c:out></a>
				<a href="./view_orders">My Orders</a> |
				<a href="logout">Logout</a> |
			</c:if>
			<a href="./view_cart">Cart</a>
		</form>
	</div>
	
	<div>&nbsp;</div>
	
	<div>
		<c:forEach var="list" items="${listCate}" varStatus="status">
			<a style="font-size: 17px;" href="view_category?id=${list.categoryId}">
				<b><c:out value="${list.name}"></c:out></b>
			</a>
			<c:if test="${not status.last}">&nbsp; | &nbsp;</c:if>
		</c:forEach>
	</div>
	
</div>