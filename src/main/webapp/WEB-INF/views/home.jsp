<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<meta charset="UTF-8" />
<title>Sirius Blog | Posts</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Sirius</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/blog/home">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Posts </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/blog/new-post">Create
									Post</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="cursor: pointer;"
		class="
        container-fluid
        d-flex
        justify-content-center
        align-items-center
        flex-column
        py-5
      ">
		<c:forEach var="post" items="${posts}">
			<div onclick="(window.location='/blog/post/${post.id}')"
				class="card w-25 m-4" z>
				<img class="card-img-top img-fluid"
					src="<c:url value="${post.imageSource}"/>" alt="Card image cap" />
				<div class="card-body">
					<h5 class="card-title font-weight-bold">${post.title}</h5>
					<p class="card-text">${post.content}</p>
					<p class="card-text">
						<small class="text-muted">postado por ${post.author}</small>
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</html>
