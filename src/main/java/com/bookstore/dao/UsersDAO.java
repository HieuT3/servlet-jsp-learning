package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Users;

public class UsersDAO extends JpaDAO<Users> implements GenericDao<Users>{
	
	public UsersDAO() {
		super();
	}
	
	public Users create(Users users) {
		return super.create(users);
	}

	@Override
	public Users update(Users users) {
		return super.update(users);
	}

	@Override
	public Users get(Object usersId) {
		return super.find(Users.class, usersId);
	}

	@Override
	public void delete(Object usersId) {
		super.delete(Users.class, usersId);
	}

	@Override
	public List<Users> listAll() {
		return super.findWithNamedQuery("Users.findAll");
	}
	
	public Users findByEmail(String email) {
		List<Users> list = super.findWithNamedQuery("Users.findByEmail", "email", email);
		if(list != null && list.size() == 1) return list.get(0);
		return null;
	}

	@Override
	public long count() {
		return (long)super.countWithNamedQuery("Users.countAll");
	}
	
	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		
		List<Users> list = super.findWithNamedQuery("Users.checkLogin", parameters);
		
		if(list != null && list.size() == 1) return true;
		return false;
	}
}
