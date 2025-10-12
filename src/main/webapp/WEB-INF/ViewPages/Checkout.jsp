<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, com.shopnow.model.CartItem"%>

<%
    // Get cart from session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
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

        /* CARD + TABLE */
        .card { border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .table thead { background-color: #2c3e50; color: #fff; }
        .table-striped tbody tr:nth-of-type(odd) { background-color: #f9f9f9; }

        /* FOOTER */
        footer {
            background-color: #0f172a;
            color: #cbd5e1;
            padding: 1.5rem 0;
            margin-top: auto;
        }
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
                    <li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">Checkout</a></li>
                    <li class="nav-item"><a class="nav-link" href="userlogout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- HERO -->
    <header class="hero">
        <div class="container">
            <h1>Checkout</h1>
            <p>Review your items and provide shipping details</p>
        </div>
    </header>

    <div class="container mb-5">
        <!-- CART SUMMARY -->
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                <strong>Your Order</strong>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price (₹)</th>
                            <th>Quantity</th>
                            <th>Subtotal (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (cart != null && !cart.isEmpty()) {
                                for (CartItem item : cart) {
                                    double subtotal = item.getPrice() * item.getQuantity();
                                    total += subtotal;
                        %>
                        <tr>
                            <td><%= item.getProductname() %></td>
                            <td><%= item.getPrice() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td><%= subtotal %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="4" class="text-center text-danger">Your cart is empty!</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr class="table-secondary fw-bold">
                            <td colspan="3" class="text-end">Total:</td>
                            <td>₹<%= total %></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!-- SHIPPING FORM -->
        <div class="card">
            <div class="card-header bg-dark text-white">
                <strong>Shipping Information</strong>
            </div>
            <div class="card-body">
                <form action="placeorder" method="post">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullname" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <textarea name="address" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mobile Number</label>
                        <input type="text" name="mobile" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email (optional)</label>
                        <input type="email" name="email" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Payment Method</label>
                        <select name="payment" class="form-select" required>
                            <option value="COD">Cash on Delivery</option>
                            <option value="UPI">UPI</option>
                            <option value="Card">Credit/Debit Card</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Place Order</button>
                </form>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer>
        <div class="container text-center">
            <p>&copy; 2025 ShopNow. All Rights Reserved.</p>
        </div>
    </footer>

</body>
</html>
