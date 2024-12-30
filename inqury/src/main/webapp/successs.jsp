
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: #f9f9f9;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
        }

        /* Header */
        header {
            background-color: #2c3e50;
            color: #fff;
            padding: 10px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            list-style-type: none;
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }
        .nav-links a:hover{
          color:  orange;
        }

        .burger {
            display: none;
            cursor: pointer;
        }

        .burger div {
            width: 25px;
            height: 3px;
            background-color: white;
            margin: 5px;
        }


        .container {
            margin-top: 50px;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            bottom: 0;
            width: 100%;
            position: fixed;
        }

        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Navbar Section -->
    <header>
        <nav>
            <div class="logo">GAME NEXUS</div>
            <ul class="nav-links">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="paymentinsert.jsp">Payment</a></li>
                <li><a href="customerinsert.jsp">Offer</a></li>
                <li><a href="add-items-form.jsp">Categary</a></li>
                <li><a href="InqInsert.jsp">Inquiry</a></li>
                <li><a href="login.jsp">Log in</a></li>
            </ul>
            <div class="burger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
        </nav>
    </header>

<!-- Main Container Section -->
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h2 class="text-center">Inquiry Details</h2>
                <table class="table table-bordered table-striped mt-4">
                    <thead class="thead-dark">
                        <tr>
                            <th>Field</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="inq" items="${inqDetails}">
                            <tr>
                                <td>Type</td>
                                <td>${inq.type}</td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td>${inq.name}</td>
                            </tr>
                            <tr>
                                <td>Phone</td>
                                <td>${inq.phone}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>${inq.email}</td>
                            </tr>
                            <tr>
                                <td>NIC</td>
                                <td>${inq.nic}</td>
                            </tr>
                            <tr>
                                <td>Title</td>
                                <td>${inq.title}</td>
                            </tr>
                            <tr>
                                <td>Inquiry</td>
                                <td>${inq.inquiry}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <!-- Update Button -->
                                    <c:url value="inqUpdate.jsp" var="inqUpdate">
                                        <c:param name="type" value="${inq.type}"/>
                                        <c:param name="name" value="${inq.name}"/>
                                        <c:param name="phone" value="${inq.phone}"/>
                                        <c:param name="email" value="${inq.email}"/>
                                        <c:param name="nic" value="${inq.nic}"/>
                                        <c:param name="title" value="${inq.title}"/>
                                        <c:param name="inquiry" value="${inq.inquiry}"/>
                                    </c:url>
                                    <a href="${inqUpdate}" class="btn btn-custom mx-2">Update Inquiry</a>

                                    <!-- Delete Button -->
                                    <c:url value="inqDelete.jsp" var="inqDelete">
                                        <c:param name="type" value="${inq.type}"/>
                                        <c:param name="name" value="${inq.name}"/>
                                        <c:param name="phone" value="${inq.phone}"/>
                                        <c:param name="email" value="${inq.email}"/>
                                        <c:param name="nic" value="${inq.nic}"/>
                                        <c:param name="title" value="${inq.title}"/>
                                        <c:param name="inquiry" value="${inq.inquiry}"/>
                                    </c:url>
                                    <a href="${inqDelete}" class="btn btn-danger mx-2">Delete Inquiry</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
    &copy; 2024 GAME NEXUS. All rights reserved.
</div>

<!-- Bootstrap JS CDN and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>