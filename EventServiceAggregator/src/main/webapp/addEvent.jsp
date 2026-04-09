<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>

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
.form-card{
    border:none;
    border-radius:18px;
}
.btn-primary,.btn-secondary{
    padding:8px 28px;
    font-weight:600;
}
.error{
    color:red;
    font-size:14px;
}
</style>



</head>

<body>

<div class="container mt-4">

    <div class="page-header shadow mb-4 text-center">
        Add New Event
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-6">

            <div class="card form-card shadow p-4">

                <!-- ✅ Added name + onsubmit -->
                <form name="eventForm"
                      action="AddEventController"
                      method="post"
                      onsubmit="return validateForm()">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Event Name</label>
                        <input type="text"
                               name="eventName"
                               class="form-control"
                               placeholder="Enter event name">
                        <div id="nameError" class="error"></div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea name="description"
                                  class="form-control"
                                  rows="3"
                                  placeholder="Enter description"></textarea>
                        <div id="descError" class="error"></div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold">Price</label>
                        <input type="number"
                               step="0.01"
                               name="price"
                               class="form-control"
                               placeholder="Enter price">
                        <div id="priceError" class="error"></div>
                    </div>

                    <div class="d-flex justify-content-center gap-3">
                        <button type="submit" class="btn btn-primary">
                            Add Event
                        </button>

                        <button type="reset" class="btn btn-outline-secondary">
                            Reset
                        </button>
                    </div>

                </form>

            </div>
        </div>
    </div>

</div>
<script>
function validateForm(){

    let eventName = document.forms["eventForm"]["eventName"].value.trim();
    let description = document.forms["eventForm"]["description"].value.trim();
    let price = document.forms["eventForm"]["price"].value.trim();

    let isValid = true;

    // Clear previous errors
    document.getElementById("nameError").innerText = "";
    document.getElementById("descError").innerText = "";
    document.getElementById("priceError").innerText = "";

    // Event Name Validation
    if(eventName.length < 3){
        document.getElementById("nameError").innerText =
            "Event name must be at least 3 characters";
        isValid = false;
    }

    // Description Validation
    if(description.length < 10){
        document.getElementById("descError").innerText =
            "Description must be at least 10 characters";
        isValid = false;
    }

    // Price Validation
    if(price === "" || isNaN(price) || parseFloat(price) <= 0){
        document.getElementById("priceError").innerText =
            "Enter a valid price greater than 0";
        isValid = false;
    }

    return isValid;
}
</script>

</body>
</html>