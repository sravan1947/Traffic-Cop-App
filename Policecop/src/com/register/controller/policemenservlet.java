package com.register.controller;

import java.io.IOException;
import hash.password;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.register.dao.copDao;
import com.register.datamodel.policemen;

/**
 * Servlet implementation class policemenservlet
 */
public class policemenservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private copDao cop = new copDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public policemenservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=request.getParameter("firstname");
		String secondname=request.getParameter("secondname");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String contact=request.getParameter("contact");
		policemen p = new policemen();
		p.setFirstname(firstname);
		p.setLastname(secondname);
		p.setUsername(username);
		p.setAddress(address);
		p.setPassword(password);
		p.setContact(contact);
		try {
			cop.registercop(p);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("register.jsp");
	}

}
