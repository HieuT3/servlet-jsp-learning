<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Start Main Top -->
<div class="main-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="right-phone-box">
                    <p>Hotline : <a href="#"> (+84)0123456789</a></p>
                </div>
                <div class="our-link">
                    <ul>
                        <li><a href="#"><i class="fas fa-location-arrow"></i> Location</a></li>
                        <li><a href="./contact-us"><i class="fas fa-headset"></i> Contact us</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="login-box">
					<c:if test="${sessionScope.loggedCustomer == null}">
						<button class="button" id="form-open">Login</button>
					</c:if>
					<c:if test="${sessionScope.loggedCustomer != null}">
						<div class="my-account">
							<a class="acc-hover">
								<div class="profile">
									<i class="fas fa-user avatar"></i>
								</div>
							</a>
							<ul class="sub-account">
                                <li>
                                	<div class="acc-profile">
                                		<div class="acc-user">${sessionScope.loggedCustomer.fullname}</div>
                                		<div class="acc-email">${sessionScope.loggedCustomer.email}</div>
                                	</div>
                                </li>
                                <li><a href="view_orders">My Order</a></li>
                                <li><a href="logout">Logout</a></li>
                            </ul>
						</div>
					</c:if>
				</div>
	            <div class="text-slid-box">
	                <div id="offer-box" class="carouselTicker">
	                    <ul class="offer-box">
	                        <li>
	                            <i class="fab fa-opencart"></i> Hunt for deals with ease, enjoy up to 30% off.
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Buy 2, Get 1 Free.
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Programming books, up to 20% off.
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Language books, up to 25% off
	                        </li>
	                    </ul>
	                </div>
	            </div>
            </div>
        </div>
    </div>
</div>
<!-- End Main Top -->

<!-- Start Main Top -->
<header class="main-header">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                	<i class="fa fa-bars"></i>
            	</button>
                <a class="navbar-brand" href="./"><img src="images/logo.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item"><a class="nav-link" href="./">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="./about-us">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="./list_books">Product</a></li>
                    <li class="nav-item"><a class="nav-link" href="./contact-us">Contact</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="side-menu">
						<a href="./view_cart">
							<i class="fa fa-shopping-bag"></i>
							<c:set var="cart" value="${sessionScope.cart}"></c:set>
							<c:if test="${cart == null || cart.getTotalQuantity() == 0}">
								<span class="cart-quantity badge">0</span>
							</c:if>
							<c:if test="${cart.getTotalQuantity() > 0}">
								<span class="cart-quantity badge">${cart.getTotalQuantity()}</span>
							</c:if>
							<p>Cart</p>
						</a>
					</li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>
        
    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<div class="top-search">
    <div class="container">
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-search"></i></span>
            <input type="text" class="form-control" placeholder="Search">
            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
        </div>
    </div>
</div>
<!-- End Top Search -->

<div class="modal" id="modal-form">
  	<div class="form_container">
    	<i class="fas fa-times form_close"></i>
    	
   		<!-- Login From -->
    	<div class="form login_form">
      		<form class="signInForm" action="login" method="post">
	        	<h2>
	        		<b>Login</b>
	        	</h2>
	        	
	        	<div class="alert-form-signin">
					<h3 class="login-failed"><b>There was a problem logging in. Check your email and password or create an account.</b></h3>
				</div>

	        	<div class="input_box">
	          		<input type="email" class="email-login" name="email" placeholder="Enter your email" required />
	          		<i class="far fa-envelope email"></i>
	        	</div>
	        	<div class="input_box">
	          		<input type="password" class="pass-login" name="password" placeholder="Enter your password" required />
	          		<i class="fas fa-lock password"></i>
	          		<i class="far fa-eye-slash pw_hide"></i>
	        	</div>
	        	<div class="option_field">
	          		<span class="checkbox">
		            	<input type="checkbox" id="check" />
		            	<label for="check">Remember me</label>
	          		</span>
	          		<a href="#" class="forgot_pw">Forgot password?</a>
	        	</div>
	        	<button type="submit" class="btn-login button">Login Now</button>
	        	<div class="login_signup">
	        		<a href="#" id="signup">Don't have an account? Signup</a>
	        	</div>
			</form>
		</div>
		
    	<!-- Signup From -->
    	<div class="form signup_form">
      		<form class="signUpForm" action="register_customer" method="post">
        		<h2>Signup</h2>
        		
        		<div class="alert-form-signup">
					<h3 class="signup-failed">
						<b class="signup-failed-content"></b>
					</h3>
				</div>
        		
        		<div class="input_box">
	          		<input type="text" class="name-signup" name="fullname" placeholder="Enter your fullname" required />
	          		<i class="far fa-user fullname"></i>
        		</div>
        		<div class="input_box">
          			<input type="email" class="email-signup" name="email" placeholder="Enter your email" required />
          			<i class="far fa-envelope email"></i>
        		</div>
        		<div class="input_box">
					<input type="password" class="pass-signup" name="password" placeholder="Create password" required />
					<i class="fas fa-lock password"></i>
					<i class="far fa-eye-slash pw_hide"></i>
		        </div>
        		<div class="input_box">
          			<input type="password" class="re-pass-signup" name="rePassword" placeholder="Confirm password" required />
          			<i class="fas fa-lock password"></i>
        		</div>
        		<button class="button">Signup Now</button>
       	 		<div class="login_signup">
       	 			<a href="#" id="login">Already have an account? Login</a>
       	 		</div>
      	</form>
    </div>
  </div>
</div>

<div style="background-color: rgba(0, 0, 0, 0);" class="modal" id="modal-add-sucess">
	<div class="modal-add-wrap">
		<i class="modal-add-check fas fa-check-circle"></i>
		<h3 class="modal-add-alert"><b>Product has been added to the cart</b></h3>
	</div>
</div>