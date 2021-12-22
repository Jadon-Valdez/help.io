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
<body style="background-image: url(https://storage.googleapis.com/subtlepatterns-production/designers/subtlepatterns/uploads/ripples.png)">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #00a6ff;">
		<a href="/home" class="navbar-brand font-weight-bold" style="color: #ff6a00;">Help.io</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a href="/interests/${loggedUser}" class="nav-link">My
						Interests</a></li>
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
		style="background-color: #00a6ff; margin-top: 100px; padding: 50px; border-radius: 10px; border: 1px solid grey;">
		<h1 style="color: #ff5200;">${post.getUser().userName}, is offering
			help!</h1>
		<div class="container"
			style="background-color: white; margin-top: 30px; padding: 30px; border-radius: 10px; width: 990px; box-shadow: 3px 3px 3px 1px gray;">
			<div class="container">
				<p>${post.title}</p>
				<p style="margin-top: 20px;">Location: ${post.area}</p>
				<img src="${post.photo}" class="rounded mx-auto d-block img-fluid mb-3" />
				<c:if test="${loggedUser == post.user.id}">
					<a href="/post/edit/${post.id}">Edit Post</a>
				</c:if>
			</div>
		</div>
		<h2 class="mt-4" style="color: #ff5200;">Comments (${comments.size()}):</h2>
		<form:form action="/comment/${post.id}" method="post"
			modelAttribute="commentNew">
			<form:errors path="*" />
			<div class="form-group"
				style="margin-left: 25px; margin-right: 25px;">
				<label style="color: #ff5200;">Leave a comment:</label>
				<form:input path="body" class="form-control" />
				<form:errors path="body" class="text-danger" />
			</div>
			<input type="submit" value="Comment" style="margin-left: 25px;" />
		</form:form>
		<hr>
		<c:forEach items="${comments}" var="c">
			<div class="container"
				style="background-color: white; margin-top: 30px; padding: 30px; border-radius: 10px; width: 990px; box-shadow: 3px 3px 3px 1px gray;">
				<h4 style="color: #ff5200;">${c.getUser().userName}</h4>
				<p>${c.body}</p>
				<div class="container d-flex align-items-end flex-column">
					<div style="color: gray;">
						<fmt:formatDate value="${c.getCreatedAt()}"
							pattern="E M-dd hh:mm:a z" />
					</div>
					<c:if test="${loggedUser == c.getUser().id}">
						<div>
							<form action="/comment/${c.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete" style="">
								<input class="mt-2 btn-danger" type="submit" value="Delete">
							</form>
						</div>
					</c:if>
					</div>
				</div>
		</c:forEach>
	</div>
</body>
</html>