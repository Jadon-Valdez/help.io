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
<title>Post</title>
</head>
<body>
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
	<div class="container"
		style="background-color: #ff5200; margin-top: 100px; padding: 50px; border-radius: 10px;">
		<h1 style="color: white;">${post.getUser().userName} is offering help!</h1>
		<div class="container"
		style="background-color: #ff5200; margin-top: 100px; padding: 50px; border-radius: 10px;">
			<div class="container" style="background-color: white; margin: 0px 40px 0px 40px; padding: 30px; border-radius: 10px; width: auto; border: 1px solid green;">
				<div class="container">
					<p>${post.title}</p>
					<p style="margin-top: 20px;">Location: ${post.area}</p>
				</div>
			</div>
		</div>
		<c:if test="${loggedUser == post.user.id}">
			<a href="/post/edit/${post.id}">Edit Post</a>
		</c:if>
	</div>
	
</body>
</html>