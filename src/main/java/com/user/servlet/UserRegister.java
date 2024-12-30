package com.user.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userdao;
import com.dbconnect.DBconnect;
import com.entity.User;
@WebServlet("/user_register")
public class UserRegister extends HttpServlet{
	
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String name=req.getParameter("name");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	
	User u=new User(name, email, password);
	userdao dao=new userdao(DBconnect.getcon());
	boolean f=dao.register(u);
      HttpSession session=req.getSession();
	
	if(f) {
		session.setAttribute("sucmsg", "Register Successful");
		resp.sendRedirect("signup.jsp");
	}else {
		
		session.setAttribute("errmsg", "Something went wrong");
		resp.sendRedirect("signup.jsp");
	}
	
}
}
