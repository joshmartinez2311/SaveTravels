<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Save Travels Home Page</title>
</head>
<body>
 	<div class="container">
 		<h1>Save Travels</h1>
 		<table class="table table-hover" >
 			<thead>
 				<tr>
 					<th>Expense</th>
 					<th>Vendor</th>
 					<th>Amount</th>
 					<th>Action</th>
 				</tr>
 			</thead>
 			<tbody>
 				<c:forEach var="expense" items="${expenses}">
 					<tr>
 						<td><a href="/expenses/<c:out value="${expense.id}"></c:out>"><c:out value="${expense.expenseName}"></c:out></a></td>
 						<td><c:out value="${expense.vendor}"></c:out></td>
 						<td>$<c:out value="${expense.amount}"></c:out></td>
 						<td><a href="/expenses/edit/${expense.id}">Edit</a> | <a href="/expenses/delete/${expense.id}">Delete</a></td>
     				</tr>
 				</c:forEach>
 			</tbody>
 		</table>
 		
 		<div class="container">
 			<h1>Add an Expense</h1>
 			<form:form action="/expenses" method="post" modelAttribute="expense">
 				<div class="form-group">
 					<form:label path="expenseName">Expense Name:</form:label>
 					<form:errors path="expenseName" class="text-danger"/>
 					<form:input path="expenseName" class="form-control"/>
 				</div>
 				<div class="form-group">
 					<form:label path="vendor">Vendor Name:</form:label>
 					<form:errors path="vendor" class="text-danger"/>
 					<form:input path="vendor" class="form-control"/>
 				</div>
 				<div class="form-group">
 					<form:label path="amount">Amount:</form:label>
 					<form:errors path="amount" class="text-danger"/>
 					<form:input path="amount" class="form-control"/>
 				</div>
 				<div class="form-group">
 					<form:label path="description">description:</form:label>
 					<form:errors path="description" class="text-danger"/>
 					<form:textarea path="description" rows="5" class="form-control"/>
 				</div>
 				<div>
 					<input class="btn btn-primary mt-5" type="submit"/>
 				</div>
 			</form:form>
 		</div>
	</div>
</body>
</html> 	
	
	
	
	
	
	
	
	
	
	
	
