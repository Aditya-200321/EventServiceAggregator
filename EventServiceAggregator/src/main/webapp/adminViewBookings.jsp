<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.model.BookingModel" %>
<%@ include file="navbar.jsp" %>

<%
List<BookingModel> bookings =
    (List<BookingModel>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Bookings</title>

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

.back-btn{
    border-radius:10px;
    padding:8px 22px;
}

</style>

</head>

<body>

<div class="container mt-4">

<div class="page-header shadow mb-4 text-center">
    All Customer Bookings
</div>

<div class="card table-card shadow-lg">

<div class="table-responsive">

<table class="table table-striped table-hover align-middle mb-0">

<thead class="table-dark text-center">
<tr>
    <th>ID</th>
    <th>Customer</th>
    <th>Event</th>
    <th>Date</th>
    <th>Location</th>
</tr>
</thead>

<tbody>

<%
if(bookings != null && !bookings.isEmpty()){
    for(BookingModel b : bookings){
%>

<tr>
    <td class="text-center fw-semibold"><%= b.getBookingId() %></td>

    <td><%= b.getCustomerName() %></td>

    <td class="fw-semibold text-primary">
        <%= b.getEventName() %>
    </td>

    <td class="text-success">
        <%= b.getEventDate() %>
    </td>

    <td><%= b.getLocation() %></td>
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="5" class="text-center text-danger py-4">
        No Bookings Found
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
    <a href="adminDashboard.jsp"
       class="btn btn-dark back-btn shadow">
        Back to Dashboard
    </a>
</div>

</div>
</body>
</html>
