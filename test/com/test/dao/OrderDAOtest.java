package com.test.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOtest {
	
	private static OrderDAO orderDAO;
	private static BookDAO bookDAO;
	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
		bookDAO = new BookDAO();
		customerDAO = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder1() {
		BookOrder bookOrder = new BookOrder();
		
		Customer customer = customerDAO.get(1);
		String shippingAddress = "KK";
		String recipientName = "CBHieu";
		String recipientPhone = "0987183624";
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = bookDAO.get(1);
		orderDetail.setBook(book);
		orderDetail.setBookOrder(bookOrder);
		orderDetail.setQuantity(2);
		
		orderDetails.add(orderDetail);
		
		bookOrder.setCustomer(customer);
		bookOrder.setRecipientName(recipientName);
		bookOrder.setRecipientPhone(recipientPhone);
		bookOrder.setShippingAddress(shippingAddress);

		bookOrder.setOrderDetails(orderDetails);
		
		BookOrder newBookOrder = orderDAO.create(bookOrder);
		
		assertNotNull(newBookOrder);
	}
	
	@Test
	public void testCreateBookOrder2() {
		BookOrder bookOrder = new BookOrder();
		
		Customer customer = customerDAO.get(1);
		String shippingAddress = "KK-GL-HN";
		String recipientName = "Hieu";
		String recipientPhone = "0987183624";
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		OrderDetail orderDetail = new OrderDetail();
		OrderDetail orderDetail1 = new OrderDetail();
		
		Book book = bookDAO.get(2);
		orderDetail.setBook(book);
		orderDetail.setBookOrder(bookOrder);
		orderDetail.setQuantity(4);
		
		Book book1 = bookDAO.get(3);
		orderDetail1.setBook(book1);
		orderDetail1.setBookOrder(bookOrder);
		orderDetail1.setQuantity(5);
		
		orderDetails.add(orderDetail);
		orderDetails.add(orderDetail1);
		
		bookOrder.setCustomer(customer);
		bookOrder.setRecipientName(recipientName);
		bookOrder.setRecipientPhone(recipientPhone);
		bookOrder.setShippingAddress(shippingAddress);

		bookOrder.setOrderDetails(orderDetails);
		
		BookOrder newBookOrder = orderDAO.create(bookOrder);
		
		assertNotNull(newBookOrder);
	}
	
	@Test
	public void testGetBookOrder() {
		Integer orderId = 4;
		BookOrder bookOrder = orderDAO.get(orderId);
		
		assertTrue(bookOrder.getOrderDetails().size() == 2);
	}
	
	@Test
	public void testListAllBookOrder() {
		List<BookOrder> list = orderDAO.listAll();
		
		assertTrue(list != null && list.size() > 0);
		System.out.println(list.size());
	}
	
	@Test
	public void testUpdateBookOrder() {
		Integer orderId = 4;
		BookOrder bookOrder = orderDAO.get(orderId);
		bookOrder.setStatus("Complete");
		
		BookOrder updatedBookOrder = orderDAO.update(bookOrder);
		
		assertTrue(updatedBookOrder.getStatus().equals("Complete"));
	}
	
	@Test
	public void testDeleteBookOrderExist() {
		Integer orderId = 15;
		orderDAO.delete(orderId);
		
		BookOrder bookOrder = orderDAO.get(orderId);
		
		assertNull(bookOrder);
	}
	
	@Test(expected = Exception.class)
	public void testDeleteBookOrderNotExist() {
		Integer orderId = 100;
		orderDAO.delete(orderId);

	}
	
	@Test
	public void testCountBookOrder() {
		long count = orderDAO.count();
		assertTrue(count == 1);
	}
	
	@Test
	public void testListByCustomer() {
		String fullname = "Cao Bá Hiếu";
		List<BookOrder> bookOrder = orderDAO.listByCustomer(fullname);
		
		assertTrue(bookOrder != null && bookOrder.size() > 0);
		for(BookOrder order : bookOrder) {
			System.out.println(order.getTotal());
		}
	}
	
	@Test
	public void testGetOrderDetailByCustomer() {
		Integer orderId = 16;
		String fullname = "Cao Bá Hiếu";
		BookOrder bookOrder = orderDAO.getBookOrderDetailByCustomer(orderId, fullname);
		
		assertNotNull(bookOrder);
		
		System.out.println(bookOrder.getTotal());
	}
	
	@Test
	public void testGetOrderDetailByCustomer1() {
		Integer orderId = 12;
		String fullname = "Cao Bá Hiếu";
		BookOrder bookOrder = orderDAO.getBookOrderDetailByCustomer(orderId, fullname);
		
		assertNull(bookOrder);
	}
	
	@Test
	public void testReceiveOrder() {
		Integer orderId = 28;
		String status = "Completed";
		int cnt = orderDAO.updateOrder(orderId, status);
		
		assertTrue(cnt > 0 && cnt == 1);
	}
	
	@Test
	public void testCancelOrder() {
		Integer orderId = 29;
		String status = "Cancelled";
		int cnt = orderDAO.updateOrder(orderId, status);
		
		assertTrue(cnt > 0 && cnt == 1);
	}
}
