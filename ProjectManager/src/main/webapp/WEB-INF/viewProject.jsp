<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>

</head>
<body>






	<div class="p-4 px-5">

	
		<div class="p-4 bg-light col-9">
			<div class="card card-body">	
				<h1 class="mb-5">Project Details:</h1>
			
					<div class="d-flex col-6 my-4 justify-content-between">
						<div class=" fw-bold col-2">Project:</div>
						<div class="col-7"><c:out value="${project.title}"></c:out></div>
					</div>
					
					<div class="d-flex col-6 my-4 justify-content-between">
						<div class="fw-bold col-2">Description:</div>
						<div class="col-7"><c:out value="${project.description}"></c:out></div>
					</div>
					
					<div class="d-flex col-6 my-4 justify-content-between">
						<div class="fw-bold col-2">Due Date:</div>
						<div class="col-7"><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd" /></div>
					</div>
					<div class="d-flex col-6 my-4 justify-content-between">
						<div class=" fw-bold col-2">Lead:</div>
						<div class="col-7"><c:out value="${project.lead.firstName} ${project.lead.lastName}"></c:out></div>
					</div>
			</div>
					
					<div>
					<c:forEach var="task" items="${tasks}">
					<h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
					<p><c:out value="${task.taskName}"></c:out></p>
						</c:forEach>
						
					</div>
				
		<div class="d-flex justify-content-between my-4 col-6">
			<h5 class="">
				<a class="btn btn-info" href="/projects/${project.id}/tasks">Add Tasks</a>
			</h5>
			<div class="">
			<a class="btn btn-primary" href="/dashboard">Dashboard</a>
	</div>
		<c:if test="${project.lead.id==userId}">
			<h4 class="text-center">
				<a class="btn btn-danger text-dark" href="/projects/delete/${project.id}">Delete Project</a>
			</h4>
		</c:if>
		</div>
		</div>
		
			
		
	
	
	
	
	
	</div>

</body>
</html>