package com.bookstore.controller.admin;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminLoginFilter
 */
@WebFilter("/admin/*")
public class AdminLoginFilter extends HttpFilter implements Filter {

    public AdminLoginFilter() {
        super();
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Admin Filter is invoked");
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession(false);
		String useremail = (String)session.getAttribute("useremail");
		boolean logIn = session != null && useremail != null;
		System.out.println(httpRequest.getRequestURI());
		String logInURI = httpRequest.getContextPath() + "/admin/login";
		boolean logInRequest = httpRequest.getRequestURI().equals(logInURI);
		
		boolean logInPage = httpRequest.getRequestURI().endsWith("login.jsp");
		if(logIn && (logInPage || logInRequest)) {
			httpRequest.getRequestDispatcher("/admin/").forward(httpRequest, httpResponse);
		}
		else if(logIn || logInRequest) {
			System.out.println("User is Logged in");
			chain.doFilter(httpRequest, response);
		} else {
			System.out.println("User is not logged in");
			String path = httpRequest.getRequestURI().substring("/BookStoreWeb/".length());
			String url = "";
			if(path.equals("admin")) url = "admin/login.jsp";
			else url = "login.jsp";
			httpRequest.getRequestDispatcher(url).forward(httpRequest, httpResponse);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
