<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	    <!-- Start Slider -->
	    <div id="slides-shop" class="cover-slides">
	        <ul class="slides-container">
	            <li class="text-center">
	                <img src="images/banner-001.jpg" alt="">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <h1 class="m-b-20"><strong>Welcome To <br> JBookStore</strong></h1>
	                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
	                            <p><a class="btn hvr-hover" href="./list_books">Shop New</a></p>
	                        </div>
	                    </div>
	                </div>
	            </li>
	            <li class="text-center">
	                <img src="images/banner-002.jpg" alt="">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <h1 class="m-b-20"><strong>Welcome To <br> JBookStore</strong></h1>
	                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
	                            <p><a class="btn hvr-hover" href="./list_books">Shop New</a></p>
	                        </div>
	                    </div>
	                </div>
	            </li>
	            <li class="text-center">
	                <img src="images/banner-003.jpg" alt="">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <h1 class="m-b-20"><strong>Welcome To <br> JBookStore</strong></h1>
	                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
	                            <p><a class="btn hvr-hover" href="./list_books">Shop New</a></p>
	                        </div>
	                    </div>
	                </div>
	            </li>
	        </ul>
	        <div class="slides-navigation">
	            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
	            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
	        </div>
	    </div>
	    <!-- End Slider -->
	    
	    <!-- Start Categories  -->
	    <div class="categories-shop">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
	                    <div class="shop-cat-box">
	                        <img class="img-fluid" src="images/categories_img_01.jpg" alt="" />
	                        <a class="btn hvr-hover" href="#">Sách 1</a>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
	                    <div class="shop-cat-box">
	                        <img class="img-fluid" src="images/categories_img_02.jpg" alt="" />
	                        <a class="btn hvr-hover" href="#">Sách 2</a>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
	                    <div class="shop-cat-box">
	                        <img class="img-fluid" src="images/categories_img_03.jpg" alt="" />
	                        <a class="btn hvr-hover" href="#">Sách 3</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Categories -->
	    
	    <div class="box-add-products">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12">
						<div class="offer-box-products">
							<img class="img-fluid" src="images/add-img-01.jpg" alt="" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12">
						<div class="offer-box-products">
							<img class="img-fluid" src="images/add-img-02.jpg" alt="" />
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Start Products  -->
	    <div class="products-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="title-all text-center">
	                        <h1>Fruits & Vegetables</h1>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="special-menu text-center">
	                        <div class="button-group filter-button-group">
	                            <button class="active" data-filter="*">All</button>
	                            <button data-filter=".top-featured">Top featured</button>
	                            <button data-filter=".best-seller">Best seller</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
						
		        <div class="row special-list">
		        	<c:forEach var="book" items="${listNewBook}">
		                <div class="col-lg-3 col-md-6 special-grid best-seller">
		                    <div class="products-single fix">
		                        <div class="box-img-hover">
		                            <div class="type-lb">
		                                <p class="sale">Sale</p>
		                            </div>
		                            <a href=""><img style="width: 260px; height: 350px;" src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" alt="Image"></a>
		                            <div class="mask-icon">
		                                <ul>
		                                    <li><a href="view_book?id=${book.bookId}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
		                                </ul>
		                                <a class="cart" href="add_to_cart?bookId=${book.bookId}">Add to Cart</a>
		                            </div>
		                        </div>
		                        <div class="why-text">
		                            <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
		                            <h5> $${book.price}</h5>
		                        </div>
		                    </div>
		                </div>
		        	</c:forEach>
		    	</div>
	        </div>
	    </div>
	    <!-- End Products  -->
	    
	    <!-- Start Blog  -->
	    <div class="latest-blog">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="title-all text-center">
	                        <h1>latest blog</h1>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-md-6 col-lg-4 col-xl-4">
	                    <div class="blog-box">
	                        <div class="blog-img">
	                            <img class="img-fluid" src="images/blog-img.jpg" alt="" />
	                        </div>
	                        <div class="blog-content">
	                            <div class="title-blog">
	                                <h3>Fusce in augue non nisi fringilla</h3>
	                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
	                            </div>
	                            <ul class="option-blog">
	                                <li><a href="#"><i class="far fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
	                                <li><a href="#"><i class="far fa-comments"></i></a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6 col-lg-4 col-xl-4">
	                    <div class="blog-box">
	                        <div class="blog-img">
	                            <img class="img-fluid" src="images/blog-img-01.jpg" alt="" />
	                        </div>
	                        <div class="blog-content">
	                            <div class="title-blog">
	                                <h3>Fusce in augue non nisi fringilla</h3>
	                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
	                            </div>
	                            <ul class="option-blog">
	                                <li><a href="#"><i class="far fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
	                                <li><a href="#"><i class="far fa-comments"></i></a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6 col-lg-4 col-xl-4">
	                    <div class="blog-box">
	                        <div class="blog-img">
	                            <img class="img-fluid" src="images/blog-img-02.jpg" alt="" />
	                        </div>
	                        <div class="blog-content">
	                            <div class="title-blog">
	                                <h3>Fusce in augue non nisi fringilla</h3>
	                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
	                            </div>
	                            <ul class="option-blog">
	                                <li><a href="#"><i class="far fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
	                                <li><a href="#"><i class="far fa-comments"></i></a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Blog  -->
	      
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