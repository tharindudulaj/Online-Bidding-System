<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Ubuntu', sans-serif;
            background-image: url('adminbg2.jpg');
            background-size: cover;
            background-color: whitesmoke;
        }

        /* Navigation Bar */
        .admin-nav {
            background-color: rgb(0, 0, 67);
            padding: 10px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .admin-nav h1 {
            color: white;
            margin: 0;
        }

        .logo img {
            height: 40px;
        }

        .logout {
            color: white;
            padding: 10px 20px;
            background-color: rgb(28, 28, 75);
            border-radius: 10px;
            text-decoration: none;
        }

        /* Main Buttons Section */
        .buttons {
            display: flex;
            justify-content: center;
            margin-top: 100px;
        }

        .manage_bids {
            display: inline-block;
            border: 2px solid rgb(0, 0, 67);
            border-radius: 10px;
            background-color: white;
            padding: 20px;
            margin: 0 20px;
            text-align: center;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .manage_bids:hover {
            background-color: rgb(208, 208, 248);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .manage_bids img {
            display: block;
            margin: 0 auto 10px;
            height: 120px;
        }

        .manage_bids h1 {
            color: black;
            font-size: 1.2em;
            margin: 0;
        }

        .manage-bid-link {
            text-decoration: none;
            color: inherit;
        }

        /* Footer Section */
        .footer {
            background-color: rgb(0, 0, 67);
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <nav>
        <div class="admin-nav">
            <div class="logo">
                <img src="./images/logo.png" alt="Logo">
            </div>
            <h1>Admin Dashboard</h1>
            <a href="#" class="logout">Logout</a>
        </div>
    </nav>

    <!-- Main Content: Buttons -->
    <div class="buttons">
        <div class="manage_bids">
            <a href="./add-items-form.jsp" class="manage-bid-link">
                <img src="./biddd.png" alt="Add Bids">
                <h1>Add Bid</h1>
            </a>
        </div>

        <div class="manage_bids">
            <a href="./AdminViewServlet" class="manage-bid-link">
                <img src="./bidding.png" alt="Manage Bids">
                <h1>Manage Bids</h1>
            </a>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Admin Panel. All Rights Reserved.</p>
    </div>

</body>
</html>
