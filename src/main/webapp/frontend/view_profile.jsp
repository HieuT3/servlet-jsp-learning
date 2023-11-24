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
		
		<style type="text/css">
			body {
				background-color: #f3f3f3;
			}
		</style>
		
	</head>
	<body>
		
		<jsp:include page="header.jsp"></jsp:include>
		
		<c:set var="customer" value="${sessionScope.loggedCustomer}"></c:set>
		
		<!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Account</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
	                        <li class="breadcrumb-item active">Account</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->


	    <div class="container-profile">
			<div style="margin: 40px 0;" class="row">
				<div class="mx-auto my-auto">
					<div class="card h-100">
						<div class="card-body">
							<div class="row gutters">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<h6 class="mb-2 text-primary">Personal Details</h6>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label for="fullName">Full Name</label>
										<input type="text" name="fullname" value="${customer.fullname}" class="form-control" id="fullName" placeholder="Enter full name">
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div style="" class="form-group">
										<label for="eMail">Email</label>
										<input type="email" name="email" value="${customer.email}" class="form-control" id="eMail" placeholder="Enter email ID">
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label for="phone">Phone</label>
										<input type="text" name="phone" value="${customer.phone}" class="form-control" id="phone" placeholder="Enter phone number">
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label for="address">Address</label>
										<input type="text" name="address" value="${customer.address}" class="form-control" id="address" placeholder="Enter address">
									</div>
								</div>
							</div>
							<div class="row gutters">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<h6 class="mt-3 mb-2 text-primary">Change Password</h6>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label for="newPass">New Password</label>
										<input type="password" class="form-control" id="newPass" placeholder="Enter new password">
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label for="newPassConfirm">New Password Confirm</label>
										<input type="password" class="form-control" id="newPassConfirm" placeholder="Enter new password confirm">
									</div>
								</div>
							</div>
							<div class="row gutters">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="text-right">
										<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
										<button type="button" id="submit" name="submit" class="btn btn-primary">Update</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	      
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