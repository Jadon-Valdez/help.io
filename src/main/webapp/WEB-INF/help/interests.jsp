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
<title>Interests</title>
</head>
<body style="background-image: url(https://storage.googleapis.com/subtlepatterns-production/designers/subtlepatterns/uploads/ripples.png)">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #00a6ff;">
		<a href="/home" class="navbar-brand" style="color: #ff5200;">Help.io</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/interests/${thisUser.id}"
					class="nav-link">My Interests</a></li>
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
		style="background-color: #00a6ff; margin-top: 100px; padding: 50px; border-radius: 10px;">
		<h1 style="color:  #ff5200;">Things I'm Interested In</h1>
		<c:forEach items="${interests}" var="i">
			<div class="container"
				style="background-color: white; margin-top: 30px; padding: 30px; border-radius: 10px; width: 990px; box-shadow: 5px 10px 30px 10px gray;">
				<h3>${i.user.userName}</h3>
				<p>${i.title}</p>
				<p>Location: ${i.area}</p>
				<img src="${i.photo}" class="rounded mx-auto d-block img-fluid mb-3" />
				<form method="get" action="/post/${i.id}/notinterested">
					<button type="submit" style="border: 0px; background-color: red; border-radius: 5px;">Can't make it</button>
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>