<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Help.io</title>
</head>
<body
	style="background-image: url(https://storage.googleapis.com/subtlepatterns-production/designers/subtlepatterns/uploads/ripples.png)">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #eff0eb;">
		<a href="/home" class="navbar-brand font-weight-bold"
			style="color: #ff5200;">Help.io</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<form th:action="@{/home}" style="margin-right: 200px;">
						<div class="input-group mb-1">
							<input type="text" name="keyword" id="keyword" size="50"
								th:value="${keyword}" placeholder="Search posts, then hit enter"
								class="form-control" required /> &nbsp;
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">
									<a href="/home">Clear</a>
								</button>
							</div>
						</div>
					</form>
				</li>
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
		style="background-color: #eff0eb; margin-top: 100px; padding: 50px; border-radius: 10px;">
		<h1 style="color: #ff5200;">Hello, ${name}</h1>
		<hr>
		<c:forEach items="${posts}" var="post">
			<div class="container"
				style="background-color: white; margin-top: 30px; padding: 30px; border-radius: 10px; width: 990px; box-shadow: 5px 10px 30px 10px black;">
				<div class="d-flex">
					<h3>
						<a href="/user/${post.user.id}" style="color: #ff5200"><c:out
								value="${post.getUser().userName}"></c:out> </a>
					</h3>
					<div class="ml-auto p-2">
						<p style="color: gray;">
							Posted:
							<fmt:formatDate value="${post.getCreatedAt()}" pattern="E M-dd" />
						</p>
					</div>
				</div>
				<div class="container" style="margin: 5px 20px 20px 0px;">
					<a href="/post/${post.id}"
						style="color: inherit; text-decoration: inherit;"><c:out
							value="${post.title}"></c:out></a>
					<p style="margin-top: 20px;">Location: ${post.area}</p>
					<img src="${post.photo}"
						class="rounded mx-auto h-25 d-block img-fluid"
						style="max-width: 80%; max-height: 60%;" />
					<hr>
					<p class="mt-2">${post.interested_users.size()} interested</p>
					<c:if test="${post.interested_users.contains(thisUser) == false}">
						<form method="get" action="/post/${post.id}/interested">
							<button type="submit"
								style="border: 0px; background-color: #ff5200; border-radius: 5px;">I'm
								Interested</button>
						</form>
					</c:if>
				</div>
				<div class="container col bg-light"
					style="background-color: white; margin-top: 30px; padding: 20px; border-radius: 10px; width: 990px; border: 1px solid black;">
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
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>