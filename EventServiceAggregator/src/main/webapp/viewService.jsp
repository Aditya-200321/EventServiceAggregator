<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.model.ServiceModel, com.dao.ServiceDAO" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Services</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
    min-height:100vh;
}

.page-header{
    background:#212529;
    color:white;
    padding:12px 20px;
    border-radius:12px;
    font-weight:600;
}

.table-card{
    border:none;
    border-radius:18px;
    overflow:hidden;
}

.table tbody tr:hover{
    background:#f1f5ff;
    transition:.2s;
}

</style>

</head>

<body>

<div class="container mt-4">

<div class="page-header shadow mb-4 text-center">
    Available Services
</div>

<div class="card table-card shadow-lg">

<div class="table-responsive">

<table class="table table-striped table-hover align-middle mb-0">

    <thead class="table-dark text-center">
        <tr>
            <th>ID</th>
            <th>Service Name</th>
            <th>Description</th>
            <th>Price</th>
            <th colspan="2">Action</th>
        </tr>
    </thead>

    <tbody>

    <%
        ServiceDAO ed = new ServiceDAO();
        List<ServiceModel> services = ed.getAllServices();

        for(ServiceModel s : services){
    %>

        <tr>
            <td class="text-center"><%= s.getServiceId() %></td>

            <td class="fw-semibold"><%= s.getServiceName() %></td>

            <td><%= s.getDescription() %></td>

            <td class="text-success fw-bold">
                ₹ <%= s.getPrice() %>
            </td>

            <td class="text-center">
                <a href="UpdateServiceController?service_id=<%= s.getServiceId() %>"
                   class="btn btn-warning btn-sm px-3">
                    Edit
                </a>
            </td>

            <td class="text-center">
                <a href="DeleteServiceController?service_id=<%= s.getServiceId() %>"
                   class="btn btn-danger btn-sm px-3">
                    Delete
                </a>
            </td>
        </tr>

    <%
        }
    %>

    </tbody>

</table>

</div>
</div>

</div>

</body>
</html>
