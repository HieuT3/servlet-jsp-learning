<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Site Metas -->
		<title>JBookStore - Sách và Đời Sống</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<!-- Site Icons -->
		<link rel="shortcut icon" href="images/book-icon.png"
			type="image/x-icon">
		<link rel="apple-touch-icon" href="images/book-icon.png">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Site CSS -->
		<link rel="stylesheet" href="css/style.css">
		<!-- Responsive CSS -->
		<link rel="stylesheet" href="css/responsive.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" href="css/custom.css">
		<!--[if lt IE 9]>
			      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<style type="text/css">
			body{
			    background-color: #f3f3f3;
			}
		</style>
		
	</head>
	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Product</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
	                        <li class="breadcrumb-item active">Product</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
	
		<!--==Product-Page=================================-->
	    <section id="product-page">
	    <div class="product-details">
	        <!--**Img*************************-->
	        <div class="product-img">
	        	<img class="image-book" width="450px" height="560px" src="data:image/jpg;base64,${book.base64Image}" alt="">
	        </div>
	        <!--**Text************************-->
	        <div class="product-text">
	            <!--category-->
	            <h4 class="product-category">${book.category.name}</h4>
	            <h3>${book.title}</h3>
	            <h5 class="font-italic">By <u>${book.author}</u></h5>
	            <span class="product-price">$${book.price}</span>
	            <p>
	            	${book.description}
	            </p>
	            
	            <!--btn-->
	            <div class="product-button">
	                <a data-item="${book.bookId}" href="./add_to_cart" class="cart add-bag-btn">Add To Cart</a>
	                <a data-item="${book.bookId}" href="./checkout" class="buy-now-btn add-wishlist-btn">Buy Now</a>
	            </div>
	        </div>
	    </div>
	    </section>
	
	
		<jsp:include page="footer.jsp"></jsp:include>
	
		<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	
		<!-- ALL JS FILES -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- ALL PLUGINS -->
		<script src="js/home.js"></script>
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
	</body>	
</html>