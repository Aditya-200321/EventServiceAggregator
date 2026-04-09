<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<%@ page import="java.util.*, com.dao.EventDAO,
                 com.dao.ServiceDAO,
                 com.model.EventModel,
                 com.model.ServiceModel" %>

<%
Integer cid = (Integer) session.getAttribute("customerId");

if(cid == null){
    response.sendRedirect("customerLogin.jsp");
    return;
}

String selectedEvent = request.getParameter("eventId");

EventDAO eventDAO = new EventDAO();
ServiceDAO serviceDAO = new ServiceDAO();

List<EventModel> events = eventDAO.getAllEvents();
List<ServiceModel> services = serviceDAO.getAllServices();

String success = (String) session.getAttribute("successMsg");

String today = java.time.LocalDate.now().toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Event</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
 rel="stylesheet">

<style>
.error {
    color: red;
    font-size: 14px;
}
</style>

</head>

<body class="bg-light">

<div class="container mt-5">

<%
if(success != null){
%>
<div class="alert alert-success text-center shadow">
    <strong><%= success %></strong>
</div>

<%
session.removeAttribute("successMsg");
response.setHeader("refresh","2;URL=customerDashboard.jsp");
}
%>

<div class="card shadow-lg">
<div class="card-header bg-success text-white text-center">
<h3>Book Your Event</h3>
</div>

<div class="card-body">

<form action="BookingController" method="post" 
      onsubmit="return validateForm()" novalidate>

<!-- Event -->
<div class="mb-3">
<label class="form-label">Select Event</label>

<select name="event_id" class="form-select" id="event">
<option value="">-- Select Event --</option>

<%
for(EventModel e : events){
String sel = (selectedEvent != null &&
              selectedEvent.equals(String.valueOf(e.getEventId())))
              ? "selected" : "";
%>

<option value="<%=e.getEventId()%>" <%=sel%>>
<%=e.getEventName()%>
</option>

<% } %>

</select>
<div id="eventError" class="error"></div>
</div>

<!-- Services -->
<div class="mb-3">
<label class="form-label">Select Services</label>

<%
for(ServiceModel s : services){
%>

<div class="form-check">
<input class="form-check-input"
type="checkbox"
name="service_ids"
value="<%=s.getServiceId()%>">

<label class="form-check-label">
<%=s.getServiceName()%>
</label>
</div>

<% } %>

<div id="serviceError" class="error"></div>
</div>

<!-- Date -->
<div class="mb-3">
<label class="form-label">Event Date</label>
<input type="date" id="date" name="event_date"
class="form-control" min="<%=today%>">
<div id="dateError" class="error"></div>
</div>

<!-- Location -->
<div class="mb-3">
<label class="form-label">Event Location</label>
<input type="text" id="location" name="location"
class="form-control">
<div id="locationError" class="error"></div>
</div>

<button type="submit" class="btn btn-success w-100">
Confirm Booking
</button>

</form>

</div>
</div>

</div>

<!-- ✅ Inline Validation Script -->
<script>
function validateForm() {

    let isValid = true;

    // Get fields
    let event = document.getElementById("event");
    let services = document.querySelectorAll("input[name='service_ids']:checked");
    let date = document.getElementById("date");
    let location = document.getElementById("location");

    // Clear errors
    document.getElementById("eventError").innerText = "";
    document.getElementById("serviceError").innerText = "";
    document.getElementById("dateError").innerText = "";
    document.getElementById("locationError").innerText = "";

    // Event validation
    if (!event.value) {
        document.getElementById("eventError").innerText = "Please select an event";
        isValid = false;
    }

    // Services validation
    if (services.length === 0) {
        document.getElementById("serviceError").innerText = "Select at least one service";
        isValid = false;
    }

    // Date validation
    if (!date.value) {
        document.getElementById("dateError").innerText = "Please select a date";
        isValid = false;
    }

    // Location validation
    if (!location.value.trim()) {
        document.getElementById("locationError").innerText = "Enter location";
        isValid = false;
    } else if (location.value.trim().length < 3) {
        document.getElementById("locationError").innerText = "Minimum 3 characters required";
        isValid = false;
    }

    return isValid;
}
</script>

</body>
</html>