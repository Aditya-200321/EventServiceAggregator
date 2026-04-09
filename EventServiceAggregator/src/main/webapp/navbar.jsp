<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String adminUser = null;
    String customerUser = null;

    if(session.getAttribute("admin") != null){
        adminUser = session.getAttribute("admin").toString();
    }

    if(session.getAttribute("customerEmail") != null){
        customerUser = session.getAttribute("customerEmail").toString();
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">

    <div class="container-fluid">

        <span class="navbar-brand fw-bold">
            Event Service Aggregator
        </span>

        <button class="btn btn-outline-light btn-sm ms-2"
                onclick="history.back()">
            ← Back
        </button>

        <div class="ms-auto text-white">

            <% if(adminUser != null){ %>
                Admin : <b><%= adminUser %></b>

                <a href="AdminLogoutController"
                   class="btn btn-danger btn-sm ms-3">
                   Logout
                </a>
            <% } %>

            <% if(customerUser != null){ %>
                User : <b><%= customerUser %></b>

                <a href="CustomerLogoutController"
                   class="btn btn-danger btn-sm ms-3">
                   Logout
                </a>
            <% } %>

        </div>

    </div>

</nav>
