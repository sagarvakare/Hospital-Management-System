package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.dbconnect.DBconnect;
import com.entity.User;
@WebServlet("/addspecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName=req.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DBconnect.getcon());
	boolean f=dao.addSpecialist(specName);
	HttpSession session=req.getSession();
	
	if(f) {
		session.setAttribute("sucmsg", "Specialist Added");
		resp.sendRedirect("admin/index.jsp");
	}else {
		session.setAttribute("errmsg", "Something wrong on server");
		resp.sendRedirect("admin.jsp");
	}
	}
	

}
