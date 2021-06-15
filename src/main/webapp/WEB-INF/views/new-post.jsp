<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>]
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
      crossorigin="anonymous"
    />
    <meta charset="UTF-8" />
    <title>Sirius Blog | Create Post</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Sirius</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/blog/home">Home</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Posts
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="/blog/new-post">Create Post</a></li>
              </ul>
            </li>
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
      "
    >
      <form:form class="w-50 py-5 row g-3" method="POST" modelAttribute="post" action="new-post">
        <div class="col-md-12">
          <label for="inputTitle" class="form-label">Title</label>
          <form:input path="title" class="form-control" id="inputTitle" />
        </div>
        <div class="col-md-12">
          <label for="inputImageSource" class="form-label">Image Source</label>
          <form:input path="imageSource" class="form-control" id="inputImageSource" />
        </div>
        <div class="col-12">
          <label for="exampleFormControlTextarea1" class="form-label"
            >Content</label
          >
          <form:textarea
            class="form-control"
            id="exampleFormControlTextarea1"
            rows="6"
            path="content"
          ></form:textarea>
        </div>
        <div class="col-md-12">
          <label for="inputAuthor" class="form-label">Author</label>
          <form:input path="author" type="email" class="form-control" id="inputAuthor" />
        </div>
        <div class="col-12">
          <form:button type="submit" class="col-md-12 btn btn-primary">Post</form:button>
        </div>
      </form:form>
    </div>
  </body>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"
  ></script>
</html>
