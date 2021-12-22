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
<body style=" background-color:  #eff0eb;">
	<nav class="navbar navbar-light" style="background-color: #eff0eb;">
		<a href="/" class="navbar-brand" style="color: #ff5200;">Help.io</a>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item ml-auto"><a href="/home"
				style="color: #ff5200">Continue as guest</a></li>
		</ul>
	</nav>
	<div
		style="background-image: url(https://newevolutiondesigns.com/images/freebies/city-wallpaper-9.jpg); lightgray; padding: 100px;">
		<div class="container"
			style="margin-top: 0px; padding: 50px; border-radius: 10px; background-color: #eff0eb;">
			<div class="row" style="color: #ff5200">
				<div style="margin-right: 270px; width: 300px;">
					<h1 class="font-weight-bold" style="color: #ff5200">Help.io</h1>
					<p class="text-wrap">Help.io is a place to help and connect
						others.</p>
					<br>
					<p>Let your community know about any events or host your own!</p>
					<br>
					<p>Join now to get started!</p>
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
	</div>
	<div style="background-color: #eff0eb; height: 400px;"
		class="d-flex align-content-center flex-wrap row">
		<div class="container text-wrap align-middle column">
			<h1 class="column"> Get the most out out of unused belongings.</h1>
			<p class="column">A place for your community to come together and help your
				neighbors. Let others know about a company offering free plates to
				those in need. Give away unused winter wear. Or even host your own event gathering cans of food
				and offering them to others.</p>
		</div>
	</div>
	<div class="container" style="background-color:  #eff0eb; height: 250px;">
		<div class="row justify-content-center">
			<div class="col-3">
				<h1>Questions?</h1>
				<p>Just comment on another users post by clicking on the body of the text!</p>
			</div>
			<div class="col-3">
				<h1>Interested?</h1>
				<p>Click the bright orange "I'm interested" button on any post.</p>
			</div>
			<div class="col-3">
				<h1>Helpful?</h1>
				<p>If you find a user helpful you can see other posts they have made by clicking on their name.</p>
			</div>
		</div>
	</div>
</body>
</html>