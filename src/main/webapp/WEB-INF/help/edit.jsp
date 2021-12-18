<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Editing Post</title>
</head>
<body>
	<c:if test="${verifPost != loggedUser}">
		<h1>You've gotten here by accident and do not have permission to
			view this page!</h1>
		<a href="/home">Go home</a>
	</c:if>
	<c:if test="${verifPost == loggedUser}">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a href="/home" class="navbar-brand" style="color: #ff5200;">Help.io</a>
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
		<div class="container" class="container"
			style="background-color: #ff5200; margin-top: 100px; padding: 50px; border-radius: 10px;">
			<h1 style="color: white;">Edit Your Post</h1>
			<div class="container"
				style="background-color: white; margin-top: 25px; padding: 30px; border-radius: 10px;">
				<form:form action="/post/${post.id}" method="post"
					modelAttribute="post">
					<input type="hidden" name="_method" value="put">
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
					<input type="submit" value="Submit" />
				</form:form>
			</div>
			<div class="row" style="margin-left: 0px; margin-top: 30px;">
				<form action="/post/${post.id}" method="post">
					<input type="hidden" name="_method" value="delete" style="">
					<input class= "btn-danger" type="submit" value="Delete">
				</form>
			</div>
		</div>
	</c:if>
</body>
</html>