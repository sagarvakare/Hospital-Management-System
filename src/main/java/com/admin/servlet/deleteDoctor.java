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

@WebServlet("/Deletedoctor")
public class deleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			int id=Integer.parseInt(req.getParameter("id"));
			
			doctorDao dao=new doctorDao(DBconnect.getcon());
			
			
			HttpSession session=req.getSession();
			if(dao.deleteDoctor(id)) {
				session.setAttribute("sucmsg", "The doctor deleted successfully");
				resp.sendRedirect("admin/viewdoctor.jsp");
			}else {
				session.setAttribute("errmsg", "Something went Wrong");
				resp.sendRedirect("admin/viewdoctor.jsp");
			}
			
		
		
	}
	

}
