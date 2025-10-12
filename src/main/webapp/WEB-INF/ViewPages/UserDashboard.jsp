<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, com.shopnow.model.Products" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard – ShopNow</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* Body */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f5f7;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Navbar */
.navbar-dark {
    background-color: #2c3e50;
}

/* Hero / Welcome */
header.hero {
    background-color: #3d566e;
    color: #fff;
    padding: 3rem 0;
}
header.hero h1 {
    font-weight: 600;
}
header.hero p {
    font-size: 1.1rem;
}

/* Product Cards */
.card {
    border: none;
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}
.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
}
.card-img-top {
    height: 180px;
    object-fit: cover;
}
.card-body h6 {
    font-size: 1rem;
    font-weight: 600;
}
.card-text {
    font-size: 0.9rem;
}
.btn-shop {
    background-color: #2c3e50;
    color: #fff;
    font-weight: 500;
}
.btn-shop:hover {
    background-color: #1e2b38;
    color: #fff;
}

/* Discount Badge */
.discount-badge {
    position: absolute;
    top: 10px;
    left: 10px;
    background-color: #ff4d4f;
    color: white;
    font-weight: 600;
    font-size: 0.9rem;
    padding: 5px 10px;
    border-radius: 5px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}

/* Footer */
footer {
    background-color: #0f172a;
    color: #cbd5e1;
    padding: 3rem 0;
}
footer h5 { font-weight: 600; }
footer a { color: #cbd5e1; }
footer a:hover { color: #fff; }
footer p, footer li { font-size: 0.95rem; }

/* Responsive tweaks */
@media(max-width:768px){
    .card-img-top { height: 160px; }
}
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">ShopNow</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Categories</a></li>
                <li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="order">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="userlogout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO -->
<header class="hero text-center">
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
        <p class="lead mb-0">Browse our latest collections</p>
    </div>
</header>

<!-- PRODUCT GRID -->
<main class="container my-5 flex-grow-1">
    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 g-4">
        <%
            List<Products> products = (List<Products>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Products p : products) {
                    double displayPrice = p.getDiscountprice() > 0 ? p.getDiscountprice() : p.getPrice();
        %>
        <div class="col">
            <div class="card h-100 shadow-sm position-relative">
                <% if (p.getDiscountprice() > 0) { 
                       double discountPercent = ((p.getPrice() - p.getDiscountprice()) / p.getPrice()) * 100;
                %>
                    <div class="discount-badge"><%= String.format("%.0f", discountPercent) %>% OFF</div>
                <% } %>
                <img src="<%=p.getProductimage()%>" class="card-img-top" alt="<%=p.getProductname()%>">
                <div class="card-body text-center">
                    <h6 class="card-title"><%=p.getProductname()%></h6>
                    <p class="card-text mb-2">
                        ₹<%= String.format("%,.0f", displayPrice) %>
                        <% if (p.getDiscountprice() > 0) { %>
                        <span class="text-decoration-line-through text-muted">₹<%= String.format("%,.0f", p.getPrice()) %></span>
                        <% } %>
                    </p>
                    <a href="addtocart?productid=<%=p.getProductid()%>" class="btn btn-shop w-100">Add to Cart</a>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12 text-center">
            <p class="fw-bold text-muted">No products available right now.</p>
        </div>
        <%
            }
        %>
    </div>
</main>

<!-- FOOTER -->
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

</body>
</html>
