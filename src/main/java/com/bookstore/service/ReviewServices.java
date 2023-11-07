package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Review;

public class ReviewServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReviewDAO reviewDAO;
	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		reviewDAO = new ReviewDAO();
	}
	
	public void listAllReview() throws ServletException, IOException {
		List<Review> listReivew = reviewDAO.listAll();
		request.setAttribute("listReview", listReivew);
		request.getRequestDispatcher("review_list.jsp").forward(request, response);
	}
	
	public void editReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);
		request.setAttribute("review", review);
		request.getRequestDispatcher("review_form.jsp").forward(request, response);
	}
	
	public void updateReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review existedReview = reviewDAO.get(reviewId);
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		existedReview.setHeadline(headline);
		existedReview.setComment(comment);
		reviewDAO.update(existedReview);
		String message = "The review has been updated successfully";
		request.setAttribute("message", message);
		listAllReview();
	}
	
	public void deleteReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		reviewDAO.delete(reviewId);
		String message = "The review has been deleted successfully";
		request.setAttribute("message", message);
		listAllReview();
	}
}
