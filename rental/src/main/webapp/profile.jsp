<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Arial', sans-serif;
        }
        .profile-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
            color: #555;
        }
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        .btn-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 15px;
            border-radius: 6px;
        }
        .btn-update {
            background-color: #28a745;
            color: #fff;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h1>User Profile</h1>

        <c:set var="cus" value="${customer}" />
        <fieldset disabled>
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${cus.name}">
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="text" class="form-control" id="age" name="age" value="${cus.age}">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="${cus.email}">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="${cus.password}">
            </div>
        </fieldset>

        <div class="btn-container">
            <!-- Update Form -->
            <form action="update.jsp" method="post">
                <input type="hidden" name="name" value="${cus.name}">
                <input type="hidden" name="age" value="${cus.age}">
                <input type="hidden" name="email" value="${cus.email}">
                <input type="hidden" name="password" value="${cus.password}">
                <button type="submit" class="btn btn-update">Update</button>
            </form>

            <!-- Delete Form -->
            <form action="deleteCustomer" method="post">
                <input type="hidden" name="email" value="${cus.email}">
                <button type="submit" class="btn btn-delete">Delete</button>
            </form>
        </div>
    </div>

    <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
