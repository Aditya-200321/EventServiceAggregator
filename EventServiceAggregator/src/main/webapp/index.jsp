<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Service Aggregator</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
      rel="stylesheet">

<style>

body{
    background: linear-gradient(120deg,#f6f9fc,#eef2f7);
    font-family: 'Segoe UI', sans-serif;
}

.navbar{
    box-shadow:0 3px 10px rgba(0,0,0,0.15);
}
.navbar-brand{
    letter-spacing:1px;
}

.hero{
    padding:90px 20px;
}

.hero h1{
    font-size:2.6rem;
    color:#212529;
}

.hero p{
    color:#555;
}

.card{
    border:none;
    border-radius:14px;
    transition:0.3s ease;
}

.card:hover{
    transform:translateY(-6px);
    box-shadow:0 10px 25px rgba(0,0,0,0.18);
}

.card h4{
    font-weight:600;
}

.btn{
    border-radius:30px;
    font-weight:500;
}

footer{
    letter-spacing:.5px;
}

</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">EventServiceAggregator</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

        <li class="nav-item">
          <a class="nav-link" href="adminLogin.jsp">Admin Login</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="customerLogin.jsp">Customer Login</a>
        </li>

      </ul>
    </div>
  </div>
</nav>


<div class="container hero text-center">

    <h1 class="fw-bold mb-3">One Platform for All Your Event Needs</h1>

    <p class="lead">
        Weddings • Birthdays • Corporate Events • Parties • Catering • Decoration • Photography
    </p>

    <div class="row justify-content-center mt-5">

        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card shadow-sm p-4 h-100">
                <h4 class="mb-3">Customers</h4>
                <p class="mb-4">
                    Book all event services at one place easily.
                </p>

                <a href="customerRegister.jsp"
                   class="btn btn-primary w-100">
                   Customer Register
                </a>
            </div>
        </div>


        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card shadow-sm p-4 h-100">
                <h4 class="mb-3">Admin</h4>
                <p class="mb-4">
                    Manage users, services, bookings and payments.
                </p>

                <a href="adminLogin.jsp"
                   class="btn btn-success w-100">
                   Admin Login
                </a>
            </div>
        </div>

    </div>
</div>


<footer class="bg-dark text-white text-center p-3 mt-5">
    © 2026 Event Service Aggregator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
