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
		
		<fmt:setLocale value="en_US"/>

		<main style="margin: 60px auto;" class="col-md-9">

          <article class="card mb-4">

            <header class="card-header">
              <strong class="d-inline-block me-4">OrderId: #${bookOrder.orderId}</strong>
              <br/>
              <strong>Order Date: <fmt:formatDate type="both" timeStyle="short" dateStyle="medium" value="${bookOrder.orderDate}"/></strong>
            </header> <!-- card-header.// -->

            <div class="card-body pb-0">
              <div class="row">
                <div class="col-lg-8">
                  <h1 class="text-muted">Infomation of recipient</h1>
                  <p style="font-size: 16px;" class="lh-lg">
                    ${bookOrder.recipientName} <br>
                    Phone: ${bookOrder.recipientPhone} <br>
                    Address: ${bookOrder.shippingAddress}
                  </p>
                </div>
                <div class="col-lg-4">
                  <h3 class="text-muted">Payment Method: <span>${bookOrder.paymentMethod}</span></h3>
                  <p style="font-size: 16px;" class="lh-lg">
                    Sub Total: $<fmt:formatNumber value="${bookOrder.total}"></fmt:formatNumber> <br>
                    Shipping Cost: $<fmt:formatNumber pattern="0.00" value="${bookOrder.shippingCost}"></fmt:formatNumber> <br>
                    <strong>TOTAL: $<fmt:formatNumber value="${bookOrder.total + bookOrder.shippingCost}"></fmt:formatNumber></strong>
                  </p>
                </div>
              </div> 
            </div> 

            <hr class="m-0">

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
		                                </tr>
		                            </thead>
		                            <tbody>                            	
		                            	<c:forEach var="orderDetail" items="${bookOrder.orderDetails}" varStatus="status">
		                            		<c:set var="book" value="${orderDetail.book}"></c:set>
			                                <tr>
			                                    <td class="thumbnail-img">
			                                        <a href="#">
														<img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}" alt="" />
													</a>
			                                    </td>
			                                    <td class="name-pr">
			                                        <a href="#">${book.title}</a>
			                                    </td>
			                                    <td class="price-pr">
			                                        <p>$${book.price}</p>
			                                    </td>
			                                    <td class="quantity-box"><p>${orderDetail.quantity}</p></td>
			                                    <td class="total-pr">
			                                        <p>$<fmt:formatNumber maxFractionDigits="2" type="number" value="${orderDetail.subtotal}"></fmt:formatNumber></p>
			                                    </td>
			                                </tr>
		                                </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>

            <div class="card-footer py-3">
            	<c:if test="${(bookOrder.status eq 'Completed') or (bookOrder.status eq 'Cancelled')}">
            		<a style="margin-right: 24px;" href="#" class="receive-order">Purchase again</a>
            	</c:if>
            	<c:if test="${(bookOrder.status eq 'Processing') or (bookOrder.status eq 'Shipping')}">
            		<a style="margin-right: 24px;" href="./receive_order?orderId=${bookOrder.orderId}" class="receive-order">Received</a>
	            	<a href="./cancel_order?orderId=${bookOrder.orderId}" class="cancel-order">Cancelled</a>
            	</c:if>
            </div>

          </article>

        </main>
	  
	      
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