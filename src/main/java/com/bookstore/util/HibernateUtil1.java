package com.bookstore.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.OrderDetailId;
import com.bookstore.entity.Review;
import com.bookstore.entity.Users;

public class HibernateUtil1 {
	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
        try {
            // Load configuration from hibernate.cfg.xml
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");

            // Other configurations and mappings can be added if needed
            // For example, if using JPA annotations:
            
             configuration.addAnnotatedClass(Users.class);
             configuration.addAnnotatedClass(Review.class);
             configuration.addAnnotatedClass(OrderDetail.class);
             configuration.addAnnotatedClass(OrderDetailId.class);
             configuration.addAnnotatedClass(Customer.class);
             configuration.addAnnotatedClass(Category.class);
             configuration.addAnnotatedClass(BookOrder.class);
             configuration.addAnnotatedClass(Book.class);

            // Build and return SessionFactory
            return configuration.buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
	
	
}
