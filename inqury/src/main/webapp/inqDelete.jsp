<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Inquiry</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-color: #f9f9f9;
            padding-top: 60px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
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

        .nav-links a:hover {
            color: orange;
        }

        /* Burger Menu for Mobile */
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

        /* Container Styling */
        .container {
            margin-top: 20px;
            max-width: 600px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color: #fff;
        }

        .inputs p {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .inputs input, .inputs textarea {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 10px;
            width: 100%;
            display: inline-block;
            color: #333;
            cursor: not-allowed;
            resize: none;
        }

        /* Button Styling */
        .btn-custom {
            background-color: #e74c3c;
            border-color: #e74c3c;
            color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #c0392b;
            border-color: #c0392b;
        }

        /* Footer Styling */
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .burger {
                display: block;
            }

            .container {
                padding: 0 15px;
            }
        }
    </style>
</head>
<body>

<header>
    <nav>
        <div class="logo">TEMU BIDDING</div>
        <ul class="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
        <div class="burger">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </nav>
</header>

<div class="container">
    <div class="card">
        <h2>Inquiry Form Details</h2>
        <form action="deleteInq" method="post">
            <!-- Retrieve values from the previous page and display them in the form -->
            <% 
            String name = request.getParameter("name") != null ? request.getParameter("name") : "N/A";
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String nic = request.getParameter("nic");
            String title = request.getParameter("title");
            String inquiry = request.getParameter("inquiry");
            %>
            
            <div class="inputs">
                <p>Full Name</p>
                <input type="text" name="name" value="<%= name %>" readonly aria-label="Full Name">
            </div>
            <div class="inputs">
                <p>Phone</p>
                <input type="text" name="phone" value="<%= phone %>" readonly aria-label="Phone Number">
            </div>
            <div class="inputs">
                <p>Email</p>
                <input type="email" name="email" value="<%= email %>" readonly aria-label="Email">
            </div>
            <div class="inputs">
                <p>NIC</p>
                <input type="text" name="nic" value="<%= nic %>" readonly aria-label="NIC">
            </div>
            <div class="inputs">
                <p>Title</p>
                <input type="text" name="title" value="<%= title %>" readonly aria-label="Inquiry Title">
            </div>
            <div class="inputs">
                <p>Inquiry</p>
                <textarea name="inquiry" rows="4" readonly aria-label="Inquiry Details"><%= inquiry %></textarea>
            </div>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-custom" onclick="return confirm('Are you sure you want to delete this inquiry?');">Delete Inquiry</button>
            </div>
        </form>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2024 TEMU BIDDING. All rights reserved.</p>
</footer>

</body>
</html>
