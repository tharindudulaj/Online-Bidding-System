<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Inquiries</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: #f9f9f9;
        }
        .container {
            margin-top: 50px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">All Inquiries</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Type</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>NIC</th>
                <th>Title</th>
                <th>Inquiry</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.type}</td>
                    <td>${inquiry.name}</td>
                    <td>${inquiry.phone}</td>
                    <td>${inquiry.email}</td>
                    <td>${inquiry.nic}</td>
                    <td>${inquiry.title}</td>
                    <td>${inquiry.inquiry}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2024 TEMU BIDDING. All rights reserved.</p>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
