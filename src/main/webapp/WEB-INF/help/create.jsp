<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Help Someone</title>
</head>
<body style="background-image: url(https://storage.googleapis.com/subtlepatterns-production/designers/subtlepatterns/uploads/ripples.png)">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#eff0eb;">
		<a href="/home" class="navbar-brand font-weight-bold" style="color: #ff5200;">Help.io</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/new" class="nav-link">Help
						Someone</a></li>
				<li class="nav-item"><a href="/user/${id}" class="nav-link">My
						Profile</a></li>
				<li class="nav-item"><a href="/logout" class="nav-link">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container"
		style="background-color: #eff0eb; margin-top: 100px; padding: 50px; border-radius: 10px; border: 1px solid grey;">
		<h1 style="color: #ff5200;">You are on the way to helping someone!</h1>
		<div class="container"
			style="background-color: white; margin-top: 25px; padding: 30px; border-radius: 10px;">
			<form:form action="/new" method="post" modelAttribute="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>Explain how you are trying to help:</label>
					<form:input path="title" class="form-control" />
					<form:errors path="title" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Where? :</label>
					<form:input path="area" class="form-control" />
					<form:errors path="area" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Photo URL: (optional)</label>
					<form:input path="photo" class="form-control" />
					<form:errors path="photo" class="text-danger" />
				</div>
				<input type="submit" value="Submit" />
			</form:form>
		</div>
	</div>
</body>
</html>