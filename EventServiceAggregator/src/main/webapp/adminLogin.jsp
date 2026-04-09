<%@ include file="navbar.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">

    <div class="col-lg-4 col-md-6 col-sm-10">

        <div class="card border-0 shadow-lg rounded-4">

            <div class="card-body p-5">

                <h3 class="text-center fw-bold mb-4 text-dark">
                    Admin Login
                </h3>

                <form action="AdminLoginController" method="post" onsubmit="return validateLogin()">

                    <!-- EMAIL -->
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text"
                               id="email"
                               name="email"
                               class="form-control"
                               placeholder="Enter email">
                        <small id="emailError" class="text-danger"></small>
                    </div>

                    <!-- PASSWORD -->
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password"
                               id="password"
                               name="password"
                               class="form-control"
                               placeholder="Enter password">
                        <small id="passwordError" class="text-danger"></small>
                    </div>

                    <button class="btn btn-dark w-100 py-2 fw-semibold rounded-3">
                        Login
                    </button>

                </form>

                <p class="text-danger text-center mt-3 small">
                    <%= request.getAttribute("msg") != null ?
                        request.getAttribute("msg") : "" %>
                </p>

            </div>

        </div>

    </div>

</div>

<!-- ✅ INLINE JS VALIDATION -->
<script>

function validateLogin(){

    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value.trim();

    let emailError = document.getElementById("emailError");
    let passwordError = document.getElementById("passwordError");

    let isValid = true;

    // clear old errors
    emailError.innerText = "";
    passwordError.innerText = "";

    // EMAIL VALIDATION
    if(email === ""){
        emailError.innerText = "Email is required";
        isValid = false;
    }
    else if(!email.includes("@")){
        emailError.innerText = "Enter valid email address";
        isValid = false;
    }

    // PASSWORD VALIDATION
    if(password === ""){
        passwordError.innerText = "Password is required";
        isValid = false;
    }
    else if(password.length < 5){
        passwordError.innerText = "Password must be at least 5 characters";
        isValid = false;
    }

    return isValid;
}

</script>