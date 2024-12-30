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

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Doctor Details</p>
				
						<c:if test="${not empty errmsg}">
							<p class="fs-3 text-center text-danger">${errmsg}</p>
							<c:remove var="errmsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucmsg}">
							<div class="fs-3 text-center text-success" role="alert">${sucmsg}</div>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
				
				
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Qualification</th>
							<th scope="col">Specialist</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">password</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					<%doctorDao dao3=new doctorDao(DBconnect.getcon());
					List<doctor> list1=dao3.getdoctor();
					for(doctor d:list1){
						%>
							<tr>
					
					
					<td><%=d.getFullname() %></td>
					<td><%=d.getDob() %></td>
					<td><%=d.getQualification() %></td>
					<td><%=d.getSpecialist() %></td>
					<td><%=d.getEmail() %></td>
					<td><%=d.getMobno() %></td>
					<td><%=d.getPassword() %></td>
					
					<td>
					
					<a href="editdoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
					<a href="../Deletedoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger"><!-- <i class="fa-solid fa-trash"></i> --> Delete</a>
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