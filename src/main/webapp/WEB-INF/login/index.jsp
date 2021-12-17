<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Welcome to Help.io</title>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<a href="/" class="navbar-brand" style="color: #ff5200;">Help.io</a>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item ml-auto">
				<a href="/home" style="color: #ff5200">Continue as guest</a>
			</li>
		</ul>
	</nav>
		<div class="container"
		style="margin-top: 100px; padding: 50px; border-radius: 10px; border: 1px solid black;">
		<div class="row" style="color: #ff5200">
		<div style="margin-right: 300px;">
			<h1 style="color: #ff5200">Help.io</h1>
			<p>Help.io is a place to help others</p>
			<p>in need by informing others of events</p>
			<p>going on or offering help.</p>
		</div>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<h3>Register</h3>
				<div class="form-group">
					<label>User Name:</label>
					<form:input path="userName" class="form-control" />
					<form:errors path="userName" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Confirm Password:</label>
					<form:password path="confirm" class="form-control" />
					<form:errors path="confirm" class="text-danger" />
				</div>
				<input type="submit" value="Register" class="btn btn-primary" />
			</form:form>
			<div class="row-1" style="margin-left: 80px;">
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<h3>Login</h3>
					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:password path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<input type="submit" value="Login" class="btn btn-success" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>