
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update</title>
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

        /* Container Styling */
        .container {
            margin-top: 80px;
            max-width: 800px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color: #fff;
        }

        .card h1 {
            color: #4a90e2;
            margin-bottom: 20px;
        }

        /* Form Styles */
        .form-group label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #4a90e2;
            box-shadow: none;
        }

        .btn-custom {
            background-color: #4a90e2;
            border-color: #4a90e2;
            color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #357abd;
            border-color: #357abd;
        }


/* Footer Styling */
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
    <%-- Value Passing --%>
    <%
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String title = request.getParameter("title");
        String inquiry = request.getParameter("inquiry");
    %>
    
   
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
<br><br><br><br>
    <!-- Inquiry Update Form Container -->
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h1 class="text-center">Inquiry Update Form</h1>
                <form action="updateInq" method="post" class="mt-4">
                    <!-- Dropdown Selection -->
                    <div class="form-group">
                        <label for="dropdown">Select Inquiry type:</label>
                        <select id="dropdown" class="form-control" name="type" required>
                            <option value="" disabled>Select Inquiry type</option>
                            <option value="Normal Inquiry" <%= "Normal Inquiry".equals(type) ? "selected" : "" %>>Normal Inquiry</option>
                            <option value="Urgent Inquiry" <%= "Urgent Inquiry".equals(type) ? "selected" : "" %>>Urgent Inquiry</option>
                            <option value="Complain" <%= "Complain".equals(type) ? "selected" : "" %>>Complain</option>
                        </select>
                    </div>


<!-- Input Fields -->
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                    </div>
                    <div class="form-group">
                        <label for="nic">NIC</label>
                        <input type="text" class="form-control" id="nic" name="nic" value="<%= nic %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%= title %>" required>
                    </div>
                    <div class="form-group">
                        <label for="inquiry">Inquiry</label>
                        <input type="text" class="form-control" id="inquiry" name="inquiry" value="<%= inquiry %>" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-custom">Update Inquiry</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

   <footer class="footer">
    <p>&copy; 2024 TEMU BIDDING. All rights reserved.</p>
</footer>
</body>
</html>