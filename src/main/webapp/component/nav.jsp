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
    
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class= "fa-solid fa-house-medical"></i>MEDI HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      <c:if test="${ empty usermsg}">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin.jsp"><i class="fa-solid fa-right-to-bracket"></i>ADMIN</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor.jsp">DOCTOR</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment1.jsp">APPOINTMENT</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user.jsp">USER</a>
        </li>
        </c:if>
       
       <c:if test="${not empty usermsg }">
       
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment1.jsp">APPOINTMENT</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="viewappointment.jsp">VIEW APPOINTMENT</a>
        </li>
       
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fas fa-user fa-1x"></i> ${ usermsg.name}
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="changepassword.jsp">Change Password</a></li>
            <li><a class="dropdown-item" href="userlogout">Logout</a></li>
            
          </ul>
        </li>
        </c:if>
      </ul>
    
    </div>
  </div>
</nav>

 
</body>
</html>