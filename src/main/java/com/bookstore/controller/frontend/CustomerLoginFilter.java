package com.bookstore.controller.frontend;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CustomerLoginFilter
 */
@WebFilter("/*")
public class CustomerLoginFilter extends HttpFilter implements Filter {
    
	private static String[] logInRequestURL = {
			"/view_profile", "/edit_profile", "/update_profile", "/place_order", "/view_orders", "/view_detail_order"
	};
	
    public CustomerLoginFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Customer Login Filter invoked");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
		String path = httpRequest.getRequestURI().toString();
		if(path.startsWith("/admin")) {
			chain.doFilter(request, response);
			return;
		}
		if(!loggedIn && check(path)) {
			request.getRequestDispatcher("frontend/login.jsp").forward(httpRequest, response);
		} else {
			chain.doFilter(request, response);
		}
	}
	
	private static boolean check(String requestURL) {
		for(String url : logInRequestURL) {
			if(requestURL.contains(url)) {
				return true;
			}
		}
		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
