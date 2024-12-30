<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="component/allcss.jsp" %>
<meta charset="ISO-8859-1">
<title>User</title>

<style type="text/css">
.paint-card{
box-shadow: 0px 0px 10px 0 rgba(0,0,0, 0.3 );
}
</style>
</head>
<body>
<%@include file="component/nav.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
							
							<c:if test="${not empty sucmsg}">
						<p class="text-center text-success fs-4">${sucmsg}</p>
						<c:remove var="sucmsg" scope="session"/>
						
						</c:if>
						
							<c:if test="${not empty errmsg}">
						<p class="text-center text-danger fs-4">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
						
						</c:if>
						<form action="userlogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label><input
									required="required" name="email" type="email"
									class="form-control">

							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input
									required="required" name="password" type="password"
									class="form-control">
 
							</div>
							<button type="submit" class="btn bg-success text-white  col-md-12">Login</button>
							
						</form>
						<br>dont have an account?<a href="signup.jsp" class="clink  text-decoration-none">Click here</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>