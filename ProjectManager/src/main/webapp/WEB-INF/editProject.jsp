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

<div class="px-5 pb-3">

		<div class=" col-7">

			<h1 class="py-4">Edit your Project:</h1>
			
			<form:form action="/projects/edit/${project.id}" method="post" class="form form-control p-4" modelAttribute="project">
				 <input type="hidden" name="_method" value="post">
				 <form:hidden path="id"/>
							<div class="form-group fw-bold d-flex justify-content-between my-5">
				            	<form:label path="title">Project Title:</form:label>
				            	<form:errors path="title" class="text-danger"/>
								<form:input class="input col-7" value="${project.title}" path="title"/>
				            </div>
				            
				       		<div class="form-group d-flex fw-bold justify-content-between my-5">
				       			<form:label path="description">Description:</form:label>
				            	<form:errors path="description" class="text-danger"/>
								<form:textarea rows="4"  class="input col-7" value="${project.description}" path="description"/>
				           </div>
				        
				        	<div class="form-group d-flex fw-bold justify-content-between my-5">
				   				<form:label path="dueDate"> Due date:</form:label>
				            	<form:errors path="dueDate" class="text-danger"/>
								<form:input path="dueDate" value="${project.dueDate}" class="h4" type="date"/>
				            </div>
				       
				        	
						<div class="d-flex mt-5 justify-content-between">
						<h5 class="">
							<input class="btn btn-success" type="submit" value="Update"/>
						</h5>
					<c:if test="${project.lead.id==userId}">
						<h4 class="text-center">
							<a class="btn btn-danger text-dark" href="/projects/delete/${project.id}">Delete Project</a>
						</h4>
					</c:if>
					</div>
			
			</form:form>
			
			<h2 class="text-center"><a href="/dashboard" class="btn mt-4 btn-primary">Dashboard</a></h2>
		</div>
	</div>



</body>
</html>