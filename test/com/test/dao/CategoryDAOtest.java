package com.test.dao;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryDAOtest {
	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}
	
	@Test
	public void testCreateCategory() {
		Category category = new Category("PHP");
		Category category2 = categoryDAO.create(category);
		assertTrue(category2 != null && category2.getCategoryId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateCategoryNotSet() {
		Category category = new Category();
		categoryDAO.create(category);
	}
	
	@Test
	public void testUpdateCategory() {
		Category category = new Category();
		category.setCategoryId(14);
		category.setName("Javascript");
		Category newCategory = categoryDAO.update(category);
		String name = newCategory.getName();
		String expected = "Javascript";
		assertTrue(name.equals(expected));
	}
	
	@Test
	public void testGetCategory() {
		Category category = categoryDAO.get(11);
		assertTrue(category.getName().equals("Core Java"));
	}
	
	@Test
	public void testGetCategoryNotFound() {
		Category category = categoryDAO.get(100);
		assertNull(category);
	}
	
	@Test
	public void testDeleteCategory() {
		categoryDAO.delete(15);
		Category category = categoryDAO.get(15);
		assertNull(category);
	}
	
	@Test(expected = Exception.class)
	public void testDeleteCategoryNotExist() {
		categoryDAO.delete(100);
	}
	
	@Test 
	public void testListAllCategory() {
		List<Category> list = categoryDAO.listAll();
		assertTrue(list.size() > 0);
	}
	
	@Test
	public void testCountAllCategory() {
		long size = categoryDAO.count();
		assertTrue(size == 4);
	}
	
	@Test
	public void TestFindCategoryByName() {
		Category category = categoryDAO.findByName("Java Web");
		assertTrue(category.getName().equals("Java Web"));
	}
	
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}
	
}
