<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.model.BookingModel" %>
<%@ include file="navbar.jsp" %>


<%
Integer cid = (Integer) session.getAttribute("customerId");
if(cid == null){
    response.sendRedirect("customerLogin.jsp");
    return;
}

List<BookingModel> list =
    (List<BookingModel>) request.getAttribute("bookingList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body{
    background:#f4f6f9;
}
footer{
    background:#212529;
    color:white;
    padding:15px 0;
    margin-top:60px;
}
</style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="customerDashboard.jsp">
            Event Management
        </a>

        <div class="ms-auto">
            <a href="customerDashboard.jsp"
               class="btn btn-outline-light btn-sm me-2">
               Dashboard
            </a>

            <a href="LogoutController"
               class="btn btn-danger btn-sm">
               Logout
            </a>
        </div>
    </div>
</nav>


<div class="container mt-5">

<h3 class="mb-4 text-center">My Bookings</h3>

<div class="card shadow">
<div class="card-body">

<table class="table table-bordered table-hover text-center">

<thead class="table-dark">
<tr>
<th>ID</th>
<th>Event ID</th>
<th>Date</th>
<th>Location</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
if(list != null && !list.isEmpty()){
    for(BookingModel b : list){
%>

<tr>
<td><%= b.getBookingId() %></td>
<td><%= b.getEventId() %></td>
<td><%= b.getEventDate() %></td>
<td><%= b.getLocation() %></td>

<td>

<a href="updateBooking.jsp?id=<%=b.getBookingId()%>">Update</a>


<a href="DeleteBookingController?booking_id=<%=b.getBookingId()%>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Delete this booking?');">
   Delete
</a>

</td>
</tr>

<%
    }
}else{
%>

<tr>
<td colspan="5">No Bookings Found</td>
</tr>

<%
}
%>

</tbody>
</table>

</div>
</div>
</div>


<footer class="text-center">
<div class="container">
© 2026 Event Management System
</div>
</footer>

</body>
</html>
