package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userdao;
import com.dbconnect.DBconnect;

@WebServlet("/userChangePassword")
public class changePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String newPassword=req.getParameter("newPassword");
		String oldPassword=req.getParameter("oldPassword");
		
		HttpSession session=req.getSession();
		userdao dao=new userdao(DBconnect.getcon());
		
		if(dao.changeoldPassword(uid, oldPassword)) {
			if(dao.changenewPassword(uid, newPassword)) {
				session.setAttribute("sucmsg", "Password Updated Sucessfully ");
				resp.sendRedirect("changepassword.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something Wrong on Server");
				resp.sendRedirect("changepassword.jsp");
			}
		}	
		else {
			
			session.setAttribute("errmsg", "incorrect password");
			resp.sendRedirect("changepassword.jsp");
		}
		
	}
	
	

}
