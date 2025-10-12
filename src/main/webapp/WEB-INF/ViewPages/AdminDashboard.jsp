<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, com.shopnow.model.Products, com.shopnow.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ShopNow Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background:#f5f6fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin:0;
}
.navbar {
    background:#1e293b;
}
.navbar-brand, .navbar .nav-link {
    color:#fff !important;
}
.navbar .nav-link:hover {
    text-decoration:underline;
}
.sidebar {
    background:#334155;
    min-height:100vh;
    padding-top:1rem;
}
.sidebar a {
    color:#cbd5e1;
    display:block;
    padding:.75rem 1rem;
    text-decoration:none;
    margin-bottom:.25rem;
    border-radius:.5rem;
}
.sidebar a.active, .sidebar a:hover {
    background:#475569;
    color:#fff;
}
.section-title {
    font-weight:bold;
    color:#1e293b;
    margin:2rem 0 1rem 0;
}
.card {
    border:none;
    border-radius:1rem;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}
.product-card img {
    height:180px;
    object-fit:cover;
    border-top-left-radius:1rem;
    border-top-right-radius:1rem;
}
.discount-badge {
    position:absolute;
    top:10px;
    left:10px;
    background:#ef4444;
    color:#fff;
    padding:0.2rem 0.5rem;
    font-size:0.8rem;
    border-radius:.5rem;
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

<!-- ===== Navbar ===== -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand fw-bold" href="#">ShopNow Admin</a>
    <div class="ms-auto">
        <a href="logout" class="btn btn-light btn-sm">Logout</a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- ===== Sidebar ===== -->
        <nav class="col-md-2 d-none d-md-block sidebar">
            <a class="active" href="#products">Products</a>
            <a href="UserDetails">Users</a>
            <a href="#bookings">Bookings</a>
        </nav>

        <!-- ===== Main Content ===== -->
        <main class="col-md-10 ms-sm-auto px-4 py-4">

            <!-- ===== Products Section ===== -->
            <section id="products">
                <h2 class="section-title">Product Management</h2>

                <!-- Search Form -->
          
                <form action="productbyid" method="get" class="row g-3 mb-4 align-items-center">
                    <div class="col-md-4">
                        <input type="number" name="productid"  class="form-control" placeholder="Search by Product ID, Name, or Category">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">Search</button>
                    </div>
                    <div class="col-md-2 ms-auto">
                        <a href="productsform" class="btn btn-success w-100">+ Add Product</a>
                    </div>
                </form>

                <div class="row g-4">
                    <%
                        List<Products> products = (List<Products>) request.getAttribute("products");
                        if(products != null){
                            for(Products p : products){
                                double discount = p.getDiscountprice() > 0 ?
                                    100.0 * (p.getPrice() - p.getDiscountprice())/p.getPrice() : 0;
                    %>
                    <div class="col-sm-6 col-lg-3">
                        <div class="card product-card position-relative h-100">
                            <% if(discount > 0){ %>
                                <span class="discount-badge"><%= (int)discount %>% OFF</span>
                            <% } %>
                            <img src="<%=p.getProductimage()%>" class="card-img-top" alt="Product Image">
                            <div class="card-body text-center">
                                <h5 class="fw-bold"><%=p.getProductname()%></h5>
                                <p class="text-muted mb-1"><%=p.getCategory()%></p>
                                <p>
                                    <span class="fs-5 fw-bold text-success">₹<%= p.getDiscountprice()>0 ? p.getDiscountprice() : p.getPrice() %></span>
                                    <% if(p.getDiscountprice()>0){ %>
                                        <span class="text-decoration-line-through text-muted">₹<%=p.getPrice()%></span>
                                    <% } %>
                                </p>
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="editproduct?productid=<%=p.getProductid()%>" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="deleteproduct?productid=<%=p.getProductid()%>" class="btn btn-danger btn-sm">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } } %>
                </div>
            </section>


            <!-- ===== Users Section ===== -->
            <section id="users">
                <h2 class="section-title text-center">User Management</h2>

                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            
                            <th>Name</th>
                             <th>Mobile</th>
                            <th>Email</th>
                            <th>Password</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<User> users = (List<User>) request.getAttribute("user");
                            if(users != null){
                                for(User u : users){
                        %>
                        <tr>
                            <td><%=u.getName()%></td>
                            <td><%=u.getNumber()%></td>
                            <td><%=u.getEmail()%></td>
                            <td><%=u.getPassword()%></td>
                         
                           
                        </tr>
                        <% } } %>
                    </tbody>
                </table>
            </section>
        </main>
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
