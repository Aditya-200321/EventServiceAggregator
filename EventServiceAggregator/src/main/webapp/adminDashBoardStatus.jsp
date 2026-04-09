<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.model.*, java.util.*" %>
<%@ include file="navbar.jsp" %>

<%
DashBoardModel s = (DashBoardModel)request.getAttribute("status");
List<BookingModel> recent = s.getRecentBookings();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard Statistics</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
    min-height:100vh;
}

.page-title{
    font-weight:700;
    background:#212529;
    color:white;
    padding:12px 20px;
    border-radius:12px;
}


.stat-card{
    border:none;
    border-radius:18px;
    padding:20px;
    color:white;
    transition:.25s;
    box-shadow:0 8px 18px rgba(0,0,0,0.12);
}

.stat-card:hover{
    transform:translateY(-6px);
}

.bg1{ background:linear-gradient(45deg,#007bff,#339cff); }
.bg2{ background:linear-gradient(45deg,#28a745,#5dd174); }
.bg3{ background:linear-gradient(45deg,#ffc107,#ffda63); color:black; }
.bg4{ background:linear-gradient(45deg,#dc3545,#ff6b7d); }

.table-card{
    border-radius:18px;
    overflow:hidden;
    border:none;
}

.table tbody tr:hover{
    background:#f1f5ff;
}

.back-btn{
    padding:8px 22px;
    border-radius:10px;
}

</style>
</head>

<body>

<div class="container mt-4">

<h3 class="text-center page-title mb-4">
Admin Dashboard Statistics
</h3>


<div class="row g-4 mb-4 text-center">

<div class="col-md-3">
<div class="stat-card bg1">
<h6>Total Customers</h6>
<h2><%= s.getTotalCustomers() %></h2>
</div>
</div>

<div class="col-md-3">
<div class="stat-card bg2">
<h6>Total Events</h6>
<h2><%= s.getTotalEvents() %></h2>
</div>
</div>

<div class="col-md-3">
<div class="stat-card bg3">
<h6>Total Bookings</h6>
<h2><%= s.getTotalBookings() %></h2>
</div>
</div>

<div class="col-md-3">
<div class="stat-card bg4">
<h6>Total Revenue</h6>
<h2>₹ <%= s.getTotalRevenue() %></h2>
</div>
</div>

</div>


<div class="card table-card shadow-lg">

<div class="card-header bg-dark text-white">
<h5 class="mb-0">Recent Bookings</h5>
</div>

<div class="table-responsive">

<table class="table table-striped table-hover mb-0">

<thead class="table-dark text-center">
<tr>
<th>ID</th>
<th>Customer</th>
<th>Date</th>
<th>Location</th>
</tr>
</thead>

<tbody>

<%
if(recent != null && !recent.isEmpty()){
    for(BookingModel b : recent){
%>

<tr>
<td class="text-center fw-semibold"><%= b.getBookingId() %></td>
<td><%= b.getCustomerId() %></td>
<td class="text-success"><%= b.getEventDate() %></td>
<td><%= b.getLocation() %></td>
</tr>

<%
    }
}else{
%>

<tr>
<td colspan="4" class="text-center p-4 text-danger">
No Recent Bookings
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
