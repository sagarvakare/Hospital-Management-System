package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userlogout")
public class Userlogout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			session.removeAttribute("usermsg");
			session.setAttribute("sucmsg", "User Logout Successfully");
			resp.sendRedirect("user.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	

}
