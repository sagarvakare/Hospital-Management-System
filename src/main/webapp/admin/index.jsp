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
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card{
box-shadow: 0px 0px 10px 0 rgba(0,0,0, 0.3 );
}
</style>
</head>
<body>


<%@include file="../admin/navbar.jsp" %>
<c:if test="${empty getmsg }">
<c:redirect url="../admin.jsp"></c:redirect>
</c:if>



<div class="container p-5">
	<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty errmsg}">
			<p class="fs-3 text-center text-danger">${errmsg}</p>
			<c:remove var="errmsg" scope="session" />
		</c:if>
		<c:if test="${not empty sucmsg}">
			<div class="fs-3 text-center text-success">${sucmsg}</div>
			<c:remove var="sucmsg" scope="session" />
		</c:if>
		
		<%doctorDao dao=new doctorDao(DBconnect.getcon()); %>
		<div class="row">
			<div class="col-md-4 ">
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
						<i class="fas fa-user fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%=dao.countUser() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countappointment() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 mt-2">
				<div class="card paint-card"  data-bs-toggle="modal"
		data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=dao.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>
			</div>
			</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		data-bs-toggle="modal" data-bs-target="exampleModal aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
				<form action="../addspecialist" method="post">
				<div class="form-group">
				<label>Enter Specialist </label>
				<input type="text" name="specName"  class="form-control">
				</div>
				<div class="text-center mt-2">
				<button type="submit" class="btn btn-primary">ADD</button>
				</div>
				
				</form>
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>

	
	
</body>
</html>