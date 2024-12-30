package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dao.doctorDao;
import com.dbconnect.DBconnect;
import com.entity.doctor;

@WebServlet("/updateStatus")
public class Appointmentupdate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int did=Integer.parseInt(req.getParameter("did"));	
			
			String comm=req.getParameter("comm");
			
			HttpSession session=req.getSession();
			
			AppointmentDao dao=new AppointmentDao(DBconnect.getcon());
			
			
			
			
			if( dao.updatedetails(id, did, comm)) {
				session.setAttribute("sucmsg", "The comment successfully");
				resp.sendRedirect("doctor/patient.jsp");
			}else {
				session.setAttribute("errmsg", "Something went wrong");
				resp.sendRedirect("doctor/patient.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
