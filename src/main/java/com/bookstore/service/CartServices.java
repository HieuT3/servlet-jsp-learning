package com.bookstore.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CartServices {
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CartServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}
	
	public void viewCart() throws ServletException, IOException {
		ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new ShoppingCart();
		}
		request.getSession().setAttribute("cart", cart);
		request.getRequestDispatcher("frontend/shopping_cart.jsp").forward(request, response);
	}
	
	public void addToCart() throws ServletException, IOException {
		Object cart = request.getSession().getAttribute("cart");
		if(cart == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		BookDAO bookDAO = new BookDAO();
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		Book addedBook = bookDAO.get(bookId);
		shoppingCart.addItem(addedBook);
		request.getSession().setAttribute("cart", shoppingCart);
		
		int quantity = shoppingCart.getTotalQuantity();
		ObjectMapper mapper = new ObjectMapper();
		String quantityJson = mapper.writeValueAsString(quantity);
		System.out.println(quantityJson);
		
		response.setContentType("application/json");
		response.getWriter().write(quantityJson);
	}
	
	public void deleteItem() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.removeItemById(bookId);
		
		request.getSession().setAttribute("cart", shoppingCart);
		
	}
	
	public void clearCart() throws IOException {
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.clear();
		request.getSession().setAttribute("cart", shoppingCart);
		response.sendRedirect("view_cart");
	}
	
	public void updateCart() {
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		Map<Book, Integer> cart = shoppingCart.getItems();
		String[] ids = request.getParameter("bookIds").split(",");
		int size = ids.length;
		int[] bookIds = new int[size];
		int[] quantities = new int[size];
		int cnt = 0;
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			int bookId = entry.getKey().getBookId();
			int quatity = Integer.parseInt(ids[cnt]);
			bookIds[cnt] = bookId;
			quantities[cnt] = quatity;
			cnt++;
		}
		shoppingCart.updateCart(bookIds, quantities);
		request.getSession().setAttribute("cart", shoppingCart);
	}
}
