<%@page import="com.entity.doctor"%>
<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.dao.doctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.paint-card{
box-shadow: 0px 0px 10px 0 rgba(0,0,0, 0.3 );
}
</style>
<%@include file="../component/allcss.jsp" %>
</head>
<body>


<%@include file="navbar.jsp" %>


<c:if test="${ empty docmsg}">
<c:redirect url="../doctor.jsp">

</c:redirect>

</c:if>
<p class="text-center fs-4">Admin Dashboard</p>
<%doctorDao dao=new doctorDao(DBconnect.getcon());
doctor d=(doctor)session.getAttribute("docmsg");
%>
<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=dao.countdoctor() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countappointmentdoctorByid(d.getId()) %>
						</p>
					</div>
				</div>
			</div>
			</div>
</body>
</html>