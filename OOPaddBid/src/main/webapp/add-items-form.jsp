<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f9;
    }

    .admin-nav {
        background-color: #343a40;
        padding: 10px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .admin-nav h1 {
        color: #fff;
        margin: 0;
    }

    .logo img {
        height: 40px;
    }

    .logout {
        color: #fff;
        padding: 8px 15px;
        background-color: #007bff;
        border-radius: 5px;
        text-decoration: none;
    }

    .container {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        margin-top: 50px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    fieldset {
        border: 1px solid #ddd;
        padding: 20px;
    }

    legend {
        font-size: 1.5em;
        padding: 0 10px;
        color: #343a40;
        font-weight: bold;
    }

    .form-group label {
        font-weight: bold;
    }

    .form-control, .form-control-file {
        border-radius: 5px;
    }

    button.btn {
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 5px;
    }

    button.upload {
        background-color: #28a745;
        border: none;
    }

    button.upload:hover {
        background-color: #218838;
    }

    button.btn-secondary {
        background-color: #6c757d;
        border: none;
    }

    button.btn-secondary:hover {
        background-color: #5a6268;
    }

    /* Footer Styling */
    .footer {
        background-color: #343a40;
        color: white;
        text-align: center;
        padding: 15px 0;
        bottom: 0;
        width: 100%;
    }

    .footer p {
        margin: 0;
    }
</style>
</head>
<body>

<!-- Header / Navbar -->
<nav>
    <div class="admin-nav">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
        <h1 class="title">Admin Dashboard</h1>
        <a href="#" class="logout">Logout</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <form class="add-items-form" action="insert" method="post" id="items_form" enctype="multipart/form-data">

        <fieldset>
            <legend>Add Bids</legend>

            <!-- Item Name input -->
            <div class="form-group">
                <label for="itemName">Bid Name</label>
                <input type="text" name="itemName" class="form-control" id="itemName" placeholder="Item Name" required>
                <span id="itemNameError" class="text-danger"></span>
            </div>

            <!-- Description input -->
            <div class="form-group">
                <label for="description">Bid Description</label>
                <input type="text" name="description" class="form-control" id="description" placeholder="Description" required>
                <span id="descriptionError" class="text-danger"></span>
            </div>

            <!-- Image input -->
            <div class="form-group">
                <label for="itemImage">Bid Image</label>
                <input type="file" name="itemImage" id="itemImage" class="form-control-file" accept="image/jpeg, image/png, image/jpg">
            </div>

            <!-- Image preview -->
            <img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; display: none;">

            <!-- Price input -->
            <div class="form-group">
                <label for="price">Bid starting Price</label>
                <input type="number" name="price" class="form-control" id="price" placeholder="Price" required min="0.01" step="0.01">
                <span id="priceError" class="text-danger"></span>
            </div>

            <!-- Buttons -->
            <div class="form-group">
                <button type="button" class="btn btn-secondary" onclick="history.back();">Back</button>
                <button type="submit" class="btn btn-primary upload">Submit</button>
            </div>
        </fieldset>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 Admin Panel. All Rights Reserved.</p>
</div>

<!-- Image Preview JavaScript -->
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

</body>
</html>
