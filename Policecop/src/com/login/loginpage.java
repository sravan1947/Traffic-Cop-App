package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;

/**
 * Servlet implementation class loginpage
 */
@WebServlet("/loginpage")
public class loginpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String password = request.getParameter("pass");
		LoginDao doa= new LoginDao();
		try {
			System.out.println(name);
			if(doa.check(name,password))
			{
				
				HttpSession session= request.getSession();
				session.setAttribute("username",name);
				session.setAttribute("password", password);
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("register.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
