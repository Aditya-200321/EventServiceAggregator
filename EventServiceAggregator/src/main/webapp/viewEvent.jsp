<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.model.EventModel, com.dao.EventDAO" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Events</title>

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
    background-color:#f1f5ff;
    transition:.2s;
}

</style>
</head>

<body>

<div class="container mt-4">

    <div class="page-header shadow mb-4 text-center">
        Available Events
    </div>

    <div class="card table-card shadow p-3">

        <div class="table-responsive">

        <table class="table table-bordered align-middle mb-0">

            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Event Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>

            <tbody>

            <%
                EventDAO ed = new EventDAO();
                List<EventModel> events = ed.getAllEvents();

                for(EventModel e : events){
            %>

                <tr>
                    <td class="text-center"><%= e.getEventId() %></td>
                    <td><%= e.getEventName() %></td>
                    <td><%= e.getDescription() %></td>
                    <td class="text-center fw-semibold">₹ <%= e.getPrice() %></td>

                    <td class="text-center">
                        <a href="updateEvent.jsp?event_id=<%= e.getEventId() %>"
                           class="btn btn-warning btn-sm">
                           Edit
                        </a>
                    </td>

                    <td class="text-center">
                        <a href="DeleteEventController?event_id=<%= e.getEventId() %>"
                           class="btn btn-danger btn-sm">
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
