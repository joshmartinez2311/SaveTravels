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
<title>Save Travels Edit an Expense</title>
</head>
	<body>
		<div class="container">
			<div class="container  justify-content-center align-items-center">
	 			<h1>Edit This Expense</h1><a href="/expenses">Go Back</a>
	 			<form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense">
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