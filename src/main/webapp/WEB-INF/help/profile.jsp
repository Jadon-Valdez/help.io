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
<title>User Profile</title>
</head>
<body style="background-image: url(https://storage.googleapis.com/subtlepatterns-production/designers/subtlepatterns/uploads/ripples.png)">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #eff0eb;">
		<a href="/home" class="navbar-brand font-weight-bold" style="color: #ff5200;">Help.io</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/interests/${loggedUser}" class="nav-link">My
					Interests</a></li>
				<li class="nav-item"><a href="/post/new" class="nav-link">Help
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
		<c:if test="${loggedUser != user.id}">
			<h1 style="color:#ff5200;">${user.userName}'sPosts</h1>
		</c:if>
		<c:if test="${loggedUser == user.id}">
			<h1 style="color: #ff5200;">Your Posts</h1>
		</c:if>
		<hr>
		<c:forEach items="${posts}" var="post">
			<div class="container"
				style="background-color: white; margin-top: 30px; padding: 30px; border-radius: 10px; width: 990px; box-shadow: 3px 3px 3px 1px gray;">
				<div class="container" style="margin: 30px 40px 20px 0px;">
					<a href="/post/${post.id}"
						style="color: inherit; text-decoration: inherit;"><c:out
							value="${post.title}"></c:out></a>
					<p style="margin-top: 20px;">Location: ${post.area}</p>
					<img src="${post.photo}" class="rounded mx-auto d-block img-fluid mb-3" />
					<p>${post.interested_users.size()} interested</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>