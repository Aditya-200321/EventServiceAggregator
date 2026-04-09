<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.dao.EventDAO,
                 com.model.EventModel,
                 com.dao.ServiceDAO,
                 com.model.ServiceModel" %>
<%@ include file="navbar.jsp" %>

<%
Integer cid = (Integer) session.getAttribute("customerId");

if(cid == null){
    response.sendRedirect("customerLogin.jsp");
    return;
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
}

.section-title{
    font-weight:700;
    background:#212529;
    color:white;
    padding:10px 18px;
    border-radius:10px;
}

.card{
    border:none;
    border-radius:16px;
    transition:.25s;
    box-shadow:0 6px 16px rgba(0,0,0,0.08);
}

.card:hover{
    transform:translateY(-6px);
}

.price{
    font-weight:700;
    color:#0d6efd;
}

footer{
    background:#212529;
    color:white;
    padding:18px 0;
    margin-top:60px;
}

</style>
</head>

<body>

<div class="container mt-4">


<h3 class="section-title mb-3">Available Events</h3>

<div class="row">

<%
EventDAO ed = new EventDAO();
List<EventModel> events = ed.getAllEvents();

for(EventModel e : events){
%>

<div class="col-lg-4 col-md-6 mb-4">

    <div class="card h-100 p-3">

        <h5 class="fw-bold"><%= e.getEventName() %></h5>

        <p class="text-muted small">
            <%= e.getDescription() %>
        </p>

        <h6 class="price">₹ <%= e.getPrice() %></h6>

        <a href="bookingForm.jsp?eventId=<%=e.getEventId()%>"
           class="btn btn-primary w-100 mt-auto">
           Book This Event
        </a>

    </div>

</div>

<% } %>

</div>



<h3 class="section-title mt-5 mb-3">Available Services</h3>

<div class="row">

<%
ServiceDAO sd = new ServiceDAO();
List<ServiceModel> services = sd.getAllServices();

for(ServiceModel s : services){
%>

<div class="col-lg-4 col-md-6 mb-4">

    <div class="card h-100 p-3">

        <h5 class="fw-bold"><%= s.getServiceName() %></h5>

        <p class="text-muted small">
            <%= s.getDescription() %>
        </p>

        <h6 class="price">₹ <%= s.getPrice() %></h6>

    </div>

</div>

<% } %>

</div>


<div class="text-center mt-3">
<a href="ViewBookingController"
   class="btn btn-success btn-lg shadow">
   View My Bookings
</a>
</div>

</div>


<footer class="text-center">
<div class="container">
© 2026 Event Management System
</div>
</footer>

</body>
</html>
