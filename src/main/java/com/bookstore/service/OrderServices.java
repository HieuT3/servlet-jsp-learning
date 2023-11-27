package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderServices {
	private OrderDAO orderDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		this.orderDAO = new OrderDAO();
		this.request = request;
		this.response = response;
	}
	
	public void listAllOrder() throws ServletException, IOException {
		List<BookOrder> list = orderDAO.listAll();
		request.setAttribute("listOrder", list);
		request.getRequestDispatcher("./order_list.jsp").forward(request, response);
	}
	
	public void viewOrderDetailByAdmin() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		BookOrder bookOrder = orderDAO.get(orderId);
		request.setAttribute("bookOrder", bookOrder);
		request.getRequestDispatcher("./detail_order.jsp").forward(request, response);
	}
	
	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		orderDAO.delete(orderId);
		String message = "The order was already deleted sucessfully";
		request.setAttribute("message", message);
		listAllOrder();
	}
	
	public void checkout() throws ServletException, IOException {
		request.getRequestDispatcher("frontend/checkout.jsp").forward(request, response);
	}
	
	public void placeOrder() throws IOException {
		request.setCharacterEncoding("UTF-8");
		BookOrder bookOrder = new BookOrder();
		
		String recipientName = request.getParameter("fullname");
		String recipientPhone = request.getParameter("phone");
		String shippingAddress = request.getParameter("address");
		
		float shippingCost = Float.parseFloat(request.getParameter("shipping-option"));
		
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		
		for(Map.Entry<Book, Integer> entry : cart.getItems().entrySet()) {
			Book book = entry.getKey();
			Integer quantity = entry.getValue();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(bookOrder);
			orderDetail.setQuantity(quantity);
			orderDetails.add(orderDetail);
		}
		
		bookOrder.setRecipientName(recipientName);
		bookOrder.setRecipientPhone(recipientPhone);
		bookOrder.setShippingAddress(shippingAddress);
		bookOrder.setShippingCost(shippingCost);
		bookOrder.setCustomer(customer);
		bookOrder.setOrderDetails(orderDetails);
		
		orderDAO.create(bookOrder);

		cart.clear();
		
		response.sendRedirect("./view_orders");
	}
	
	public void listOrdersByCustomer() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		String fullname = customer.getFullname();
		List<BookOrder> list = orderDAO.listByCustomer(fullname);
		
		request.setAttribute("listOrder", list);
		request.getRequestDispatcher("frontend/my_orders.jsp").forward(request, response);
	}
	
	public void showOrderDetailForCustomer() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		String fullname = customer.getFullname();
		
		BookOrder bookOrder = orderDAO.getBookOrderDetailByCustomer(orderId, fullname);
		request.setAttribute("bookOrder", bookOrder);
		request.getRequestDispatcher("frontend/detail_order.jsp").forward(request, response);
	}
	
	public void showEditOrderForm() throws ServletException, IOException {
		System.out.println(request.getRequestURI());
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		BookOrder bookOrder = orderDAO.get(orderId);
		request.setAttribute("bookOrder", bookOrder);
		request.getRequestDispatcher("./order_form.jsp").forward(request, response);
	}
	
	public void receiveOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		orderDAO.updateOrder(orderId, "Completed");
		response.sendRedirect("./view_orders");
	}
	
	public void cancelOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		orderDAO.updateOrder(orderId, "Cancelled");
		response.sendRedirect("./view_orders");	
	}
}
