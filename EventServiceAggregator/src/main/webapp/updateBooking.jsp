<%@ page import="com.dao.BookingDAO,com.model.BookingModel" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Booking</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#eef2f7,#f8fafc);
}

.form-card{
    border-radius:16px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.page-title{
    font-weight:700;
}

.form-control{
    border-radius:10px;
}

.btn-update{
    border-radius:10px;
    font-weight:600;
}

.error{
    color:red;
    font-size:14px;
}
</style>
</head>

<body>

<div class="container mt-5">

<%
String error = (String) request.getAttribute("error");
if(error != null){
%>
<div class="alert alert-danger text-center">
    <%= error %>
</div>
<%
}
%>

<%
String idStr = request.getParameter("id");
BookingModel b = null;

if(idStr != null){
    int id = Integer.parseInt(idStr);
    BookingDAO dao = new BookingDAO();
    b = dao.getBookingById(id);
}

if(b == null){
%>

<div class="alert alert-danger text-center">
    Booking Not Found!
</div>

<div class="text-center">
<a href="ViewBookingController" class="btn btn-secondary">
Go Back
</a>
</div>

<%
return;
}
%>

<div class="row justify-content-center">
<div class="col-lg-5 col-md-7">

<div class="card form-card p-4">

<h3 class="text-center page-title mb-4">
Update Booking
</h3>

<form action="UpdateBookingController" method="post"
      onsubmit="return validateUpdate()" novalidate>

<input type="hidden" name="bookingId"
       value="<%=b.getBookingId()%>"/>

<input type="hidden" name="customerId"
       value="<%=b.getCustomerId()%>"/>

<!-- Event ID -->
<div class="mb-3">
<label class="form-label fw-semibold">Event ID</label>
<input type="text"
       id="eventId"
       class="form-control"
       name="eventId"
       value="<%=b.getEventId()%>">
<div id="eventIdError" class="error"></div>
</div>

<!-- Date -->
<div class="mb-3">
<label class="form-label fw-semibold">Event Date</label>
<input type="date"
       id="eventDate"
       class="form-control"
       name="eventDate"
       value="<%= b.getEventDate().substring(0,10) %>">
<div id="dateError" class="error"></div>
</div>

<!-- Location -->
<div class="mb-4">
<label class="form-label fw-semibold">Location</label>
<input type="text"
       id="location"
       class="form-control"
       name="location"
       value="<%=b.getLocation()%>">
<div id="locationError" class="error"></div>
</div>

<div class="d-grid">
<button type="submit"
        class="btn btn-primary btn-update">
Update Booking
</button>
</div>

</form>

</div>
</div>
</div>

</div>

<!-- ✅ Inline Validation Script -->
<script>
function validateUpdate(){

    let isValid = true;

    let eventId = document.getElementById("eventId");
    let date = document.getElementById("eventDate");
    let location = document.getElementById("location");

    // Clear errors
    document.getElementById("eventIdError").innerText = "";
    document.getElementById("dateError").innerText = "";
    document.getElementById("locationError").innerText = "";

    // Event ID validation
    if(!eventId.value.trim()){
        document.getElementById("eventIdError").innerText = "Event ID is required";
        isValid = false;
    }

    // Date validation
    if(!date.value){
        document.getElementById("dateError").innerText = "Please select event date";
        isValid = false;
    } else {
        let today = new Date().toISOString().split("T")[0];
        if(date.value < today){
            document.getElementById("dateError").innerText = "Date cannot be in past";
            isValid = false;
        }
    }

    // Location validation
    if(!location.value.trim()){
        document.getElementById("locationError").innerText = "Location is required";
        isValid = false;
    } else if(location.value.trim().length < 3){
        document.getElementById("locationError").innerText = "Minimum 3 characters required";
        isValid = false;
    }

    return isValid;
}
</script>

</body>
</html>