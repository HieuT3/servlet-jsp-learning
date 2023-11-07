package com.test.entity;
import com.bookstore.dao.UsersDAO;
import com.bookstore.entity.Users;

public class UsersTest {

	public static void main(String[] args) {
		UsersDAO usersDAO = new UsersDAO();
		Users user = usersDAO.get(6);
		System.out.println(user.getFullName());
		user.setFullName("Cao Bá Hiếu");
		Users newUser = usersDAO.update(user);
		System.out.println(newUser.getFullName());

	}

}
