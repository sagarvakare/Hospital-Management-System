<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDao"%>
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

<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty sucmsg }">
						<p class="text-center text-success fs-3">${sucmsg}</p>
						<c:remove var="sucmsg" scope="session" />
					</c:if>

					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../changePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${docmsg.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
			<div class="card paint-card">
			
			<p class="text-center fs-3">doctor details Update</p>
			
			<c:if test="${not empty sucmsgd }">
						<p class="text-center text-success fs-3">${sucmsgd}</p>
						<c:remove var="sucmsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errmsgd }">
						<p class="text-center text-danger fs-5">${errmsgd}</p>
						<c:remove var="errmsgd" scope="session" />
					</c:if>
			<div class="card-body">
			
			
			<form action="../editprofile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control" value="${docmsg.fullname }">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control" value="${docmsg.dob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control" value="${docmsg.qualification }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="specialist"
									required class="form-control">
									<option>"${docmsg.specialist}"</option>
									<% SpecialistDao dao2=new SpecialistDao(DBconnect.getcon());
									
									List<Specialist> list=dao2.getSpecialist();
									for(Specialist s:list)
									{%>
										<option>
										<%=s.getSpecialistName() %>
										</option>
										
									<%}
									%>

									


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control" readonly="readonly"  value="${docmsg.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control" value="${docmsg.mobno }">
							</div>

							<input type="hidden" value="${docmsg.id}" name="id">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
			
			
			
			</div>
			</div>
			
			</div>
		</div>
	</div>
</body>
</html>