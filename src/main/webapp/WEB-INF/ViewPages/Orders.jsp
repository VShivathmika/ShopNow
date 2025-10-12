<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Order History</h2>
    
    <!-- Filter Dropdown -->
    <form method="get" action="orders" class="mb-3">
        <select name="status" onchange="this.form.submit()" class="form-select w-25">
            <option value="ALL" <%= "ALL".equals(request.getParameter("status")) ? "selected" : "" %>>All Orders</option>
            <option value="SUCCESS" <%= "SUCCESS".equals(request.getParameter("status")) ? "selected" : "" %>>Successful Orders</option>
            <option value="FAILED" <%= "FAILED".equals(request.getParameter("status")) ? "selected" : "" %>>Failed Orders</option>
            <option value="PROCESSING" <%= "PROCESSING".equals(request.getParameter("status")) ? "selected" : "" %>>Processing Orders</option>
        </select>
    </form>

    <!-- Orders Table -->
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Order ID</th>
                <th>Name</th>
                <th>Total</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.fullname}</td>
                    <td>₹${order.totalAmount}</td>
                    <td>
                        <span class="badge 
                            ${order.status == 'SUCCESS' ? 'bg-success' : 
                            order.status == 'FAILED' ? 'bg-danger' : 'bg-warning'}">
                            ${order.status}
                        </span>
                    </td>
                    <td>${order.createdAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
