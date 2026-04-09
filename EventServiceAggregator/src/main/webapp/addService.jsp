<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Service</title>

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

.error{
    color:red;
    font-size:14px;
}

</style>

</head>

<body>

<div class="container mt-4">

<div class="page-header shadow mb-4 text-center">
    Add Service
</div>

<div class="row justify-content-center">
<div class="col-lg-6">

<div class="card form-card shadow-lg p-4">

<form action="AddServiceController" method="post" onsubmit="return validateForm()">

    <!-- SERVICE NAME -->
    <div class="mb-3">
        <label class="form-label fw-semibold">Service Name</label>
        <input type="text"
               id="serviceName"
               name="serviceName"
               class="form-control"
               placeholder="Enter service name">
        <small id="nameError" class="error"></small>
    </div>

    <!-- DESCRIPTION -->
    <div class="mb-3">
        <label class="form-label fw-semibold">Description</label>
        <textarea id="description"
                  name="description"
                  class="form-control"
                  rows="3"
                  placeholder="Enter description"></textarea>
        <small id="descError" class="error"></small>
    </div>

    <!-- PRICE -->
    <div class="mb-3">
        <label class="form-label fw-semibold">Price</label>
        <input type="number"
               id="price"
               step="0.01"
               name="price"
               class="form-control"
               placeholder="Enter price">
        <small id="priceError" class="error"></small>
    </div>

    <div class="d-grid gap-2 mt-3">
        <button type="submit" class="btn btn-primary">
            Add Service
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

<!-- ✅ INLINE VALIDATION SCRIPT -->
<script>

function validateForm(){

    let serviceName = document.getElementById("serviceName").value.trim();
    let description = document.getElementById("description").value.trim();
    let price = document.getElementById("price").value.trim();

    let nameError = document.getElementById("nameError");
    let descError = document.getElementById("descError");
    let priceError = document.getElementById("priceError");

    let isValid = true;

    // clear old errors
    nameError.innerText = "";
    descError.innerText = "";
    priceError.innerText = "";

    // SERVICE NAME
    if(serviceName === ""){
        nameError.innerText = "Service name is required";
        isValid = false;
    }
    else if(serviceName.length < 3){
        nameError.innerText = "Service name must be at least 3 characters";
        isValid = false;
    }

    // DESCRIPTION
    if(description === ""){
        descError.innerText = "Description is required";
        isValid = false;
    }
    else if(description.length < 10){
        descError.innerText = "Description must be at least 10 characters";
        isValid = false;
    }

    // PRICE
    if(price === ""){
        priceError.innerText = "Price is required";
        isValid = false;
    }
    else if(price <= 0){
        priceError.innerText = "Enter a valid price greater than 0";
        isValid = false;
    }

    return isValid;
}

</script>

</body>
</html>