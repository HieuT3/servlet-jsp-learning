package com.bookstore.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response; 
	
	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}
	
	public void listAllCustomer() throws ServletException, IOException {
		List<Customer> listCus = customerDAO.listAll();
		request.setAttribute("listCus", listCus);
		request.getRequestDispatcher("customer_list.jsp").forward(request, response);
	}
	
	public void readFieldCustomer(Customer customer) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");

		if(email != null && !email.equals("")) {
			customer.setEmail(email);
		}
		customer.setFullname(fullName);
		if(password != null && !password.equals("")) {
			customer.setPassword(password);
		}
	}
	
	public void createCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		Customer existedCustomer = customerDAO.findByEmail(email);
		String message = "";
		if(existedCustomer == null) {
			Customer customer = new Customer();
			readFieldCustomer(customer);
			customerDAO.create(customer);
			message = "New customer has been created successfully";
		} else {
			message = "Could not create new customer because the email is already existed";
		}
		request.setAttribute("message", message);
		listAllCustomer();
	}		
	
	public void editCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		request.setAttribute("customer", customer);
		request.getRequestDispatcher("customer_form.jsp").forward(request, response);
	}
	
	public void updateCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customerById = customerDAO.get(customerId);
		String email = request.getParameter("email");
		Customer customerByEmail = customerDAO.findByEmail(email);
		String message = "";
		if(customerByEmail != null && customerByEmail.getCustomerId() != customerById.getCustomerId()) {
			message = "Could not update customer because the email is already exists";
		} else {
			Customer customer = new Customer();
			readFieldCustomer(customer);
			customer.setCustomerId(customerId);
			customerDAO.update(customer);
			message = "The customer has been updated successfully";
		}
		request.setAttribute("message", message);
		listAllCustomer();
	}
	
	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		customerDAO.delete(customerId);
		String message = "The customer has been deleted successfully";
		request.setAttribute("message", message);
		listAllCustomer();
	}
	
	public void registerCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		Customer existedCustomer = customerDAO.findByEmail(email);
		String message = "";
		if(existedCustomer == null) {
			Customer customer = new Customer();
			readFieldCustomer(customer);
			customerDAO.create(customer);
			message = "New customer has been created successfully";
			request.setAttribute("message", message);
			request.getRequestDispatcher("frontend/message.jsp").forward(request, response);
		} else {
			message = "Could not register new customer because the email is already existed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("frontend/register_form.jsp").forward(request, response);
		}
	}
	
	public void doLogin() throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Customer customer = customerDAO.checkLogin(email, password);
		if(customer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			String url = request.getHeader("referer");
			response.sendRedirect(url);
		} else {
			String message = "The email or password error";
			request.setAttribute("message", message);
			request.getRequestDispatcher("frontend/login.jsp").forward(request, response);
		}
	}
	
	public void doLogout() throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loggedCustomer");
		response.sendRedirect("./");
	}
	
	public void showProfileManagement() throws ServletException, IOException {
		request.getRequestDispatcher("frontend/view_profile.jsp").forward(request, response);
	}
	
	public void editProfile() throws ServletException, IOException {
		request.getRequestDispatcher("frontend/edit_profile.jsp").forward(request, response);
	}
	
	public void updateProfile() throws ServletException, IOException {
		Customer customer =(Customer)request.getSession().getAttribute("loggedCustomer");
		readFieldCustomer(customer);
		Customer updatedCustomer = customerDAO.update(customer);
		request.getSession().setAttribute("loggedCustomer", updatedCustomer);
		
		String message = "Your profile has been updated successfully";
		request.setAttribute("message", message);
		request.getRequestDispatcher("frontend/view_profile.jsp").forward(request, response);
	}
}
