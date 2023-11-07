package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.categoryDAO = new CategoryDAO();
	}
	
	public void listCategory() throws ServletException, IOException {
		List<Category> list = categoryDAO.listAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("category_list.jsp").forward(request, response);
	}
	
	public boolean createCategory() {
		String name = request.getParameter("name");
		Category category = categoryDAO.findByName(name);
		if(category != null) {
			return false;
		} else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			return true;
		}
	}
	
	public void editCategory() throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(id);
		request.setAttribute("category", category);
		request.getRequestDispatcher("category_form.jsp").forward(request, response);
	}
	
	public boolean updateCategory() {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		Category categoryById = categoryDAO.get(id);
		Category categoryByName = categoryDAO.findByName(name);
		if(categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) return false;
		else {
			categoryDAO.update(new Category(id, name));
			return true;
		}
	}
	
	public void deleteCategory() {
		Integer id = Integer.parseInt(request.getParameter("id"));
		categoryDAO.delete(id);
	}
}
