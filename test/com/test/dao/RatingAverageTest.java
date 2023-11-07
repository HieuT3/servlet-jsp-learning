package com.test.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Review;

public class RatingAverageTest {

	@Test
	public void calRatingAverageTest1() {
		Book book = new Book();
		
		Review review1 = new Review();
		review1.setRating(3);
		Review review2 = new Review();
		review2.setRating(4);
		Review review3 = new Review();
		review3.setRating(5);
		Set<Review> reviews = new HashSet<>();
		reviews.add(review1);
		reviews.add(review2);
		reviews.add(review3);
		
		book.setReviews(reviews);
		
		assertEquals(4.0, book.getRatingAverage(), 0.0f);
	}
	
	@Test
	public void calRatingAverageTest2() {
		Book book = new Book();
		
		assertEquals(0.0f, book.getRatingAverage(), 0.0f);
	}
	
	@Test
	public void starNumTest1() {
		Book book = new Book();
		float ratingAverage = 5.0f;
		String numStar = book.getRatingStar(ratingAverage);
		
		assertEquals("on,on,on,on,on", numStar);
	}
	
	@Test
	public void starNumTest2() {
		Book book = new Book();
		float ratingAverage = 3.0f;
		String numStar = book.getRatingStar(ratingAverage);
		
		assertEquals("on,on,on,off,off", numStar);
	}
	
	@Test
	public void starNumTest3() {
		Book book = new Book();
		float ratingAverage = 3.5f;
		String numStar = book.getRatingStar(ratingAverage);
		
		assertEquals("on,on,on,half,off", numStar);
	}

}
