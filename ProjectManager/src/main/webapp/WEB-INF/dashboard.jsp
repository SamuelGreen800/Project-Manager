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
<title>Dashboard</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<body class="p-4">

	<div class="container col-12 text-center">
		<h1>Project Manager Dashboard</h1>
		<h2>Welcome, ${user.firstName}!</h2>
	</div>


	<div class="container">
		<div class="d-flex justify-content-between">
			<h4>Ongoing Projects:</h4>
			<p><a href="/projects/new" class="btn btn-primary ">Add Project</a></p>
		</div>



		<table class="table table-bordered table-striped table-hover">
		    <thead> 
		    	<tr class="table-info">
		    		<th>Project</th>
		    		<th class="col-3">Team Lead</th>
		    		<th class="col-3">Due Date</th>
		    		<th class="col-2">Actions</th>
		    	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="project" items="${unassignedProjects}">
				<tr>
					<c:if test = "${project.lead.id!=user.id}">
					<td><a href="/projects/${project.id}">${project.title}</a></td>
					<td><c:out value="${project.lead.firstName}"></c:out></td>
					<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
				    <td><a href="/dashboard/join/${project.id}">Join Team</a></td>
				    </c:if>
				</tr>	
				</c:forEach>
		    </tbody>
		</table>
		
		<hr>
		<h4 class="my-3">Your Projects</h4>
		<table class="table table-bordered table-hover table-striped">
		    <thead> 
		    	<tr class="table-info">
		    		<th>Project</th>
		    		<th class="col-3">Team Lead</th>
		    		<th class="col-3">Due Date</th>
		    		<th class="col-2">Actions</th>
		    	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="project" items="${assignedProjects}">
				<tr>
					<td><a href="/projects/${project.id}">${project.title}</a></td>
					<td><c:out value="${project.lead.firstName}"></c:out></td>
					<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
					<c:if test = "${project.lead.id==user.id}">
				       <td><a href="/projects/edit/${project.id}">Edit Project</a></td>
				    </c:if>
				    <c:if test = "${project.lead.id!=user.id}">
				       <td><a href="/dashboard/leave/${project.id}">Leave Team</a></td>
				    </c:if>
				</tr>	
			</c:forEach>
		    </tbody>
		</table>
		
		<p class="text-center my-4"><a href="/logout" class="btn btn-danger">Log Out</a></p>
	</div>
</body>
</html>
