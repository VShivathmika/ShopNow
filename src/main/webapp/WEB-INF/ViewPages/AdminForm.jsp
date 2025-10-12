<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  /* Body with subtle overlay for readability */
  body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
  }
  body::before {
    content: "";
    position: absolute;
    inset: 0;
    background: rgba(0,0,0,0.45); /* dark overlay */
  }

  /* Login box */
  .login-card {
    position: relative;
    z-index: 1;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 1rem;
    padding: 2.5rem;
    max-width: 400px;
    width: 90%;
    box-shadow: 0 0 25px rgba(0,0,0,0.2);
  }

  .login-card h1 {
    color: #1e3a8a; /* deep blue heading */
    margin-bottom: 1.5rem;
    font-weight: 700;
  }

  .form-label {
    font-weight: 600;
  }

  .btn-primary {
    background-color: #1e3a8a;
    border-color: #1e3a8a;
  }
  .btn-primary:hover {
    background-color: #0f172a;
    border-color: #0f172a;
  }
</style>
</head>

<body>
  <div class="login-card">
    <h1 class="text-center">Admin Login</h1>
    <form action="login" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label for="username" class="form-label">Mobile Number</label>
        <input type="tel"
               class="form-control"
               id="username"
               name="username"
               placeholder="Enter Mobile Number"
               pattern="[0-9]{10}"
               required>
        <div class="invalid-feedback">
          Please enter a valid 10-digit mobile number.
        </div>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password"
               class="form-control"
               id="password"
               name="password"
               placeholder="Enter Password"
               required>
        <div class="invalid-feedback">
          Password is required.
        </div>
      </div>

      <div class="d-grid mt-4">
        <button type="submit" class="btn btn-primary btn-lg">
          Login as Admin
        </button>
      </div>
    </form>
  </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Client-side Bootstrap validation
  (() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  })();
</script>
</body>
</html>
