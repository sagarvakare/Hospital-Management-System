<%@page import="com.entity.doctor"%>
<%@page import="com.dao.doctorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dbconnect.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="../component/allcss.jsp" %>

<style type="text/css">
.paint-card{

box-shadow: 0px 0px 10px 0 rgba(0,0,0, 0.3 );
}
.btn-sm{
padding: 4px;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@include file="../component/nav.jsp"%>



<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						<c:if test="${not empty errmsg}">
							<p class="fs-3 text-center text-danger">${errmsg}</p>
							<c:remove var="errmsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucmsg}">
							<div class="fs-3 text-center text-success" role="alert">${sucmsg}</div>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						doctorDao dao=new doctorDao(DBconnect.getcon());
						doctor d=dao.getdoctorByid(id);
						
						%>
						<form action="../update" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname"  class="form-control"  value="<%=d.getFullname()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"  value="<%=d.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"  value="<%=d.getQualification()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="specialist"
									required class="form-control"  >
									<option><%=d.getSpecialist()%></option>
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
									required name="email" class="form-control" value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control" value="<%=d.getMobno()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control"  value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=d.getId()%>">

							<button type="submit" class="btn btn-primary  col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		
					
	</div>
					</div>
</body>
</html>