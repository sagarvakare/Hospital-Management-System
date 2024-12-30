package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.doctorDao;
import com.dbconnect.DBconnect;
import com.entity.doctor;


@WebServlet("/editprofile")
public class EditProfile extends HttpServlet{
	
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			String fullname=req.getParameter("fullname");
			
			String dob=req.getParameter("dob");

			String qualification=req.getParameter("qualification");
			
			String specialist=req.getParameter("specialist");
			
			String email=req.getParameter("email");
			
			String mobno=req.getParameter("mobno");
			
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			doctor d=new doctor(id,fullname, dob, qualification, specialist, email, mobno, "");
			doctorDao dao=new doctorDao(DBconnect.getcon());
			
			
			HttpSession session=req.getSession();
			
			if(dao.EditdoctorProfile(d)) {
				doctor updatedoc=dao.getdoctorByid(id);
				session.setAttribute("sucmsgd", "The doctor Updated successfully");
				session.setAttribute("docmsg", updatedoc);
				resp.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errmsgd", "Something went Wrong");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
}
}


