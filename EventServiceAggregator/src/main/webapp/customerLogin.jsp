<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>

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

    <div class="row justify-content-center">

        <div class="col-md-4">

            <div class="card shadow-lg p-4">

                <h3 class="text-center mb-3">Customer Login</h3>

                <form action="CustomerLoginController" method="post"
                      onsubmit="return validateLogin()" novalidate>

                    <!-- Email -->
                    <input type="email"
                           id="email"
                           name="email"
                           class="form-control mb-1"
                           placeholder="Email">
                    <div id="emailError" class="error mb-2"></div>

                    <!-- Password -->
                    <input type="password"
                           id="password"
                           name="password"
                           class="form-control mb-1"
                           placeholder="Password">
                    <div id="passwordError" class="error mb-2"></div>

                    <button class="btn btn-primary w-100">
                        Login
                    </button>

                </form>

                <!-- Backend message (unchanged) -->
                <p class="text-danger text-center mt-2">
                    <%= request.getAttribute("msg") != null ?
                        request.getAttribute("msg") : "" %>
                </p>

            </div>

        </div>

    </div>

</div>

<!-- ✅ Inline Validation Script -->
<script>
function validateLogin() {

    let isValid = true;

    let email = document.getElementById("email");
    let password = document.getElementById("password");

    // Clear errors
    document.getElementById("emailError").innerText = "";
    document.getElementById("passwordError").innerText = "";

    // Email validation
    if (!email.value.trim()) {
        document.getElementById("emailError").innerText = "Email is required";
        isValid = false;
    } else if (!email.value.includes("@")) {
        document.getElementById("emailError").innerText = "Enter valid email";
        isValid = false;
    }

    // Password validation
    if (!password.value.trim()) {
        document.getElementById("passwordError").innerText = "Password is required";
        isValid = false;
    } else if (password.value.length < 4) {
        document.getElementById("passwordError").innerText = "Minimum 4 characters required";
        isValid = false;
    }

    return isValid;
}
</script>

</body>
</html>