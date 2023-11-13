<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.bookstore.controller.frontend.shoppingcart.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	    <!-- Mobile Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <!-- Site Metas -->
	    <title>JBookStore - Sách và đời sống</title>
	    <meta name="keywords" content="">
	    <meta name="description" content="">  
	    <meta name="author" content="">
	
	    <!-- Site Icons -->
	    <link rel="shortcut icon" href="images/book-icon.png" type="image/x-icon">
	    <link rel="apple-touch-icon" href="images/book-icon.png">
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    <!-- Site CSS -->
	    <link rel="stylesheet" href="css/style.css">
	    <!-- Responsive CSS -->
	    <link rel="stylesheet" href="css/responsive.css">
	    <!-- Custom CSS -->
	    <link rel="stylesheet" href="css/custom.css">
	    
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Cart</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
	                        <li class="breadcrumb-item active">Cart</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->

		<c:set var="cart" value="${sessionScope.cart}"></c:set>
		<c:if test="${cart == null || cart.getTotalQuantity() == 0}">
			<div style="margin: 100px 0;" align="center">
				<div>
					<h1 style="font-size: 40px;">Your cart is empty. Keep shopping to find a product!</h1>
				</div>
				<div style="margin: 30px 0;">
					<a style="font-size: 25px; color: #fff;" class="btn hvr-hover" href="#">Continue Shopping</a>
				</div>
			</div>
		</c:if>	
						
		<!-- Start Cart  -->
		<c:if test="${cart.getTotalQuantity() > 0}">
		    <div class="cart-box-main">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="table-main table-responsive">
		                        <table class="table">
		                            <thead>
		                                <tr>
		                                    <th>Images</th>
		                                    <th>Product Name</th>
		                                    <th>Price</th>
		                                    <th>Quantity</th>
		                                    <th>Total</th>
		                                    <th>Remove</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            	<c:set var="items" value="${cart.getItems()}"></c:set>
		                            	<c:forEach var="item" items="${items}" varStatus="status">
			                                <tr>
			                                    <td class="thumbnail-img">
			                                        <a href="#">
														<img class="img-fluid" src="data:image/jpg;base64,${item.key.base64Image}" alt="" />
													</a>
			                                    </td>
			                                    <td class="name-pr">
			                                        <a href="#">${item.key.title}</a>
			                                    </td>
			                                    <td class="price-pr">
			                                        <p>$${item.key.price}</p>
			                                    </td>
			                                    <td class="quantity-box"><input type="number" size="4" value="${item.value}" min="0" step="1" class="c-input-text qty text"></td>
			                                    <td class="total-pr">
			                                        <p>$<fmt:formatNumber value="${item.key.price * item.value}"></fmt:formatNumber></p>
			                                    </td>
			                                    <td class="remove-pr">
			                                        <p style="cursor: pointer;"><i data-item="${item.key.bookId}" class="fas fa-times delete-btn"></i></p>
			                                    </td>
			                                </tr>
		                                </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		            </div>
		
		            <div class="row my-5">
		            	<div class="col-lg-6 col-sm-6">
		                </div>
		                <div class="col-lg-6 col-sm-6">
		                    <div class="update-box">
		                        <input value="Update Cart" type="submit">
		                    </div>
		                </div>
		            </div>
		
		            <div class="row my-5">
		                <div class="col-lg-8 col-sm-12"></div>
		                <div class="col-lg-4 col-sm-12">
		                    <div class="order-box">
		                        <h3>Order summary</h3>
		                        <div class="d-flex">
		                            <h4>Quantity</h4>
		                            <div class="ml-auto font-weight-bold">
		                            	${cart.getTotalQuantity()}
		                            </div>
		                        </div>
		                        <hr class="my-1">
		                        <div class="d-flex">
		                            <h4>Sub Total</h4>
		                            <div class="ml-auto font-weight-bold">
		                            	$<fmt:formatNumber value="${cart.getTotalAmount()}"></fmt:formatNumber>
		                            </div>
		                        </div>
		                        <hr class="my-1">
		                        <div class="d-flex">
		                            <h4>Shipping Cost</h4>
		                            <div class="ml-auto font-weight-bold"> Free </div>
		                        </div>
		                        <hr>
		                        <div class="d-flex gr-total">
		                            <h5>Grand Total</h5>
		                            <div class="ml-auto h5">
		                            	$<fmt:formatNumber value="${cart.getTotalAmount()}"></fmt:formatNumber>	
		                            </div>
		                        </div>
		                        <hr> </div>
		                </div>
		                <div class="col-12 d-flex shopping-box"><a href="checkout.html" class="ml-auto btn hvr-hover">Checkout</a> </div>
		            </div>
		
		        </div>
		    </div>
	    </c:if>	
	    <!-- End Cart -->

		<jsp:include page="footer.jsp"></jsp:include>
		
		<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	
	    <!-- ALL JS FILES -->
	    <script src="js/jquery-3.2.1.min.js"></script>
	    <script src="js/popper.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <!-- ALL PLUGINS -->
	    <script src="js/jquery.superslides.min.js"></script>
	    <script src="js/bootstrap-select.js"></script>
	    <script src="js/inewsticker.js"></script>
	    <script src="js/bootsnav.js."></script>
	    <script src="js/images-loded.min.js"></script>
	    <script src="js/isotope.min.js"></script>
	    <script src="js/owl.carousel.min.js"></script>
	    <script src="js/baguetteBox.min.js"></script>
	    <script src="js/form-validator.min.js"></script>
	    <script src="js/contact-form-script.js"></script>
	    <script src="js/custom.js"></script>
	    <script src="./js/cart.js"></script>
	</body>
	
</html>