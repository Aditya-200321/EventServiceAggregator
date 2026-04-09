<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.model.CustomerModel" %>
<%@ include file="navbar.jsp" %>

<%
List<CustomerModel> customers =
(List<CustomerModel>) request.getAttribute("customers");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Customers</title>

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
    All Customers
</div>

<div class="card table-card shadow p-3">

<div class="table-responsive">

<table class="table table-bordered align-middle mb-0">

<thead class="table-dark text-center">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Address</th>
</tr>
</thead>

<tbody>

<%
if(customers != null && !customers.isEmpty()){
    for(CustomerModel c : customers){
%>

<tr>
    <td class="text-center"><%=c.getCustomerId()%></td>
    <td><%=c.getCustomerName()%></td>
    <td><%=c.getEmail()%></td>
    <td class="text-center"><%=c.getPhone()%></td>
    <td><%=c.getAddress()%></td>
</tr>

<%
}}
else{
%>

<tr>
<td colspan="5" class="text-center text-danger fw-semibold">
No Customers Found
</td>
</tr>

<%
}
%>

</tbody>
</table>

</div>
</div>

<div class="text-center mt-4">
<a href="adminDashboard.jsp" class="btn btn-dark px-4">
Back to Dashboard
</a>
</div>

</div>

</body>
</html>
