package com.test.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	
	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO(); 
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	public void createCustomerTest() {
		Customer customer = new Customer();
		customer.setEmail("hieu@gmail.com");
		customer.setFullname("Cao Ba Hieu");
		customer.setAddress("KK");
		customer.setPhone("0123456789");
		customer.setPassword("123456");
		customer.setRegisterDate(new Date());
		
		Customer createdCustomer = customerDAO.create(customer);
		
		assertTrue(createdCustomer.getCustomerId() > 0);
	}
	
	@Test
	public void updateCustomerTest() {
		Integer customerId = 11;
		Customer customer = customerDAO.get(customerId);
		customer.setAddress("Kieu Ky");
		
		Customer updatedCustomer = customerDAO.update(customer);
		
	}
	
	@Test
	public void getCustomerExistTest() {
		Integer customerId = 11;
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void getCustomerNotExistTest() {
		Integer customerId = 100;
		Customer customer = customerDAO.get(customerId);
		
		assertNull(customer);
	}
	
	@Test
	public void deleteCustomerExistTest() {
		Integer customerId = 11;
		customerDAO.delete(customerId);
		
		Customer customer = customerDAO.get(customerId);
		assertNull(customer);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void deleteCustomerNotExistTest() {
		Integer customerId = 100;
		customerDAO.delete(customerId);
	}
	
	@Test
	public void listAllCustomerTest() {
		List<Customer> list = customerDAO.listAll();
		
		for(Customer customer : list) {
			System.out.println(customer.getCustomerId() + " " + customer.getFullname());
		}
		
		assertTrue(list != null && list.size() > 0);
	}
	
	@Test
	public void countAllCustomerTest() {
		long size = customerDAO.count();
		System.out.println(size);
		assertTrue(size > 0);
	}
	
	@Test
	public void findByEmailTest() {
		String email = "hieu@gmail.com";
		Customer customer = customerDAO.findByEmail(email);
		
		assertNotNull(customer);
	}
	
	@Test
	public void checkLoginTest() {
		String email = "hieucao135kk@gmail.com";
		String password = "123456";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNotNull(customer);
	}
}
