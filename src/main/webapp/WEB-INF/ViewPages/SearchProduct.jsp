<%@page import="com.shopnow.model.Products"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin - Product Details | ShopNow</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
/* Global */
body {
    background-color: #f4f6f8;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding-top: 70px;
}
a { text-decoration: none; }
a:hover { text-decoration: none; }

/* Navbar */
.navbar {
    background-color: #0f172a;
}
.navbar-brand, .navbar-nav .nav-link {
    color: #fff !important;
}
.navbar .nav-link:hover {
    color: #f4e3cd !important;
}

/* Header */
.container-header {
    text-align: center;
    margin-bottom: 2rem;
}
.container-header h1 {
    font-weight: bold;
    color: #0f172a;
}
.container-header p {
    color: #475569;
    font-size: 1.1rem;
}

/* Product Card */
.card-product {
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.card-product:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 20px rgba(0,0,0,0.15);
}
.card-img-top {
    height: 220px;
    object-fit: cover;
}
.card-body h5 {
    font-size: 1.2rem;
    font-weight: 600;
}
.price {
    font-size: 1.25rem;
    font-weight: bold;
    color: #16a34a; /* Green for price */
}
.discount-price {
    text-decoration: line-through;
    color: #9ca3af;
    font-size: 1rem;
    margin-left: 0.5rem;
}
.btn-action {
    background-color: #0f172a;
    color: #fff;
    transition: all 0.3s ease;
}
.btn-action:hover {
    background-color: #1e293b;
    color: #fff;
}

/* Footer */
footer {
    background-color: #0f172a;
    color: #cbd5e1;
    padding: 3rem 0;
}
footer h5 {
    font-weight: bold;
}
footer a {
    color: #cbd5e1;
}
footer a:hover {
    color: #fff;
}
footer p, footer li {
    font-size: 0.95rem;
}

/* Responsive tweaks */
@media(max-width:768px){
    .card-img-top { height: 180px; }
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container">
    <a class="navbar-brand fs-4 fw-bold" href="#">ShopNow Admin</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto me-3">
        <li class="nav-item"><a class="nav-link active" href="#products">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="#users">Users</a></li>
        <li class="nav-item"><a class="nav-link" href="#bookings">Bookings</a></li>
        <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
      </ul>
      <form action="productbyid" class="d-flex me-3" method="post">
        <input class="form-control me-2" type="search" placeholder="Search Product ID" name="productid">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      <a href="logout" class="btn btn-outline-light">Logout</a>
    </div>
  </div>
</nav>

<!-- Header -->
<div class="container container-header">
    <h1>Product Details</h1>
    <p>Admin view of product information</p>
</div>

<!-- Product Section -->
<div class="container mb-5">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <%
            Products p = (Products) request.getAttribute("product");
            if (p != null) {
        %>
        <div class="col">
            <div class="card card-product h-100 shadow-sm">
                <img src="<%=p.getProductimage()%>" class="card-img-top" alt="Product Image">
                <div class="card-body text-center">
                    <p><strong>Product ID:</strong> <%=p.getProductid()%></p>
                    <h5 class="card-title"><%=p.getProductname()%></h5>
                    <p class="text-muted"><%=p.getCategory()%></p>
                    <p>
                        <span class="price">&#8377;<%= String.format("%,.0f", p.getDiscountprice()>0 ? p.getDiscountprice() : p.getPrice()) %></span>
                        <% if(p.getDiscountprice()>0){ %>
                        <span class="discount-price">&#8377;<%= String.format("%,.0f", p.getPrice()) %></span>
                        <% } %>
                    </p>
                    <div class="d-flex justify-content-center gap-2">
                        <a class="btn btn-action" href="editproduct?productid=<%=p.getProductid()%>">Edit</a>
                        <a class="btn btn-action" href="deleteproduct?productid=<%=p.getProductid()%>">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            } else {
        %>
        <div class="col text-center">
            <p class="fs-5 fw-bold text-muted">No product found with this ID.</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 mb-3">
                <h5>ShopNow</h5>
                <p>Your trusted online shopping destination for quality products and service.</p>
            </div>
            <div class="col-md-3 mb-3">
                <h5>Company</h5>
                <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">FAQs</a></li>
                </ul>
            </div>
            <div class="col-md-3 mb-3">
                <h5>Categories</h5>
                <ul class="list-unstyled">
                    <li>Fashion</li>
                    <li>Beauty</li>
                    <li>Electronics</li>
                    <li>Sports</li>
                </ul>
            </div>
            <div class="col-md-3 mb-3">
                <h5>Support</h5>
                <ul class="list-unstyled">
                    <li>Help</li>
                    <li>support@shopnow.com</li>
                    <li>+91 98765 43210</li>
                </ul>
            </div>
        </div>
        <hr>
        <div class="text-center">&copy; 2025 ShopNow. All Rights Reserved.</div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
