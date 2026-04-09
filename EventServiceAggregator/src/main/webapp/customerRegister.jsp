<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
      rel="stylesheet">

<style>
    body {
        background: #f4f6f9;
    }

    .navbar-brand {
        font-weight: bold;
        letter-spacing: 1px;
    }

    .card {
        border-radius: 14px;
    }

    footer {
        background: #212529;
        color: white;
        padding: 15px 0;
        margin-top: 60px;
    }
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand" href="#">Event Management</a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminLogin.jsp">Admin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card shadow">
                <div class="card-header bg-success text-white text-center">
                    <h4>Customer Registration</h4>
                </div>
                <%
String msg = (String) request.getAttribute("msg");
String type = (String) request.getAttribute("msgType");

if(msg != null){
%>

<div class="alert alert-<%= type %> text-center">
    <%= msg %>
</div>

<% } %>
                

                <div class="card-body">
                    <form action="CustomerRegisterController" method="post">

                        <div class="mb-3">
                            <label>CustomerName</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>PhoneNumber</label>
                            <input type="phonenumber" name="phonenumber" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>Address</label>
                            <input type="address" name="address" class="form-control" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">
                                Register
                            </button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
</div>


<footer class="text-center">
    <div class="container">
        <small>
            © 2026 Event Management System |
            Designed for Academic Project |
            All Rights Reserved
        </small>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
