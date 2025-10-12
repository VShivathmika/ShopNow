<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.shopnow.model.Products"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin-Edit Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    /* Professional subtle background */
    background: url('https://images.unsplash.com/photo-1605902711622-cfb43c44347e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8aWRlYXwlMjBhZG1pbnxlbnwwfHx8fDE2OTY2OTI1OTI&ixlib=rb-4.0.3&q=80&w=1920') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.container-form {
    max-width: 700px;
    background-color: rgba(255,255,255,0.95);
    padding: 2rem;
    border-radius: 1rem;
    margin: 3rem auto;
    box-shadow: 0 5px 25px rgba(0,0,0,0.15);
}
h1 {
    color: #0f172a;
    font-weight: bold;
    margin-bottom: 0.5rem;
}
p.subtitle {
    color: #475569;
    margin-bottom: 2rem;
}
.btn-submit {
    background-color: #0f172a;
    color: #fff;
    font-weight: bold;
    transition: all 0.3s ease;
}
.btn-submit:hover {
    background-color: #1e293b;
}
label {
    font-weight: 600;
    color: #334155;
}
</style>
</head>
<body>

<div class="container-form">
    <div class="text-center mb-4">
        <h1>Edit Product</h1>
        <p class="subtitle">Update product details below</p>
    </div>

    <% Products pro = (Products) request.getAttribute("product"); %>

    <form class="row g-3" action="updateproduct" method="post">
        <div class="col-12">
            <label for="productId" class="form-label">Product ID</label>
            <input type="number" class="form-control" id="productId" name="productid"
                   value="<%=pro.getProductid()%>" readonly required>
        </div>

        <div class="col-12">
            <label for="productImage" class="form-label">Product Image URL</label>
            <input type="text" class="form-control" id="productImage" name="productimage"
                   value="<%=pro.getProductimage()%>" required>
        </div>

        <div class="col-12">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productname"
                   value="<%=pro.getProductname()%>" required>
        </div>

        <div class="col-12">
            <label for="category" class="form-label">Category / Details</label>
            <input type="text" class="form-control" id="category" name="category"
                   value="<%=pro.getCategory()%>" required>
        </div>

        <div class="col-6">
            <label for="discountPrice" class="form-label">Discount Price (₹)</label>
            <input type="number" class="form-control" id="discountPrice" name="discountprice"
                   value="<%=pro.getDiscountprice()%>" required>
        </div>

        <div class="col-6">
            <label for="price" class="form-label">Original Price (₹)</label>
            <input type="number" class="form-control" id="price" name="price"
                   value="<%=pro.getPrice()%>" required>
        </div>

        <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-submit w-50">Update Product</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
