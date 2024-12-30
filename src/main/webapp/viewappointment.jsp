
<%@page import="com.entity.doctor"%>
<%@page import="com.dao.doctorDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hosp4.jpeg");
	height: 40vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.img1{

height: 110%;
width: 100%;
}
</style>
</head>
<body>
	<c:if test="${empty usermsg }">
		<c:redirect url="user.jsp"></c:redirect>
	</c:if>
	<%@include file="component/nav.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>
							</thead>
							<tbody>
							<% User user=(User)session.getAttribute("usermsg");
							AppointmentDao dao=new AppointmentDao(DBconnect.getcon());
							doctorDao dao2=new doctorDao(DBconnect.getcon());
							List<Appointment> list=dao.GetallappointmentById(user.getId());
							
							for(Appointment ap:list){
								doctor d=dao2.getdoctorByid(ap.getDoctorId());
							
							%>
								
									<tr>
								<th><%=ap.getFullname() %></th>
								
							    <td><%=ap.getGender() %></td>
								<td><%=ap.getAge() %></td>
								<td><%=ap.getAppointDate() %></td>
								<td><%=ap.getDiesease() %></td>
								
								<td><%=d.getFullname() %></td>
								<td><%
										if("pending".equals(ap.getStatus())){%>
										
										<a href="#" class="btn btn-sm btn-success">pending</a>
											<%
											
										}else{%>
											<%=ap.getStatus() %>
										<%
										}
											
										%>	
					</td>	
							</tr>	
							
						<%
							}
							
							%>
								
															


							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">
				<img alt="" class="img1" src="img/doc3.jpg">
			</div>
		</div>
	</div>


</body>
</html>