<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    width: 450px;
    background-color: #ffffffcc;
    padding: 2.5rem;
    border-radius: 1rem;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

h1 {
    text-align: center;
    margin-bottom: 1.5rem;
    font-weight: bold;
    color: #1e293b;
}

.form-label {
    font-weight: 500;
    color: #334155;
}

.btn-signup {
    width: 100%;
    background-color: #1e293b;
    color: #fff;
    font-weight: 500;
    transition: background 0.3s;
}

.btn-signup:hover {
    background-color: #475569;
    color: #fff;
}

.login-link {
    color: #1e293b;
    text-decoration: none;
}

.login-link:hover {
    text-decoration: underline;
}
</style>
</head>

<body>
<div class="container">
    <h1>Create Your Account</h1>
    <form action="adduser" method="post">
        <div class="mb-3">
            <label for="fullname" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="fullname" placeholder="Enter your full name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="email" placeholder="Enter your email address" name="email" required>
        </div>
        <div class="mb-3">
            <label for="mobile" class="form-label">Mobile Number</label>
            <input type="number" class="form-control" id="mobile" placeholder="Enter your mobile number" name="number" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Create a strong password" name="password" required>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-signup">Sign Up</button>
        </div>
        <p class="text-center">Already have an account? <a href="userlogin" class="login-link">Login here</a></p>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
