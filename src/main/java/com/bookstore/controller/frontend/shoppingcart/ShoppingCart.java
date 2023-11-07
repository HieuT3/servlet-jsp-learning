package com.bookstore.controller.frontend.shoppingcart;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.Transient;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

public class ShoppingCart {
	private Map<Book, Integer> cart = new LinkedHashMap<>();
	
	public ShoppingCart() {
		
	}
	
	public void addItem(Book book) {
		if(cart.containsKey(book)) cart.put(book, cart.get(book) + 1);
		else cart.put(book, 1);
	}
	
	public void minusItem(Book book) {
		if(cart.containsKey(book)) {
			if(cart.get(book) > 1) cart.put(book, cart.get(book) - 1);
			else cart.remove(book);
		}
	}
	
	public void removeItem(Book book) {
		if(cart.containsKey(book)) cart.remove(book);
	}
	
	public void removeItemById(int id) {
		BookDAO bookDAO = new BookDAO();
		Book book = bookDAO.get(id);
		if(cart.containsKey(book)) cart.remove(book);
	}
	
	public void clear() {
		cart.clear();
	}
	
	@Transient
	public int getTotalItems() {
		return cart.size();
	}
	
	public int getTotalQuantity() {
		int sum = 0;
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			sum += entry.getValue();
		}
		return sum;
	}
	
	public double getTotalAmount() {
		double total = 0;
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			total += entry.getKey().getPrice() * entry.getValue();
		}
		return total;
	}
	
	public Map<Book, Integer> getItems() {
		return cart;
	}
	
	public void updateCart(int[] bookIds, int[] quantities) {
		
	}
}
