package com.bookstore.controller.admin.book;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookServices;

/**
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet("/admin/update_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 10, //10KB
		maxFileSize = 1024 * 300, // 300KB
		maxRequestSize = 1024 * 1024 // 1MB
)
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request, response);
		String message = "";
		try {
			boolean result = bookServices.updateBook();
			if(result) {
				message = "The book has been updated sucessfully";
			} else {
				message = "Could not update book because there's another book hanving same title";
			}
			request.setAttribute("message", message);
			bookServices.listAll();
		} catch (ParseException | IOException | ServletException e) {
			e.printStackTrace();
		}
		
	}

}
