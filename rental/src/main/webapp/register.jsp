<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/style.css">
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
<div class="registration-form">
            <h1>Registration Form</h1>
            <form action="addCustomer" method="post">
                <p>Full Name</p>
                <input type="text" name="name" id="fullName" placeholder="Full Name">
                <p>Age</p>
                <input type="text" name="age" id="userName" placeholder="Age">
                <p>Email</p>
                <input type="email" name="email" id="email" placeholder="Email">
                <p>Password</p>
                <input type="password" name="password" id="password" placeholder="Password">
                <button type="submit">Registration</button>
            </form>
        </div>
</body>
</html>