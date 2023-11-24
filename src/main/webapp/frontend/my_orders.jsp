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
		
		<!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Orders</h2>
	                    <ul class="breadcrumb">
	                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
	                        <li class="breadcrumb-item active">Orders</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
		
		<main style="margin: 60px auto; min-height: 500px;" class="col-md-9">

          <div class="table-responsive-xxl">
            <table style="font-size: 18px;" class="table table-bordered table-striped table-hover align-middle">
              <thead>
                <tr style="text-align: center;">
                  <th scope="col" style="min-width: 125px;">OrderID</th>
                  <th scope="col" style="min-width: 100px;">Order Date</th>
                  <th scope="col" style="min-width: 300px;">Products</th>
                  <th scope="col" style="min-width: 100px;">Total</th>
                  <th scope="col" style="min-width: 175px;">Status</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="order" items="${listOrder}">
                <tr>
                  <th style="text-align: center; vertical-align: middle;" scope="row">#${order.orderId}</th>
                  <td style="text-align: center; vertical-align: middle;"><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${order.orderDate}"/></td>
                  <td style="vertical-align: middle;">
                  	<c:forEach var="orderDetail" items="${order.orderDetails}">
                  		<h3>${orderDetail.book.title} x ${orderDetail.quantity}</h3>
                  	</c:forEach>
                  </td>
                  <td style="text-align: center; vertical-align: middle;">$<fmt:formatNumber value="${order.total}"></fmt:formatNumber></td>
                  <td style="text-align: center; vertical-align: middle;">
                  	<c:if test="${order.status eq 'Processing'}">
                  		<span style="font-size: 16px;" class="badge bg-warning why-text">${order.status}</span>
                  	</c:if>
                  	<c:if test="${order.status eq 'Completed'}">
                  		<span style="font-size: 16px;" class="badge bg-success why-text text-white">${order.status}</span>
                  	</c:if>
                  	<c:if test="${order.status eq 'Cancelled'}">
                  		<span style="font-size: 16px;" class="badge bg-danger why-text text-white">${order.status}</span>
                  	</c:if>
                  	<c:if test="${order.status eq 'Shipping'}">
                  		<span style="font-size: 16px;" class="badge bg-secondary why-text text-white">${order.status}</span>
                  	</c:if>
                  </td>
                  <td style="text-align: center; vertical-align: middle;">
                    <div class="col-12 d-flex shopping-box"><a href="./view_detail_order?orderId=${order.orderId}" class="ml-auto btn hvr-hover">View</a> </div>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

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