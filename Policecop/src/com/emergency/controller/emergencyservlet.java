package com.emergency.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emergency.dao.EmergencyDao;
import com.emergency.fine.JavaMailUtil;
import com.emergency.model.emergency_model;

/**
 * Servlet implementation class emergencyservlet
 */
@WebServlet("/emergencyservlet")
public class emergencyservlet extends HttpServlet {
	EmergencyDao dao=new EmergencyDao();
	JavaMailUtil a= new JavaMailUtil();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emergencyservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String voilation_type= request.getParameter("voilation_type");
		 String affected = request.getParameter("affected");
		 String phone_no = request.getParameter("Phone_no");
		 String location = request.getParameter("location");
		 emergency_model  d= new emergency_model();
		 d.setAffected(affected);
		 d.setLocation(location);
		 d.setPhone_no(phone_no);
		 d.setVoilationtype(voilation_type);
		 try {
			dao.emergencyperson(d);
			a.sendMail(d);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 response.sendRedirect("home.jsp");
	}

}
