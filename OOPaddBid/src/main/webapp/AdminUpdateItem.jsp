<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
        }

        html {
            display: contents;
            font-family: 'Ubuntu', sans-serif;
            background-image: url('adminbg2.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }

        .admin-nav {
            background-color: rgb(0, 0, 67);
            padding: 4px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between; /* Center horizontally */
        }

        h1, h3 {
            color: white;
        }

        .title {
            font-size: 2em;
            margin: 0.125em 0;
        }

        .logout {
            margin: 0.75em 0;
            margin-right: 40px;
            background-color: rgb(28, 28, 75);
            padding: 8px 12px;
            border-radius: 12px;
            color: white; /* Ensure text is visible */
        }

        .logo {
            margin-left: 30px;
        }

        .container {
            margin-top: 50px;
        }

        .item-image {
            margin-top: 15px;
        }

        .submit-btn {
            margin-top: 20px;
        }

        /* New styles for the form */
        .add-items-form {
            background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent white background */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }

        .form-group {
            margin-bottom: 15px; /* Spacing between form groups */
        }

        .form-control {
            border: 1px solid #ced4da; /* Border color */
            border-radius: 5px; /* Rounded borders */
            padding: 10px; /* Padding inside the input */
            transition: border-color 0.3s; /* Smooth transition for border color */
        }

        .form-control:focus {
            border-color: rgb(0, 0, 67); /* Change border color on focus */
            box-shadow: 0 0 5px rgba(0, 0, 67, 0.5); /* Add shadow on focus */
            outline: none; /* Remove outline */
        }

        .form-control-file {
            border: 1px solid #ced4da; /* Border color */
            border-radius: 5px; /* Rounded borders */
            padding: 10px; /* Padding inside the input */
        }

        .btn {
            width: 100%; /* Full-width buttons */
            padding: 10px; /* Button padding */
            border-radius: 5px; /* Rounded corners */
        }

        .btn-secondary {
            background-color: rgb(108, 117, 125); /* Secondary button color */
        }

        .btn-primary {
            background-color: rgb(0, 123, 255); /* Primary button color */
        }

        /* Ensure error messages are styled appropriately */
        .text-danger {
            font-size: 0.9em; /* Smaller font size for error messages */
            margin-top: 5px; /* Space above error messages */
        }
    </style>
</head>

<body>
    <div class="admin-nav">
        <div class="logo">
            <img class="logo" src="./images/logo.png" alt="profImage" height="40px">
        </div>
        <h1 class="title">Admin Dashboard</h1>
        <div class="nav-links">
            <h3 class="logout">Logout</h3>
        </div>
    </div>
    
    <%
        String itemNo = request.getParameter("itemNo");
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        String itemImage = request.getParameter("itemImage");
        String price = request.getParameter("price");
    %>
    
    <div class="container">
        <form class="add-items-form" action="update" method="post" id="items_form">
            <fieldset>
                <legend>Update Item</legend>

                <div class="form-group">
                    <label for="itemNo">Item Number</label>
                    <input name="itemNo" id="itemNo" class="form-control" type="text" value="<%=itemNo%>" readonly>
                </div>
                
                <div class="form-group">
                    <label for="itemName">Item Name</label>
                    <input name="itemName" id="itemName" class="form-control" type="text" value="<%=itemName%>">
                    <span id="itemNameError" class="text-danger"></span>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <input name="description" id="description" class="form-control" type="text" value="<%=description%>">
                    <span id="descriptionError" class="text-danger"></span>
                </div>
                
                <div class="form-group item-image">
                    <label for="itemImage">Image</label>
                    <input type="file" name="itemImage" id="itemImage" class="form-control-file" accept="image/jpeg, image/png, image/jpg">
                    <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; display: none;">
                    <span id="itemImageError" class="text-danger"></span>
                </div>
                
                <!-- JavaScript for itemImage -->
                <script>
                    var itemImageInput = document.getElementById("itemImage");
                    var selectedImage = document.getElementById("selectedImage");
                
                    itemImageInput.addEventListener("change", function () {
                        var file = itemImageInput.files[0];
                
                        if (file) {
                            var reader = new FileReader();
                
                            reader.onload = function (e) {
                                selectedImage.src = e.target.result;
                                selectedImage.style.display = "block";
                            };
                
                            reader.readAsDataURL(file);
                        } else {
                            selectedImage.style.display = "none";
                        }
                    });
                </script>
                
                <div class="form-group">
                    <label for="price">Price</label>
                    <input name="price" id="price" class="form-control" type="text" value="<%=price%>">
                    <span id="priceError" class="text-danger"></span>
                </div>
                
                <!-- JavaScript for form validation -->
                <script>
                    var form = document.getElementById("items_form");
                    var itemNameInput = document.getElementById("itemName");
                    var descriptionInput = document.getElementById("description");
                    var priceInput = document.getElementById("price");
                
                    form.addEventListener("submit", function (event) {
                        var isValid = true;
                
                        // Clear previous error messages
                        document.getElementById("itemNameError").textContent = "";
                        document.getElementById("descriptionError").textContent = "";
                        document.getElementById("itemImageError").textContent = "";
                        document.getElementById("priceError").textContent = "";
                
                        // Validate item name
                        if (itemNameInput.value.trim() === "") {
                            isValid = false;
                            document.getElementById("itemNameError").textContent = "Item name is required";
                        }
                
                        // Validate description
                        if (descriptionInput.value.trim() === "") {
                            isValid = false;
                            document.getElementById("descriptionError").textContent = "Description is required";
                        }
                
                        // Validate image (optional)
                        if (itemImageInput.files.length === 0) {
                            isValid = false;
                            document.getElementById("itemImageError").textContent = "Image is required";
                        }
                
                        // Validate price (numeric and positive)
                        var price = parseFloat(priceInput.value);
                        if (isNaN(price) || price <= 0) {
                            isValid = false;
                            document.getElementById("priceError").textContent = "Price must be a positive number";
                        }
                
                        if (!isValid) {
                            event.preventDefault(); // Prevent form submission if there are validation errors
                        }
                    });
                </script>

                <div class="form-group submit-btn">
                    
                    <button type="submit" class="btn btn-primary">Update My Data</button><br><br><br>
                    <button type="button" class="btn btn-secondary" onclick="history.back();">Back</button><br>
                </div>
            </fieldset>
        </form>
    </div>
    
</body>
</html>
