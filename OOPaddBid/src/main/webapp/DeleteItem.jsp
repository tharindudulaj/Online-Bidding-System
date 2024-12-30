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
            background-color: #f4f6f9;
        }

        /* Header Styling */
        .admin-nav {
            background-color: #003366;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-nav .logo img {
            height: 50px;
        }

        .admin-nav h1 {
            font-size: 2em;
            margin: 0;
        }

        .logout {
            background-color: #007bff;
            padding: 10px 20px;
            color: white;
            border-radius: 8px;
            text-decoration: none;
        }

        .logout:hover {
            background-color: #0056b3;
        }

        /* Container */
        .container {
            background-color: white;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
        }

        .item-image img {
            max-width: 300px;
            margin-top: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        /* Submit button styling */
        .submit-btn {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        /* Footer Styling */
        .admin-footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .admin-footer p {
            margin: 0;
        }
    </style>
</head>

<body>

<!-- Header -->
<nav class="admin-nav">
    <div class="logo">
        <img src="./images/logo.png" alt="Admin Logo">
    </div>
    <h1>Admin Dashboard</h1>
    <a href="#" class="logout">Logout</a>
</nav>
   <%
		String itemNo = request.getParameter("itemNo");
		String itemName = request.getParameter("itemName");
		String description = request.getParameter("description");
		String itemImage = request.getParameter("itemImage");
		String price = request.getParameter("price");
	%>
<!-- Main Content: Delete Bid Form -->
<div class="container">
    <h2>Delete Bid</h2>
    <form class="add-items-form" action="delete" method="post" id="items_form">
        <fieldset>
            <div class="form-group">
                <label for="itemNo">Bid Number</label>
                <input name="itemNo" id="itemNo" class="form-control" type="text" value="<%=itemNo%>" readonly>
            </div>

            <div class="form-group">
                <label for="itemName">Bid Name</label>
                <input name="itemName" id="itemName" class="form-control" type="text" value="<%=itemName%>" readonly>
            </div>

            <div class="form-group">
                <label for="description">Bid Description</label>
                <input name="description" id="description" class="form-control" type="text" value="<%=description%>" readonly>
            </div>

            <div class="form-group">
                <label for="itemImage">Bid Image</label>
                <% if (itemImage != null && !itemImage.isEmpty()) { %>
                    <img src="<%=itemImage%>" alt="Current Bid Image" class="item-image">
                <% } %>
            </div>

            <div class="form-group">
                <label for="price">Bid Starting Price</label>
                <input name="price" id="price" class="form-control" type="text" value="<%=price%>" readonly>
            </div>

            <div class="form-group submit-btn">
                <button type="button" class="btn btn-secondary" onclick="history.back();">Back</button>
                <button type="submit" class="btn btn-danger" id="deleteButton">Delete Item</button>
            </div>
        </fieldset>
    </form>
</div>

<!-- Footer -->
<footer class="admin-footer">
    <p>&copy; 2024 Admin Panel. All Rights Reserved.</p>
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const deleteButton = document.getElementById("deleteButton");

        deleteButton.addEventListener("click", function(event) {
            const confirmation = confirm("Do you really want to delete this item?");
            if (!confirmation) {
                event.preventDefault(); // Prevent form submission if user cancels
            }
        });
    });
</script>

</body>
</html>
