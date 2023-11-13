package com.test.json;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.UsersDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Users;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

public class JsonConvertTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void test() throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		CategoryDAO categoryDAO = new CategoryDAO();
		Category category = categoryDAO.get(1);
		String arrJson = objectMapper.writeValueAsString(category);
		System.out.println("\n\n\n" + arrJson);
		assertTrue(arrJson.length() > 0);;
	}
	
	@Test
	public void test1() throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		BookDAO bookDAO = new BookDAO();
		List<Book> list = bookDAO.listByCategory(1);
		String arrJson = objectMapper.writeValueAsString(list);
		System.out.println("\n\n\n" + arrJson);
		assertTrue(arrJson.length() > 0);;
	}

}
