package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.BookOrder;

public class OrderDAO extends JpaDAO<BookOrder> implements GenericDao<BookOrder>{

	@Override
	public BookOrder create(BookOrder bookOrder) {
		bookOrder.setOrderDate(new Date());
		bookOrder.setPaymentMethod("Cash on Delivery");
		bookOrder.setStatus("Processing");
		return super.create(bookOrder);
	}

	@Override
	public BookOrder update(BookOrder bookOrder) {
		return super.update(bookOrder);
	}

	@Override
	public BookOrder get(Object bookObjectId) {
		return super.find(BookOrder.class, bookObjectId);
	}

	@Override
	public void delete(Object bookObjectId) {
		super.delete(BookOrder.class, bookObjectId);
	}

	@Override
	public List<BookOrder> listAll() {
		return super.findWithNamedQuery("BookOrder.listAll");
	}

	@Override
	public long count() {
		return (long) super.countWithNamedQuery("BookOrder.countAll");
	}
	
	public List<BookOrder> listByCustomer(Object fullname) {
		return super.findWithNamedQuery("BookOrder.listByCustomer", "fullname", fullname);
	}
	
	public BookOrder getBookOrderDetailByCustomer(Object orderId, Object fullname) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", orderId);
		parameters.put("fullname", fullname);
		List<BookOrder> list = super.findWithNamedQuery("BookOrder.orderDetailByCustomer", parameters);
		if(list != null && list.size() > 0) return list.get(0);
		return null;
	}

}
