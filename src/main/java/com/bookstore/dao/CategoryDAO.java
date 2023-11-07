package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDao<Category>{

	public CategoryDAO() {
		super();
	}

	@Override
	public Category create(Category category) {
		return super.create(category);
		
	}

	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object id) {
		return super.find(Category.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Category.class, id);
		
	}

	@Override
	public List<Category> listAll() {
		return (List<Category>)super.findWithNamedQuery("Category.findAll");
	}
	
	public Category findByName(String name) {
		List<Category> list = super.findWithNamedQuery("Category.findByName", "name", name);
		if(list != null && list.size() == 1) return list.get(0);
		return null;
	}

	@Override
	public long count() {
		return (long)super.countWithNamedQuery("Category.countAll");
	}

}
