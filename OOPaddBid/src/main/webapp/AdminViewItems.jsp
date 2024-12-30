<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Ubuntu', sans-serif;
            background-color: whitesmoke;
        }

        /* Header Styling */
        .admin-header {
            background-color: #003366;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-header .logo img {
            height: 50px;
        }

        .admin-header .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 16pt;
        }

        .admin-header .nav-links a:hover {
            text-decoration: underline;
        }

        .title {
            font-size: 2.5em;
            font-weight: bold;
        }

        /* Footer Styling */
        .admin-footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .admin-footer p {
            margin: 0;
            font-size: 14pt;
        }

        /* Main Table Container */
        .table-container {
            margin: 50px auto;
            width: 70%;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table and Row Styling */
        .table {
            width: 100%;
            margin-bottom: 20px;
        }

        .table th, .table td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
        }

        .table th {
            background-color: #003366;
            color: white;
            font-size: 1.1em;
        }

        .table-row-admin {
            background-color: #f9f9f9;
        }

        .table-row-admin:hover {
            background-color: #f1f1f1;
        }

        .item-image {
            width: 120px;
            height: 120px;
            object-fit: cover;
        }

        /* Button Styling */
        .btn-primary:hover, .btn-danger:hover {
            opacity: 0.9;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .table-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="admin-header">
    <div class="logo">
        <img src="./images/logo.png" alt="Admin Logo">
    </div>
    <h1 class="title">Admin Dashboard</h1>
    <div class="nav-links">
        <a href="./admin-dash.jsp" class="adminDashnav">Dashboard</a>
        <a href="#" class="logoutBTN">Logout</a>
    </div>
</header>

<!-- Main Content: Table for Admin Actions -->
<div class="table-container">
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Bid Details</th>
                
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${items}">
                <tr class="table-row-admin">
                    <td>
                        Bid No: <c:out value="${item.itemNo}" /><br>
                        <h3 class="item-name"><c:out value="${item.itemName}" /></h3>
                        <p class="itemdes"><c:out value="${item.description}" /></p>
                        <h4 class="item_price">Bid starting Price: $<c:out value="${item.price}" /></h4>
                    </td>
                    
                    <td style="text-align: center;">
                        <img class="item-image" src="images/${item.itemImage}" alt="Bid Image">
                    </td>
                    <td>
                        <c:url value="AdminUpdateItem.jsp" var="ItemUpdate">
                            <c:param name="itemNo" value="${item.itemNo}" />
                            <c:param name="itemName" value="${item.itemName}" />
                            <c:param name="description" value="${item.description}" />
                            <c:param name="itemImage" value="${item.itemImage}" />
                            <c:param name="price" value="${item.price}" />
                        </c:url>
                        <a href="${ItemUpdate}" class="btn btn-primary">Update</a>
                        
                        <c:url value="DeleteItem.jsp" var="ItemDelete">
                            <c:param name="itemNo" value="${item.itemNo}" />
                            <c:param name="itemName" value="${item.itemName}" />
                            <c:param name="description" value="${item.description}" />
                            <c:param name="itemImage" value="${item.itemImage}" />
                            <c:param name="price" value="${item.price}" />
                        </c:url>
                        <a href="${ItemDelete}" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<footer class="admin-footer">
    <p>&copy; 2024 Admin Dashboard. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
