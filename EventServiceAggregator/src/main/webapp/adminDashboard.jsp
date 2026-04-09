<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
HttpSession sessionCheck = request.getSession(false);
if(sessionCheck == null || sessionCheck.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
    min-height:100vh;
    font-family: system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
}

.top-strip{
    background: linear-gradient(90deg,#1f2937,#111827);
    color:white;
    padding:18px 24px;
    border-radius:14px;
    box-shadow:0 10px 22px rgba(0,0,0,.12);
}

.dashboard-card{
    border:none;
    border-radius:20px;
    transition:all .25s ease;
    background:white;
}

.dashboard-card:hover{
    transform:translateY(-10px);
    box-shadow:0 18px 35px rgba(0,0,0,0.18);
}

.section-title{
    font-weight:700;
    letter-spacing:.4px;
    margin-bottom:6px;
}

.btn{
    border-radius:10px;
    font-weight:600;
}

.card-icon{
    font-size:32px;
    margin-bottom:10px;
    opacity:.8;
}

</style>
</head>

<body>

<div class="container mt-4">
   
</div>


<div class="container mt-4">

<div class="row g-4">

<div class="col-lg-3 col-md-6">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">🎉</div>
<h5 class="section-title">Events</h5>
<p class="text-muted small">Manage events</p>

<div class="d-grid gap-2">
<a href="addEvent.jsp" class="btn btn-success btn-sm">Add</a>
<a href="viewEvent.jsp" class="btn btn-primary btn-sm">View</a>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">👥</div>
<h5 class="section-title">Customers</h5>
<p class="text-muted small">Manage users</p>

<div class="d-grid gap-2">
<a href="<%=request.getContextPath()%>/AdminViewCustomersController"
   class="btn btn-primary btn-sm">View</a>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">🛠️</div>
<h5 class="section-title">Services</h5>
<p class="text-muted small">Manage services</p>

<div class="d-grid gap-2">
<a href="addService.jsp" class="btn btn-success btn-sm">Add</a>
<a href="viewService.jsp" class="btn btn-primary btn-sm">View</a>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">📅</div>
<h5 class="section-title">Bookings</h5>
<p class="text-muted small">Manage bookings</p>

<div class="d-grid gap-2">
<a href="<%=request.getContextPath()%>/AdminViewBookingsController"
   class="btn btn-primary btn-sm">View</a>
</div>
</div>
</div>

</div>


<div class="row g-4 mt-1">

<div class="col-lg-4">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">📊</div>
<h5 class="section-title">Reports</h5>
<p class="text-muted small">Coming soon</p>
<button class="btn btn-outline-dark" disabled>Generate</button>
</div>
</div>

<div class="col-lg-4">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">📈</div>
<h5 class="section-title">Statistics</h5>
<p class="text-muted small">System overview</p>

<a href="<%=request.getContextPath()%>/AdminDashBoardController"
   class="btn btn-primary btn-sm">
   View Status
</a>
</div>
</div>

<div class="col-lg-4">
<div class="card dashboard-card shadow-sm p-4 text-center">
<div class="card-icon">⚙️</div>
<h5 class="section-title">More Features</h5>
<p class="text-muted small">Future upgrades</p>
<button class="btn btn-outline-dark" disabled>Coming Soon</button>
</div>
</div>

</div>

</div>

</body>
</html>
