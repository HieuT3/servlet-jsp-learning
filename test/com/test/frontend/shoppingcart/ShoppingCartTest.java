package com.test.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

public class ShoppingCartTest {
	private static BookDAO bookDAO;
	private static ShoppingCart shoppingCart;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
		shoppingCart = new ShoppingCart();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	public void testAddItem() {
		
		Map<Book, Integer> cart = shoppingCart.getItems();
		int quantity = cart.get(new Book(1));
		assertEquals(2, quantity);;
	}
	
	@Test
	public void testRemoveItem() {
		shoppingCart.removeItem(new Book(2));
		
		Map<Book, Integer> cart = shoppingCart.getItems();
		
		assertNull(cart.get(new Book(2)));
	}
	
	@Test
	public void testGetTotalQuantity() {
		
	}
	
	@Test
	public void testGetTotalAmount() {
		double total = shoppingCart.getTotalAmount();
		double expected = 25;
		assertEquals(expected, total, 0.0d);
	}
	
	@Test
	public void testClear() {
		shoppingCart.clear();
		
		Map<Book, Integer> cart = shoppingCart.getItems();
		assertTrue(cart.size() == 0);
	}

}
