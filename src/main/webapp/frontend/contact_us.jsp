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
	
	    <!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Contact Us</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Home</a></li>
	                        <li class="breadcrumb-item active"> Contact Us </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
	
	    <!-- Start Contact Us  -->
	    <div class="contact-box-main">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-8 col-sm-12">
	                    <div class="contact-form-right">
	                        <h2>GET IN TOUCH</h2>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio justo, ultrices ac nisl sed, lobortis porta elit. Fusce in metus ac ex venenatis ultricies at cursus mauris.</p>
	                        <form id="contactForm">
	                            <div class="row">
	                                <div class="col-md-12">
	                                    <div class="form-group">
	                                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div>
	                                <div class="col-md-12">
	                                    <div class="form-group">
	                                        <input type="text" placeholder="Your Email" id="email" class="form-control" name="name" required data-error="Please enter your email">
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div>
	                                <div class="col-md-12">
	                                    <div class="form-group">
	                                        <input type="text" class="form-control" id="subject" name="name" placeholder="Subject" required data-error="Please enter your Subject">
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div>
	                                <div class="col-md-12">
	                                    <div class="form-group">
	                                        <textarea class="form-control" id="message" placeholder="Your Message" rows="4" data-error="Write your message" required></textarea>
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                    <div class="submit-button text-center">
	                                        <button class="btn hvr-hover" id="submit" type="submit">Send Message</button>
	                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
	                                        <div class="clearfix"></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                </div>
					<div class="col-lg-4 col-sm-12">
	                    <div class="contact-info-left">
	                        <h2>CONTACT INFO</h2>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, maximus ut ullamcorper quis, placerat id eros. Duis semper justo sed condimentum rutrum. Nunc tristique purus turpis. Maecenas vulputate. </p>
	                        <ul>
	                            <li>
	                                <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 9000 <br>Preston Street Wichita,<br> KS 87213 </p>
	                            </li>
	                            <li>
	                                <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
	                            </li>
	                            <li>
	                                <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
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
	</body>

</html>