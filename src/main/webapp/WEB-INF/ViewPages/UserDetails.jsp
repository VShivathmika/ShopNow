<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.shopnow.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ShopNow Admin - Users</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand fw-bold" href="#">ShopNow Admin</a>
    <div class="ms-auto">
        <a href="logout" class="btn btn-light btn-sm">Logout</a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block bg-secondary p-3">
            <a class="text-white d-block p-2" href="admin/products">Products</a>
            <a class="active bg-dark text-white d-block p-2" href="admin/users">Users</a>
            <a class="text-white d-block p-2" href="admin/bookings">Bookings</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 px-4 py-4">
            <h2>User Management</h2>
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
                        List<User> users = (List<User>) request.getAttribute("users");
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
        </main>
    </div>
</div>
</body>
</html>
