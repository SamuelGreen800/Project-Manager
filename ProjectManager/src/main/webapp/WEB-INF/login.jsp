<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

 <div class="container-fluid p-3 vh-100">
        <h1 class="text-center text-dark fw-bold text-decoration-underline">Plese sign in or register.</h1>
        <div class="d-flex justify-content-around mx-auto">
<!--____________________________________________Register__________________________________________-->        
        <form:form action="/register" modelAttribute="newUser" method="post" class="col-4 p-4 bg-light opacity-75 text-dark my-5 rounded border border-dark border-2">
            <h2 class="text-primary m-1 fw-bold opacity-100">Register</h2>
	        	<form:label path="firstName" class="fw-bold">First Name:</form:label>
           	<div class="form-group m-1 fw-bold">
	            <form:errors path="firstName" class="text-danger"/>
	        	<form:input type="text" path="firstName"/>
	       </div>
	       
	       <form:label path="lastName" class="fw-bold">Last Name:</form:label>
           	<div class="form-group m-1 fw-bold">
	            <form:errors path="lastName" class="text-danger"/>
	        	<form:input type="text" path="lastName"/>
	       </div>
	      
	        	
	        	<form:label path="email" class="fw-bold ">Email:</form:label>
            <div class="form-group fw-bold m-1">
	             <form:errors path="email" class="text-danger"/>
	        	<form:input type="email" path="email"/>
	       </div>
	        	<form:label path="password" class=" fw-bold ">Password:</form:label>
	         <div class="form-group fw-bold m-1">    
				<form:errors path="password" class="text-danger"/>
	        	<form:input type="password" path="password"/>
	        	</div>
	        	
	        
	        	<form:label path="confirm" class="fw-bold ">Confirm Password:</form:label>
	        <div class="form-group fw-bold m-1">
	        	<form:errors path="confirm" class="text-danger"/>
	        	<form:input type="password" path="confirm"/>
        	</div>
           
           <div class="form-group fw-bold">
         	  <input type="submit" value="Register" class="btn btn-primary">
          </div>
        	
        </form:form>

        <!--____________________________________Login_______________________________           -->
        <form:form action="/auth" modelAttribute="newLogin" method="post" class="col-4 p-4 bg-light opacity-75 mb-auto text-dark my-5 rounded border border-dark border-2">
            <h2 class="text-success">Login</h2>
			
	        	<form:label path="email" class="fw-bold ">Email</form:label>
			<div class="form-group fw-bold m-1">
	            <form:errors path="email" class="text-danger"/>
	        	<form:input type="text" path="email"/>
            </div>
            
	        	<form:label path="password" class="fw-bold ">Password</form:label>
            <div class="form-group fw-bold m-1">
	            <form:errors path="password" class="text-danger"/>
	        	<form:input type="password" path="password"/>
        	</div>
            
            <input type="submit" value="Login" class="btn btn-success">
        </form:form>
    </div>
    </div>

</body>
</html>