
<%@page import="com.entity.doctor"%>
<%@page import="com.dao.doctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
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
	


	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
					

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
									
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							
							<tbody>
								<%AppointmentDao dao=new AppointmentDao(DBconnect.getcon());
								doctorDao dao2=new doctorDao(DBconnect.getcon());
						List<Appointment> list= dao.GetallappointmentId();
						
						for(Appointment ap:list){
						doctor d=dao2.getdoctorByid(ap.getDoctorId());
						%>
				
							<tr>
							<th><%=ap.getFullname() %></th>
							<td><%=ap.getGender() %></td>
							<td><%=ap.getAge() %></td>
							<td><%=ap.getAppointDate() %></td>
							<td><%=ap.getEmail() %></td>
							<td><%=ap.getPhno() %></td>
							<td><%=ap.getDiesease() %></td>
							<td><%=d.getFullname() %></td>
							<td><%=ap.getAddress() %></td>
							
							
							
							<td><%=ap.getStatus() %>
							</td>
							</tr>	
						<%}
						
						%>
							
													
									
								
									
								



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>