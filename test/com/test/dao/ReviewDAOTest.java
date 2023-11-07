package com.test.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {
	
	private static ReviewDAO reviewDAO;
	private static CustomerDAO customerDAO;
	private static BookDAO bookDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
		customerDAO = new CustomerDAO();
		bookDAO = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	public void createReviewTest() {
		Customer customer = customerDAO.get(33);
		Book book = bookDAO.get(37);
		int rating = 5;
		String headine = "Bad Book!";
		String comment = "I dont like this book!";
		Review review = new Review(book, customer, rating, headine, comment);
		
		Review createdReview = reviewDAO.create(review);
		
		assertNotNull(createdReview);
	}
	
	@Test
	public void updateReviewTest() {
		Integer reviewId = 15;
		Review existedReview = reviewDAO.get(reviewId);
		String headline = "Bad Book";
		String comment = "I dont like this book!";
		existedReview.setHeadline(headline);
		existedReview.setComment(comment);
		
		Review updatedReview = reviewDAO.update(existedReview);
		
		assertEquals("Bad Book", updatedReview.getHeadline());
	}
	
	@Test
	public void getReviewExistTest() {
		Integer reviewId = 15;
		Review review = reviewDAO.get(reviewId);
		
		assertNotNull(review);
	}
	
	@Test
	public void getReviewNotExistTest() {
		Integer reviewId = 100;
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}
	
	@Test
	public void deleteReviewExistTest() {
		Integer reviewId = 15;
		reviewDAO.delete(reviewId);
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void deleteReviewNotExistTest() {
		Integer reviewId = 15;
		reviewDAO.delete(reviewId);
	}
	
	@Test
	public void listAllReviewTest() {
		List<Review> list = reviewDAO.listAll();
		for(Review review : list) {
			System.out.println(review.getReviewId() + " " + review.getHeadline());
		}
		
		assertTrue(list != null && list.size() > 0);
	}
	
	@Test
	public void countAllReviewTest() {
		long count = reviewDAO.count();
		
		assertEquals(2, count);
	}

}
