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
import com.entity.User;
import com.entity.doctor;

@WebServlet("/doctorlogin")
public class Doctorlogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session=req.getSession();
			
			doctorDao dao=new doctorDao(DBconnect.getcon());
			doctor doc=dao.doctorlogin(email, password);
			
			
			if( doc!=null) {
				session.setAttribute("docmsg", doc);
				resp.sendRedirect("doctor/index.jsp");
			}else {
				session.setAttribute("errmsg", "invalid email & password");
				resp.sendRedirect("doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
