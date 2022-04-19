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

<div class="col-8 p-5">
<h1>Project: ${project.title}</h1>
<h5>Project Lead: ${project.lead.firstName} ${project.lead.lastName}</h5>

<form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
	<table>
	    <thead>
	        <tr>
	            <td class="float-left">Add a task ticket for this team:</td>
	            <td class="float-left">
	            	<form:errors path="taskName" class="text-danger"/>
					<form:textarea rows="4" class="input" path="taskName"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
<hr>
<c:forEach var="task" items="${tasks}">
	<h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
	<p><c:out value="${task.taskName}"></c:out></p>
</c:forEach>
<h2 class="text-center"><a href="/dashboard" class="btn mt-4 btn-primary">Dashboard</a></h2>
</div>
</body>
</html>