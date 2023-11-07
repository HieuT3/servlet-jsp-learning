package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.UsersDAO;
import com.bookstore.entity.Users;

public class UserServices {
	private UsersDAO usersDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		usersDAO = new UsersDAO();
	}
	
	public void listUser() throws ServletException, IOException {
		
		List<Users> listUsers = usersDAO.listAll();
		request.setAttribute("listUsers", listUsers);
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
	}
	
	public boolean createUser() throws IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users existUser = usersDAO.findByEmail(email);
		if(existUser != null) return false;
		else {
			Users users = new Users(email, fullName, password);
			usersDAO.create(users);
			return true;
		}
	}
	
	public void editUser() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Users user = usersDAO.get(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("user_form.jsp").forward(request, response);
		
	}
	
	public boolean updateUser() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		System.out.println(fullName);
		
		Users userById = usersDAO.get(id);
		Users userByEmail = usersDAO.findByEmail(email);
		if(userByEmail != null && userById.getUserId() != userByEmail.getUserId()) {
			return false;
		} else {
			Users user = new Users(id, email, fullName, password);
			usersDAO.update(user);
			return true;
		}
	}
	
	public void deleteUser() throws IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		usersDAO.delete(id);
	}
	
	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean result = usersDAO.checkLogin(email, password);
		if(result) {
			HttpSession session = request.getSession();
			session.setAttribute("useremail", email);
			request.getRequestDispatcher("").forward(request, response);
		} else {
			request.setAttribute("message", "Login failed");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	public void logout() throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("useremail");
		request.setAttribute("message", "You are logged out");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
}
