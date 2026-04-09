<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.model.EventModel,com.dao.EventDAO" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
}

.form-card{
    border-radius:18px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
}

.card-header{
    border-radius:18px 18px 0 0 !important;
}

.form-label{
    font-weight:600;
}

.form-control{
    border-radius:10px;
}

.btn-primary{
    border-radius:10px;
    font-weight:600;
}

.back-link{
    text-decoration:none;
    font-weight:500;
}

.back-link:hover{
    text-decoration:underline;
}

.error{
    color:red;
    font-size:14px;
}
</style>
</head>

<body>

<%
int id= Integer.parseInt(request.getParameter("event_id"));
EventDAO ed=new EventDAO();
EventModel e=ed.selectById(id);
%>

<div class="container mt-5">

<div class="row justify-content-center">
<div class="col-lg-5 col-md-7">

<div class="card form-card">

<div class="card-header bg-primary text-white text-center">
<h4 class="mb-0">Update Event</h4>
</div>

<div class="card-body p-4">

<form action="<%=request.getContextPath()%>/UpdateEventController"
      method="post"
      onsubmit="return validateEvent()" novalidate>

<input type="hidden"
       name="event_id"
       value="<%= e.getEventId() %>">

<!-- Event Name -->
<div class="mb-3">
<label class="form-label">Event Name</label>
<input type="text"
       id="eventName"
       name="event_name"
       class="form-control"
       value="<%= e.getEventName() %>">
<div id="nameError" class="error"></div>
</div>

<!-- Description -->
<div class="mb-3">
<label class="form-label">Description</label>
<textarea id="description"
          name="description"
          class="form-control"
          rows="3"><%= e.getDescription() %></textarea>
<div id="descError" class="error"></div>
</div>

<!-- Price -->
<div class="mb-4">
<label class="form-label">Price</label>
<input type="number"
       id="price"
       step="0.01"
       name="price"
       class="form-control"
       value="<%= e.getPrice() %>">
<div id="priceError" class="error"></div>
</div>

<div class="d-grid">
<button type="submit" class="btn btn-primary">
Update Event
</button>
</div>

</form>

</div>

<div class="card-footer text-center bg-light">
<a class="back-link"
   href="<%=request.getContextPath()%>/viewEvent.jsp">
← Back
</a>
</div>

</div>

</div>
</div>

</div>

<!-- ✅ Inline Validation Script -->
<script>
function validateEvent(){

    let isValid = true;

    let name = document.getElementById("eventName");
    let desc = document.getElementById("description");
    let price = document.getElementById("price");

    // Clear errors
    document.getElementById("nameError").innerText = "";
    document.getElementById("descError").innerText = "";
    document.getElementById("priceError").innerText = "";

    // Name validation
    if(!name.value.trim()){
        document.getElementById("nameError").innerText = "Event name is required";
        isValid = false;
    } else if(name.value.trim().length < 3){
        document.getElementById("nameError").innerText = "Minimum 3 characters required";
        isValid = false;
    }

    // Description validation
    if(!desc.value.trim()){
        document.getElementById("descError").innerText = "Description is required";
        isValid = false;
    } else if(desc.value.trim().length < 5){
        document.getElementById("descError").innerText = "Minimum 5 characters required";
        isValid = false;
    }

    // Price validation
    if(!price.value){
        document.getElementById("priceError").innerText = "Price is required";
        isValid = false;
    } else if(price.value <= 0){
        document.getElementById("priceError").innerText = "Price must be greater than 0";
        isValid = false;
    }

    return isValid;
}
</script>

</body>
</html>