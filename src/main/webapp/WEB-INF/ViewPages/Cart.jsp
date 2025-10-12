<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, com.shopnow.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Your Cart – ShopNow</title>
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
.navbar-dark { background-color: #2c3e50; }
.navbar-dark .navbar-brand, .navbar-dark .nav-link { color: #fff; }
.navbar-dark .nav-link.active { font-weight: 600; color: #ffd700; }
.navbar-dark .nav-link:hover { color: #cfd8dc; }

/* HERO */
header.hero {
    background-color: #3d566e;
    color: #fff;
    padding: 2rem 0;
    text-align: center;
    margin-bottom: 2rem;
}

/* CART CONTAINER */
.container-cart {
    max-width: 950px;
    margin: 0 auto 50px auto;
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

/* TABLE */
.table thead { background-color: #2c3e50; color: #fff; }
.table td, .table th { vertical-align: middle; }
.table-striped tbody tr:nth-of-type(odd) { background-color: #f9f9f9; }

/* FOOTER */
footer { background-color: #0f172a; color: #cbd5e1; padding: 2rem 0; margin-top: auto; }
footer a { color: #cbd5e1; text-decoration: none; }
footer a:hover { color: #fff; }
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="userdashboard">ShopNow</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="userdashboard">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="cart">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="userlogout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO -->
<header class="hero">
    <div class="container">
        <h1>Your Shopping Cart</h1>
        <p>Review and update your items before checkout</p>
    </div>
</header>

<!-- CART CONTENT -->
<div class="container-cart">
    <h2 class="mb-4 text-center">Cart Items</h2>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="alert alert-warning text-center" role="alert">
            Your cart is empty.
        </div>
    <%
        } else {
    %>
    <form action="cartupdate" method="post">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price (₹)</th>
                        <th>Total (₹)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    double grandTotal = 0;
                    for (CartItem item : cart) {
                        double total = item.getPrice() * item.getQuantity();
                        grandTotal += total;
                %>
                    <tr>
                        <td><%= item.getProductid() %></td>
                        <td><%= item.getProductname() %></td>
                        <td>
                            <input type="number" name="quantity_<%= item.getProductid() %>"
                                   value="<%= item.getQuantity() %>"
                                   min="1" class="form-control form-control-sm quantity-input"
                                   data-price="<%= item.getPrice() %>">
                        </td>
                        <td class="price"><%= item.getPrice() %></td>
                        <td class="total"><%= total %></td>
                        <td>
                            <a href="cartremove?productid=<%= item.getProductid() %>" class="btn btn-danger btn-sm">Remove</a>
                        </td>
                    </tr>
                <%
                    }
                %>
                    <tr class="fw-bold table-dark">
                        <td colspan="4" class="text-end">Grand Total</td>
                        <td colspan="2" id="grandTotal"><%= grandTotal %></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center">
            
<a href="checkout" class="btn btn-success px-4">Proceed to Checkout</a>
        </div>
    </form>
    <%
        }
    %>
</div>

<!-- FOOTER -->
<footer>
    <div class="container text-center">
        <p>&copy; 2025 ShopNow. All Rights Reserved.</p>
    </div>
</footer>

<script>
// ✅ Live update totals when quantity changes
document.querySelectorAll(".quantity-input").forEach(input => {
    input.addEventListener("input", function() {
        let row = this.closest("tr");
        let price = parseFloat(this.dataset.price);
        let quantity = parseInt(this.value);
        if (quantity < 1) quantity = 1;
        let total = price * quantity;
        row.querySelector(".total").innerText = total;

        // Update grand total
        let grand = 0;
        document.querySelectorAll(".total").forEach(td => {
            grand += parseFloat(td.innerText) || 0;
        });
        document.getElementById("grandTotal").innerText = grand;
    });
});
</script>

</body>
</html>
