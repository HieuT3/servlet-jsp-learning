<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	
	</head>
	<body>
		
		<jsp:include page="header.jsp"></jsp:include>
	
	    <!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Shop</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Home</a></li>
	                        <li class="breadcrumb-item active">Shop</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
	
	    <!-- Start Shop Page  -->
	    <div class="shop-box-inner">
	        <div class="container">
	            <div class="row">
	                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
	                    <div class="right-product-box">
	                        <div class="product-item-filter row">
	                            <div class="col-12 col-sm-6 text-center text-sm-left">
	                            </div>
	                            <div class="col-12 col-sm-4 text-center text-sm-right">
	                                <ul class="nav nav-tabs ml-auto">
	                                    <li>
	                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
	                                    </li>
	                                    <li>
	                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	
	                        <div class="product-categorie-box">
	                            <div class="tab-content">
	                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
	                                    <div class="content-wrapper-grid row">
	                                    	
	                                    </div>
	                                </div>
	                                <div role="tabpanel" class="content-wrapper-list tab-pane fade" id="list-view">
	                                
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
					<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
	                    <div class="product-categori">
	                        <div class="search-product">
	                            <input id="search-input" class="form-control" placeholder="Search here..." type="text">
	                            <button id="search-btn"> <i class="fa fa-search"></i> </button>
	                        </div>
	                        <div class="filter-sidebar-left">
	                            <div class="title-left">
	                                <h3>Categories</h3>
	                            </div>
	                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
	                                <div class="list-group-collapse sub-men">
                                    	<a class="view-category list-group-item list-group-item-action" data-category="0" href="#" data-toggle="collapse">All <small class="text-muted">(${sizeListCate})</small></a>
                                    	<div class="collapse show" id="sub-men" data-parent="#list-group-men">
                                        <div class="list-group">
                                        	<c:forEach var="category" items="${listCate}">
                                            	<a href="#" data-category="${category.categoryId}" class="view-category list-group-item list-group-item-action">${category.name}<small class="text-muted">(${fn:length(category.books)})</small></a>
                                        	</c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Shop Page -->
	   
	   	<!-- Modal Load -->

		<div class="modal" id="myModal">
			<div class="lds-dual-ring"></div>
		</div>
	      
	    <jsp:include page="footer.jsp"></jsp:include>
	
	    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	
	    <!-- ALL JS FILES -->
	    <script src="js/jquery-3.2.1.min.js"></script>
	    <script src="js/popper.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <!-- ALL PLUGINS -->
	    <script src="js/home.js"></script>
	    <script src="js/search.js"></script>
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