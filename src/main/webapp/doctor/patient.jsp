<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.dao.doctorDao"%>
<%@page import="com.entity.doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty docmsg }">
		<c:redirect url="../doctor.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${not empty errmsg}">
							<p class="fs-4 text-center text-danger">${errmsg}</p>
							<c:remove var="errmssg" scope="session" />
						</c:if>
						<c:if test="${not empty sucmsg}">
							<p class=" fs-4 text-center text-success">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							
							<tbody>
								<%doctor d=(doctor)session.getAttribute("docmsg");
								AppointmentDao dao=new AppointmentDao(DBconnect.getcon());
										List<Appointment> list=dao.GetallappointmentByDoctorId(d.getId());
												for(Appointment ap:list){
												%>
												<th><%=ap.getFullname() %></th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getAppointDate() %></td>
									<td><%=ap.getEmail() %></td>
									<td><%=ap.getPhno() %></td>
									<td><%=ap.getDiesease() %></td>
									<td><%=ap.getStatus() %></td>
									<td>
									<%
									if("Pending".equals(ap.getStatus())){%>
										<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-sm btn-success">Comment</a>
									<%}
									else{%>
										<a href="#" class="btn btn-sm btn-success disabled">Comment</a><%
									}
										%>
										</td>
								</tr>
													
												<%
												}
								%>
								<tr>
									
								



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>