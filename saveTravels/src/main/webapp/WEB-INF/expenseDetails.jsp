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
		<div class="container justify-content-center align-items-center">	
			<div class="card" style="with: 30rem;">
				<div class="card-body">
					<h5 class="card-title">Expense Detail</h5>
					<h6 class="card-subtitle mb-2 text-muted"> Expense Name: <c:out value="${expense.expenseName}"></c:out></h6>
					<p class="card-text"> Expense Vendor: <c:out value="${expense.vendor}"></c:out></p>
					<p class="card-text"> Expense Description: <c:out value="${expense.description}"></c:out></p>
					<p class="card-text"> Expense Amount: <c:out value="${expense.amount}"></c:out></p>
					<a class="card-link" href="/expenses">Go Back</a>
					<a class="card-link" href="/expenses/edit/${expense.id}">Edit</a>
					<a class="card-link" href="/expenses/delete/${expense.id}">Delete</a>
				</div>
			</div>
		</div>
	</body>
</html>