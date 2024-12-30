<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/stylelogin.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
      <form action="login" method="post">
         <h1>Login</h1>
         <div class="input-box">
            <input type="email" placeholder="Email" name="name" required>
            <i class='bx bxs-user'></i>
         </div>
         <div class="input-box">
            <input type="password" placeholder="Password" name="password" required>
            <i class='bx bxs-lock-alt' ></i>
         </div>
         <div class="remember-forget">
            <label><input type="checkbox" name="" id="">Remember Me</label>
            <a href="">Forget Password?</a>
         </div>
         <button type="submit" class="btn">Login</button>
         <div class="register-link">
            <p>Don't have an account?
            <a href="register.jsp">Register</a>
         </p>
         </div>
      </form>
   </div>
</body>
</html>