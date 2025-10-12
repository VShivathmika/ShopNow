<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.shopnow.model.Products" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add to Cart – ShopNow</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f5f7;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    margin: 0;
}

/* NAVBAR */
.navbar-dark {
    background-color: #2c3e50;
}
.navbar-dark .navbar-brand, .navbar-dark .nav-link {
    color: #fff;
}
.navbar-dark .nav-link:hover {
    color: #cfd8dc;
}

/* HERO */
header.hero {
    background-color: #3d566e;
    color: #fff;
    padding: 2.5rem 0;
    text-align: center;
    margin-bottom: 2rem;
}
header.hero h1 { font-weight: 600; margin-bottom: 0.5rem; }

/* ADD TO CART FORM */
.container-form {
    max-width: 900px; /* wider */
    margin: 0 auto 50px auto;
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

/* BUTTON */
.btn-shop {
    background-color: #4a90e2;
    border: none;
    color: #fff;
    font-weight: 500;
}
.btn-shop:hover { background-color: #357ab8; color: #fff; }

/* FOOTER */
footer {
    background-color: #0f172a;
    color: #cbd5e1;
    padding: 3rem 0;
}
footer h5 { font-weight: 600; }
footer a { color: #cbd5e1; text-decoration: none; }
footer a:hover { color: #fff; }
footer p, footer li { font-size: 0.95rem; }

/* RESPONSIVE IMAGE */
.img-product {
    width: 100%;
    max-height: 300px;
    object-fit: cover;
    border-radius: 5px;
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
                <li class="nav-item"><a class="nav-link" href="#">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="userlogout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO -->
<header class="hero">
    <div class="container">
        <h1>Add Product to Cart</h1>
        <p>Review your product details and select quantity</p>
    </div>
</header>

<%
    Products pro = (Products) request.getAttribute("product");
    double unitPrice = pro.getDiscountprice() > 0 ? pro.getDiscountprice() : pro.getPrice();
%>

<!-- ADD TO CART FORM -->
<div class="container-form">
    <h2 class="mb-4 text-center">Product Details</h2>

    <form action="addtocartaction" method="post">
        <div class="row g-4">
            <!-- Product Image -->
            <div class="col-md-5 text-center">
                <img src="<%= pro.getProductimage() %>" alt="<%= pro.getProductname() %>" class="img-product mb-3">
            </div>

            <!-- Product Details -->
            <div class="col-md-7">
                <div class="mb-3">
                    <label class="form-label">Product ID</label>
                    <input type="number" class="form-control" name="productid" value="<%= pro.getProductid() %>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Product Name</label>
                    <input type="text" class="form-control" name="productname" value="<%= pro.getProductname() %>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Category / Details</label>
                    <input type="text" class="form-control" name="category" value="<%= pro.getCategory() %>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" value="1" min="1" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Total Price (₹)</label>
                    <input type="number" class="form-control" id="totalPrice" name="price" value="<%= unitPrice %>" readonly>
                </div>
                <button type="submit" class="btn btn-shop w-100 text-white">Add to Cart</button>
            </div>
        </div>
    </form>
</div>

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

<script>
const quantityInput = document.getElementById('quantity');
const totalPriceInput = document.getElementById('totalPrice');
const unitPrice = <%= unitPrice %>;

quantityInput.addEventListener('input', function() {
    let qty = parseInt(quantityInput.value) || 1;
    totalPriceInput.value = qty * unitPrice;
});
</script>

</body>
</html>
