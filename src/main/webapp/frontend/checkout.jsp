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
		
		<c:set var="customer" value="${sessionScope.loggedCustomer}"></c:set>
		<c:set var="items" value="${sessionScope.cart.getItems()}"></c:set>
		<fmt:setLocale value="en_US"/>
		
	    <!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Checkout</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
	                        <li class="breadcrumb-item active">Checkout</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
	    
	    <div class="alert-login">
	    	<i class="fas fa-exclamation"></i>
	    	<h3 class="alert-content"><b>Please log in to proceed with checkout!</b></h3>
	    </div>
	
	    <!-- Start Cart  -->
	    <div class="form-checkout cart-box-main">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-6 col-lg-6 mb-3">
	                    <div class="checkout-address">
	                        <div class="title-left">
	                            <h3>Billing address</h3>
	                        </div>
	                        <form class="needs-validation">
	                            <div class="mb-3">
	                                <label for="username">FullName *</label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" id="username" value="${customer.fullname}" placeholder="" required>
	                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
	                                </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="email">Email Address *</label>
	                                <input type="email" class="form-control" id="email" value="${customer.email}" placeholder="">
	                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="address">Address *</label>
	                                <input type="text" class="form-control" id="address" ${customer.address} placeholder="" required>
	                                <div class="invalid-feedback"> Please enter your shipping address. </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="phone">Phone *</label>
	                                <input type="text" class="form-control" id="phone" ${customer.phone} placeholder="" required>
	                                <div class="invalid-feedback"> Please enter your phone. </div>
	                            </div>
	                            <hr class="mb-4">
	                            <div class="title"> <span>Payment</span> </div>
	                            <div class="d-block my-3">
	                            	<div class="custom-control custom-radio">
	                                    <input id="COD" name="paymentMethod" type="radio" class="custom-control-input" checked required>
	                                    <label class="custom-control-label" for="COD">Cash on delivery</label>
	                                </div>
	                                <div style="opacity: 0.5; pointer-events: none;">
	                                	<div class="custom-control custom-radio">
		                                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" required>
		                                    <label class="custom-control-label" for="credit">Credit card (Unvailable)</label>
		                                </div>
		                                <div class="custom-control custom-radio">
		                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
		                                    <label class="custom-control-label" for="debit">Debit card (Unavailable)</label>
		                                </div>
		                                <div class="custom-control custom-radio">
		                                    <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
		                                    <label class="custom-control-label" for="paypal">Paypal (Unavailable)</label>
		                                </div>
	                                </div>
	                            </div>
	                       </form>
	                    </div>
	                </div>
	                <div class="col-sm-6 col-lg-6 mb-3">
	                    <div class="row">
	                        <div class="col-md-12 col-lg-12">
	                            <div class="shipping-method-box">
	                                <div class="title-left">
	                                    <h3>Shipping Method</h3>
	                                </div>
	                                <div class="mb-4">
	                                    <div class="custom-control custom-radio">
	                                        <input id="shippingOption1" name="shipping-option" value="0" class="custom-control-input shipping" checked="checked" type="radio">
	                                        <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
	                                    <div class="ml-4 mb-2 small">(3-7 business days)</div>
	                                    <div class="custom-control custom-radio">
	                                        <input id="shippingOption2" name="shipping-option" value="10.00" class="custom-control-input shipping" type="radio">
	                                        <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
	                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
	                                    <div class="custom-control custom-radio">
	                                        <input id="shippingOption3" name="shipping-option" value="20.00" class="custom-control-input shipping" type="radio">
	                                        <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-12 col-lg-12">
	                            <div class="odr-box">
	                                <div class="title-left">
	                                    <h3>Shopping cart</h3>
	                                </div>
	                                <div style="margin-bottom: 12px;" class="rounded p-2 bg-light">
	                                    <c:forEach var="item" items="${items}">
	                                    	<div class="media mb-2 border-bottom">
		                                        <div class="media-body"> <a href="./view_book?id=${item.key.bookId}"> ${item.key.title}</a>
		                                            <div style="font-size: 16px;" class="large text-muted">Price: $${item.key.price} <span class="mx-2">|</span> Qty: ${item.value} <span class="mx-2">|</span> Subtotal: $<fmt:formatNumber value="${item.key.price * item.value}"></fmt:formatNumber></div>
		                                        </div>
		                                    </div>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-12 col-lg-12">
	                            <div class="order-box">
	                                <div class="title-left">
	                                    <h3>Your order</h3>
	                                </div>
	                                <div class="d-flex">
	                                    <div class="font-weight-bold">Product</div>
	                                    <div class="ml-auto font-weight-bold">Total</div>
	                                </div>
	                                <hr class="my-1">
	                                <div class="d-flex">
	                                    <h4>Quantity</h4>
	                                    <div class="ml-auto font-weight-bold"> ${cart.getTotalQuantity()} </div>
	                                </div>
	                                <hr class="my-1">
	                                <div class="d-flex">
	                                    <h4>SubTotal</h4>
	                                    <fmt:formatNumber value="${cart.getTotalAmount()}" type="number" maxFractionDigits="2" var="formattedNumber" />
	                                    <div class="ml-auto font-weight-bold"> ${formattedNumber} </div>
	                                </div>
	                                <hr class="my-1">
	                                <div class="d-flex">
	                                    <h4>Shipping Cost</h4>
	                                    <div id="shipping-cost" class="ml-auto font-weight-bold"> Free </div>
	                                </div>
	                                <hr>
	                                <div class="d-flex gr-total">
	                                    <h5>Grand Total</h5>
	                                    <div id="grand-total" data-item="${formattedNumber}" class="ml-auto h5"> $${formattedNumber}</div>
	                                </div>
	                                <hr> </div>
	                        </div>
	                        <div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div>
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
	    <script src="js/home.js"></script>
	    <script src="js/cart.js"></script>
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
	<script type="text/javascript">
		var shipping = document.querySelectorAll('.shipping');
		var shippingCost = document.getElementById('shipping-cost');
		var grandTotal = document.getElementById('grand-total');
		var total = parseFloat(grandTotal.getAttribute('data-item'));
		shipping.forEach(function(input) {
			input.addEventListener('change', function() {
				if(input.value == 0) {
					shippingCost.textContent = 'Free';
					grandTotal.textContent = '$' + total;
				} else {
					shippingCost.textContent = '$' + input.value;
					grandTotal.textContent = '$' + (total + parseFloat(input.value));
				}
			});
		});
	</script>
</html>