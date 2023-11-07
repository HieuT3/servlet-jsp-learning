package com.bookstore.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

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
		if(bookId > 0) {
			Book addedBook = bookDAO.get(bookId);
			shoppingCart.addItem(addedBook);
		} else {
			Book minusedBook = bookDAO.get(bookId * (-1));
			shoppingCart.minusItem(minusedBook);
		}
		request.getSession().setAttribute("cart", shoppingCart);
		response.sendRedirect("./view_cart");
	}
	
	public void deleteItem() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.removeItemById(bookId);
		
		request.getSession().setAttribute("cart", shoppingCart);
		response.sendRedirect("view_cart");
	}
	
	public void clearCart() throws IOException {
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.clear();
		request.getSession().setAttribute("cart", shoppingCart);
		response.sendRedirect("view_cart");
	}
}
