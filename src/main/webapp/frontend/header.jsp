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
                        <li><a href="#"><i class="fa fa-user s_color"></i> Tài khoản của bạn</a></li>
                        <li><a href="#"><i class="fas fa-location-arrow"></i> Vị trí</a></li>
                        <li><a href="#"><i class="fas fa-headset"></i> Liên hệ với chúng tôi</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<div class="login-box">
					<select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
						<option>Đăng kí</option>
						<option>Đăng nhập</option>
					</select>
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