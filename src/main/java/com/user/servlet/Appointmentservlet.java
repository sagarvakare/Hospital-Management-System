package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dbconnect.DBconnect;
import com.entity.Appointment;

@WebServlet("/Appointment")
public class Appointmentservlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		int userid=Integer.parseInt(req.getParameter("userid"));
		String fullname=req.getParameter("fullname");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String appoint_date=req.getParameter("appoint_date");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String diesease=req.getParameter("diesease");
		int doct=Integer.parseInt(req.getParameter("doct"));
		String address=req.getParameter("address");
		String status=req.getParameter("status");
		
		
		Appointment ap=new Appointment(userid, fullname, gender, age, appoint_date, email, phno, diesease, doct, address, "Pending");
		AppointmentDao dao=new AppointmentDao(DBconnect.getcon());
		
		HttpSession session=req.getSession();
		if(dao.appointment(ap)) {
			session.setAttribute("sucmsg", "Appointment sents Successful");
			resp.sendRedirect("user_appointment1.jsp");
		}else {
			
			session.setAttribute("errmsg", "Something went wrong");
			resp.sendRedirect("user_appointment1.jsp");
		}
		
	}
	
	

}
