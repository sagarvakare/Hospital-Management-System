package com.admin.servlet;

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

@WebServlet("/update")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			String fullname=req.getParameter("fullname");
			
			String dob=req.getParameter("dob");

			String qualification=req.getParameter("qualification");
			
			String specialist=req.getParameter("specialist");
			
			String email=req.getParameter("email");
			
			String mobno=req.getParameter("mobno");
			
			String password=req.getParameter("password");
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			doctor d=new doctor(id,fullname, dob, qualification, specialist, email, mobno, password);
			doctorDao dao=new doctorDao(DBconnect.getcon());
			
			
			HttpSession session=req.getSession();
			if(dao.updatedoctor(d)) {
				session.setAttribute("sucmsg", "The doctor Updated successfully");
				resp.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errmsg", "Something went Wrong");
				resp.sendRedirect("admin/doctor.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
