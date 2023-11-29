package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BookServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private CategoryDAO categoryDAO;
	
	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();
	}
	
	public void viewBookDetails() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		request.setAttribute("book", book);
		request.getRequestDispatcher("frontend/book_details.jsp").forward(request, response);
	}
	
	public void listAll() throws ServletException, IOException {
		List<Book> listBook = bookDAO.listAll();
		request.setAttribute("listBook", listBook);
		request.getRequestDispatcher("book_list.jsp").forward(request, response);
	}
	
	public void ListAllBookForCustomer() throws ServletException, IOException {
		List<Book> listBook = bookDAO.listAll();
		ObjectMapper objectMapper = new ObjectMapper();
		String listBookJson = objectMapper.writeValueAsString(listBook);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		response.getWriter().write(listBookJson);
	}
	
	public void showNewBookForm() throws ServletException, IOException {
		List<Category> list = categoryDAO.listAll();
		request.setAttribute("listCate", list);
		
		request.getRequestDispatcher("book_form.jsp").forward(request, response);
	}
	
	public void readBookFields(Book newBook) throws ParseException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		Category category = categoryDAO.get(categoryId);
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String isbn = request.getParameter("isbn");
		String publishDate = request.getParameter("publishDate");
		float price = Float.parseFloat(request.getParameter("price"));
		String description = request.getParameter("description");
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(publishDate);
		String dateFormated = new SimpleDateFormat("dd/MM/yyyy").format(date);
		Date publishDateFormated = new SimpleDateFormat("dd/MM/yyyy").parse(dateFormated);
		
		newBook.setCategory(category);
		newBook.setTitle(title);
		newBook.setAuthor(author);
		newBook.setIsbn(isbn);
		newBook.setPublishDate(publishDateFormated);
		newBook.setPrice(price);
		newBook.setDescription(description);
		Part part = request.getPart("bookImage");
		if(part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			newBook.setImage(imageBytes);
		}
	}
	
	public boolean createBook() throws ParseException, IOException, ServletException  {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		Book existedBook = bookDAO.findByTitle(title);
		if(existedBook != null) return false;
		Book newBook = new Book();
		readBookFields(newBook);
		bookDAO.create(newBook);
		return true;
	}
	
	public void editBook() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		List<Category> listCate = categoryDAO.listAll();
		request.setAttribute("book", book);
		request.setAttribute("listCate", listCate);
		request.getRequestDispatcher("book_form.jsp").forward(request, response);
	}
	
	public boolean updateBook() throws ParseException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		Book bookById = bookDAO.get(bookId);
		Book bookByTitle = bookDAO.findByTitle(title);
		
		if(bookByTitle != null && bookByTitle.getBookId() != bookById.getBookId()) return false;
		
		readBookFields(bookById);
		bookDAO.update(bookById);
		return true;
	}
	
	public void deleteBook() {
		Integer id = Integer.parseInt(request.getParameter("id"));
		bookDAO.delete(id);
	}
	
	public void listBookByCategory() throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("id"));

		List<Book> list = bookDAO.listByCategory(categoryId);
		ObjectMapper objectMapper = new ObjectMapper();
		String listJson = objectMapper.writeValueAsString(list);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(listJson);
	}
	
	public void searchBook() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		String normalized = Normalizer.normalize(keyword.toLowerCase(), Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		String normalizedKeyword = pattern.matcher(normalized).replaceAll("");
		List<Book> listBook = bookDAO.search(normalizedKeyword);
		ObjectMapper objectMapper = new ObjectMapper();
		String listBookJson = objectMapper.writeValueAsString(listBook);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		response.getWriter().write(listBookJson);
	}
}
