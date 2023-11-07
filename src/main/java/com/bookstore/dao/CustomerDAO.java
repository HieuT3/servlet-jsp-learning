package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDao<Customer>{

	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer update(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.update(customer);
	}

	@Override
	public Customer get(Object customerId) {
		return super.find(Customer.class, customerId);
	}

	@Override
	public void delete(Object customerId) {
		super.delete(Customer.class, customerId);
		
	}

	@Override
	public List<Customer> listAll() {
		return (List<Customer>)super.findWithNamedQuery("Customer.listAll");
	}

	@Override
	public long count() {
		return (long)super.countWithNamedQuery("Customer.countAll");
	}
	
	public Customer findByEmail(String email) {
		List<Customer> list = super.findWithNamedQuery("Customer.findByEmail", "email", email);
		if(list != null && list.size() == 1) return list.get(0);
		return null;
	}
	
	public Customer checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		List<Customer> list = super.findWithNamedQuery("Customer.checkLogin", parameters);
		if(list != null && list.size() == 1) return list.get(0);
		return null;
	}
}
