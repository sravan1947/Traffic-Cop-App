package com.fine.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fine.dao.fineDao;
import com.fine.datamodel.finemodel;
import com.fine.mail.JavaMailUtil;

/**
 * Servlet implementation class finesservlet
 */
@WebServlet("/finesservlet")
public class finesservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private fineDao fin = new fineDao();
	private JavaMailUtil msg= new JavaMailUtil();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finesservlet() {
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
		// TODO Auto-generated method stub
		
		String violation_name=request.getParameter("violation_name");
		String violation_type=request.getParameter("violation_type");
		String driving_license=request.getParameter("driving_license");
		String vehicle_details=request.getParameter("vehicle details");
		String amount=request.getParameter("amount");
		String location=request.getParameter("location");
		String vechiclenumber=request.getParameter("vechiclenumber");
		String data_and_time=request.getParameter("dateandtime");
		String email=request.getParameter("email");
		finemodel p = new finemodel();
		p.setVoilation_name(violation_name);
		p.setVoilation_type(violation_type);
		p.setDriving_license(driving_license);
		p.setVehicle_details(vehicle_details);
		p.setData_and_time(data_and_time);
		p.setFine_amount(amount);
		p.setLocation(location);
		p.setVechicle_number(vechiclenumber);
		p.setEmail(email);
		try {
			fin.finedperson(p);
			JavaMailUtil.sendMail(email,p);
			
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
