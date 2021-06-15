<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous" />
<spring:url value="/resources/css/post.css" var="index"></spring:url>
<link rel="stylesheet" type="text/css" href="${index}" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<meta charset="UTF-8" />
<title>Sirius Blog | Post</title>
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
	<div
		class="
        container-fluid
        d-flex
        justify-content-center
        align-items-center
        flex-column
        py-5
      ">
		<div class="container pb50">
			<div class="row">
				<div class="col-md-9 mb40">
					<article>
						<img src="<c:url value="${post.imageSource}"/>" alt="image source"
							class="img-fluid mb30" />
						<div class="post-content">
							<h3>${post.title}</h3>
							<ul class="post-meta list-inline">
								<li class="list-inline-item"><i class="fa fa-user-circle-o"></i>
									<a href="#">${post.author }</a></li>
							</ul>
							<p>${post.content}</p>
							<hr class="mb40" />
							<h4 class="mb40 text-uppercase font500">Comments</h4>
							<c:forEach var="comment" items="${comments}">
								<div class="media mb40">
									<i class="d-flex mr-3 fa fa-user-circle-o fa-3x"></i>
									<div class="media-body">
										<h5 class="mt-0 font400 clearfix">${comment.name}</h5>
										${comment.content}
										<a href="delete/${id}?commentId=${comment.id}">Deletar</a>
										<a href="edit-comment/${comment.id}">Editar</a>
									</div>
									<a></a>
								</div>
							</c:forEach>
							<h4 class="mb40 text-uppercase font500">Post a comment</h4>
							<form:form method="POST" role="form" modelAttribute="comment" action="${id}">
								<div class="form-group">
									<label>Name</label> <form:input path="name" type="text" class="form-control"
										placeholder="John Doe" />
								</div>
								<div class="form-group">
									<label>Comment</label>
									<form:textarea path="content" class="form-control" rows="5" placeholder="Comment"></form:textarea>
								</div>
								<div class="clearfix float-right">
									<form:button type="submit" class="btn btn-primary btn-lg">
										Submit</form:button>
								</div>
							</form:form>
						</div>
					</article>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</html>
