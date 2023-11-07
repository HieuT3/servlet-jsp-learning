package com.test.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.UsersDAO;
import com.bookstore.entity.Users;

public class UsersDAOTest {
	private static UsersDAO usersDAO;
	
	@BeforeClass
	public static void setUpClass() throws Exception {
		usersDAO = new UsersDAO();
	}

	@Test
	public void testCreateUsers() {
		Users users = new Users();
		users.setFullName("Hiếu");
		users.setEmail("hieu");
		users.setPassword("1");
		
		users = usersDAO.create(users);
		
		System.out.println(users.getFullName());
		
		assertTrue(users.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users users = new Users();
		usersDAO.create(users);
	}
	
	@Test
	public void TestUpdateUsers() {
		Users users = new Users();
		users.setUserId(23);
		users.setEmail("hieu@gmail.com");
		users.setFullName("hieuCB");	
		users.setPassword("982003");
		users = usersDAO.update(users);
		String expected = "982003";
		String actual = users.getPassword();
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUsersFound() {
		int id = 19;
		Users users = usersDAO.get(id);
		if(users != null) {
			System.out.println(users.getEmail());
		}
		assertNotNull(users);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer id = 99;
		Users users = usersDAO.get(id);
		
		assertNull(users);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer id = 23;
		usersDAO.delete(id);
		Users users = usersDAO.get(id);
		assertNull(users);
	}
	
	@Test(expected = Exception.class)
	public void testDeleteNonExitUsers() {
		Integer id = 100;
		usersDAO.delete(id);
	}
	
	@Test
	public void testFindAllUsers() {
		List<Users> listUsers = usersDAO.listAll();
		
		for(Users users : listUsers) {
			System.out.println(users.getEmail());
		}
		
		assertTrue(listUsers.size() > 0);
	}
	
	@Test
	public void testCountAllUsers() {
		long totalUsers = usersDAO.count();
		
		assertEquals(4, totalUsers);
	}
	
	@Test
	public void testFindByEmail() {
		Users user = usersDAO.findByEmail("user_hieu@gmail.com");
		
		assertNotNull(user);
	}
	
	@Test
	public void testCheckLogin() {
		String email = "user_hieu@gmail.com";
		String password = "123456789";
		boolean result = usersDAO.checkLogin(email, password);
		
		assertTrue(result);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		usersDAO.close();
		
	}
}
