package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDao<Book>{

	public BookDAO() {
		super();
	}

	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}

	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
		
	}

	@Override
	public List<Book> listAll() {
		List<Book> list = super.findWithNamedQuery("Book.findAll");
		return list;
	}
	
	public Book findByTitle(String title) {
		List<Book> list = super.findWithNamedQuery("Book.findByTitle", "title", title);
		if(list != null && list.size() == 1) {
			return list.get(0);
		}
		return null;
	}
	
	public List<Book> search(String keyword) {
		return super.findWithNamedQuery("Book.search", "keyword", keyword);
	}
 
	@Override
	public long count() {
		return (long)super.countWithNamedQuery("Book.countAll");
	}
	
	public List<Book> listByCategory(Integer categoryId) {
		return super.findWithNamedQuery("Book.listByCategory", "categoryId", categoryId);
	}
	
	public List<Book> listNewBooks() {
		return super.findWithNamedQuery("Book.listNew", 0, 4);
	}

}
