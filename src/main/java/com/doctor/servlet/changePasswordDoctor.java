package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.doctorDao;
import com.dao.userdao;
import com.dbconnect.DBconnect;

@WebServlet("/changePassword")
public class changePasswordDoctor extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String newPassword=req.getParameter("newPassword");
		String oldPassword=req.getParameter("oldPassword");
		
		HttpSession session=req.getSession();
		doctorDao dao=new doctorDao(DBconnect.getcon());
		
		if(dao.changeoldPassword(uid, oldPassword)) {
			if(dao.changenewPassword(uid, newPassword)) {
				
				session.setAttribute("sucmsg", "Password Change Sucessfully ");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something Wrong on Server");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}	
		else {
			
			session.setAttribute("errmsg", "incorrect password");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
		
	}
	

}
