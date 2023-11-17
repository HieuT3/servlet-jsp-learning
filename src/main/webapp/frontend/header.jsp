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
                        <li><a href="#"><i class="fas fa-location-arrow"></i> Vị trí</a></li>
                        <li><a href="#"><i class="fas fa-headset"></i> Liên hệ với chúng tôi</a></li>
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
							<a href="#" class="acc-hover">
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
                                <li><a href="logout">Logout</a></li>
                            </ul>
						</div>
					</c:if>
				</div>
	            <div class="text-slid-box">
	                <div id="offer-box" class="carouselTicker">
	                    <ul class="offer-box">
	                        <li>
	                            <i class="fab fa-opencart"></i> Săn deal thoải mái, giảm tới 30%
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Mua 2 tặng 1
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Sách trinh thám giảm tới 20%
	                        </li>
	                        <li>
	                            <i class="fab fa-opencart"></i> Sách khoa học giảm tới 25%
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
                    <li class="nav-item active"><a class="nav-link" href="./">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="./about-us">Về chúng tôi</a></li>
                    <li class="nav-item"><a class="nav-link" href="./list_books">Sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="gallery.html">Trưng bày</a></li>
                    <li class="nav-item"><a class="nav-link" href="./contact-us">Liên hệ</a></li>
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
								<span class="badge">0</span>
							</c:if>
							<c:if test="${cart.getTotalQuantity() > 0}">
								<span class="badge">${cart.getTotalQuantity()}</span>
							</c:if>
							<p>Giỏ hàng</p>
						</a>
					</li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <li class="cart-box">
                <ul class="cart-list">
                    <li>
                        <a href="#" class="photo"><img src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Delica omtantur </a></h6>
                        <p>1x - <span class="price">$80.00</span></p>
                    </li>
                    <li>
                        <a href="#" class="photo"><img src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Omnes ocurreret</a></h6>
                        <p>1x - <span class="price">$60.00</span></p>
                    </li>
                    <li>
                        <a href="#" class="photo"><img src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Agam facilisis</a></h6>
                        <p>1x - <span class="price">$40.00</span></p>
                    </li>
                    <li class="total">
                        <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                        <span class="float-right"><strong>Total</strong>: $180.00</span>
                    </li>
                </ul>
            </li>
        </div>
        <!-- End Side Menu -->
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
      <form action="login" method="post">
        <h2><b>Login</b></h2>
        <div class="input_box">
          <input type="email" name="email" placeholder="Enter your email" required />
          <i class="far fa-envelope email"></i>
        </div>
        <div class="input_box">
          <input type="password" name="password" placeholder="Enter your password" required />
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
        <button class="button">Login Now</button>
        <div class="login_signup"><a href="#" id="signup">Don't have an account? Signup</a></div>
      </form>
    </div>
    <!-- Signup From -->
    <div class="form signup_form">
      <form action="register_customer" method="post">
        <h2>Signup</h2>
        <div class="input_box">
          <input type="text" name="fullname" placeholder="Enter your fullname" required />
          <i class="far fa-user fullname"></i>
        </div>
        <div class="input_box">
          <input type="email" name="email" placeholder="Enter your email" required />
          <i class="far fa-envelope email"></i>
        </div>
        <div class="input_box">
          <input type="password" name="password" placeholder="Create password" required />
          <i class="fas fa-lock password"></i>
          <i class="far fa-eye-slash pw_hide"></i>
        </div>
        <div class="input_box">
          <input type="password" name="rePassword" placeholder="Confirm password" required />
          <i class="fas fa-lock password"></i>
        </div>
        <button class="button">Signup Now</button>
        <div class="login_signup"><a href="#" id="login">Already have an account? Login</a></div>
      </form>
    </div>
  </div>
</div>