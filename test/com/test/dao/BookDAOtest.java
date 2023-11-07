package com.test.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOtest {
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	public void createBookTest() throws ParseException, IOException {
		Book newBook = new Book();
		
		Category category = new Category("Core Java");
		category.setCategoryId(11);
		
		newBook.setCategory(category);
		newBook.setTitle("Java 8 in Action: Lambdas, Streams, and functional-style programming");
		newBook.setAuthor("Raoul-Gabriel Urma");
		newBook.setDescription("Java 8 in Action is a clearly written guide to the new features of Java 8. The book covers lambdas, streams, and functional-style programming. With Java 8's functional features you can now write more concise code in less time, and also automatically benefit from multicore architectures. It's time to dig in!");
		newBook.setIsbn("1617291994");
		newBook.setPrice(36.72F);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = sdf.parse("08/28/2014");
		
		newBook.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\acer\\OneDrive - ptit.edu.vn\\JavaWeb\\EcomerceProject\\NSTH-Java.Servlet.JSP.Hibernate.Part1\\21. Implement Create Book Feature\\dummy-data-for-books\\Book 02 - Java 8 in Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void updateBookTest() throws ParseException, IOException {
		Book existedBook = new Book();
		existedBook.setBookId(32);
		
		Category category = new Category("Java Web");
		category.setCategoryId(12);
		existedBook.setCategory(category);
		existedBook.setTitle("Java 8 in Action: Lambdas, Streams, and functional-style programming");
		existedBook.setAuthor("Joshua Bloch");
		existedBook.setDescription("This highly anticipated new edition of the classic, Jolt Award-winning work has been thoroughly updated to cover Java SE 5 and Java SE 6 features introduced since the first edition. Bloch explores new design patterns and language idioms, showing you how to make the most of features ranging from generics to enums, annotations to autoboxing");
		existedBook.setIsbn("0321356683");
		existedBook.setPrice(40F);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = sdf.parse("05/28/2008");
		
		existedBook.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\acer\\OneDrive - ptit.edu.vn\\JavaWeb\\EcomerceProject\\NSTH-Java.Servlet.JSP.Hibernate.Part1\\21. Implement Create Book Feature\\dummy-data-for-books\\Book 01 - Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		existedBook.setImage(imageBytes);
		
		Book updatedBook = bookDAO.update(existedBook);
		
		assertEquals("Java 8 in Action: Lambdas, Streams, and functional-style programming", updatedBook.getTitle());
	}
	
	@Test(expected = Exception.class)
	public void deleteBookTestFailed() {
		Integer bookId = 100;
		bookDAO.delete(bookId);
		
	}
	
	@Test
	public void deleteBookTestSuccess() {
		Integer bookId = 33;
		bookDAO.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void getBookDontExist() {
		Integer bookId = 10;
		Book book = bookDAO.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void getBookExist() {
		Integer bookId = 33;
		Book book = bookDAO.get(bookId);
		System.out.println(book.getTitle());
		assertNotNull(book);
	}
	
	@Test
	public void listAllBookTest() {
		List<Book> list = bookDAO.listAll();
		
		assertTrue(list != null && list.size() == 1);
	}
	
	@Test
	public void findByTitleTest() {
		String title = "Effective Java (2nd Edition)";
		Book book = bookDAO.findByTitle(title);
		
		assertNotNull(book);
	}
	
	@Test
	public void countAllTest() {
		long cnt = bookDAO.count();
		
		assertTrue(cnt > 0);
	}
	
	@Test
	public void listByCategoryTest() {
		Integer categoryId = 11;
		List<Book> listBook = bookDAO.listByCategory(categoryId);
		assertTrue(listBook.size() > 0);
	}
	
	@Test
	public void listNewBooks() {
		List<Book> list = bookDAO.listNewBooks();
		
		assertTrue(list.size() == 4);
	}
	
	@Test
	public void searchBookByTitleTest() {
		String keyword = "java";
		List<Book> listBook = bookDAO.search(keyword);
		for(Book book : listBook) {
			System.out.println(book.getBookId() + " " + book.getTitle());
		}
		assertTrue(listBook.size() > 0);
	}
	
	@Test
	public void searchByAuthorTest() {
		String keyword = "Joshua";
		List<Book> listBook = bookDAO.search(keyword);
		for(Book book : listBook) {
			System.out.println(book.getBookId() + " " + book.getAuthor());
		}
		assertTrue(listBook.size() == 1);
	}
}
