package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/adminlogout")
public class adminlogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			session.removeAttribute("getmsg");
			session.setAttribute("sucmsg", "Admin logout successfully");
			resp.sendRedirect("admin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
