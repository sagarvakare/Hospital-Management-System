<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class= "fa-solid fa-house-medical"></i>MEDI HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"></i>HOME</a>
        </li>
         
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="patient.jsp">PATIENT</a>
		</ul>
					<form class="d-flex">
						<div class="dropdown ">
							<button class="btn btn-light dropdown-toggle " type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false"> <i class="fas fa-user fa-1x"></i> ${docmsg.fullname}</button>
							<ul class="dropdown-menu ms-auto" aria-labelledby="dropdownMenuButton1">
							 <li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
								<li><a class="dropdown-item" href="../doctorlogout">Logout</a></li>
								
							</ul>
						</div>
						</form>
						
      
    </div>
  </div>
</nav>
</body>
</html>