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
import com.entity.User;

@WebServlet("/userlogin")
public class Userlogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session=req.getSession();
			
			userdao dao=new userdao(DBconnect.getcon());
			User user=dao.login(email, password);
			
			
			if( user!=null) {
				session.setAttribute("usermsg", user);
				resp.sendRedirect("index.jsp");
			}else {
				session.setAttribute("errmsg", "invalid email & password");
				resp.sendRedirect("user.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	}

	

