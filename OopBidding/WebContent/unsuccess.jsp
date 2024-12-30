<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unsuccessful Payment</title>
    <style>
        body {
            background-color: #f4f4f4; /* Light grey background */
            font-family: 'Roboto', sans-serif; /* Modern font */
            color: #333; 
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .menubar {
            background-color: #343a40; /* Dark gray background */
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menubar h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 500;
        }

        .menubar ul {
            list-style: none;
            padding: 0;
            display: flex;
        }

        .menubar li {
            margin: 0 15px;
        }

        .menubar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s;
        }

        .menubar a:hover {
            color: #007BFF; /* Highlight on hover */
        }

        .contt {
            background-color: rgba(240, 245, 245, 0.9); 
            width: 90%;
            max-width: 700px; /* Max width for larger screens */
            border: 15px solid #FF6347; /* Red color for unsuccessful feedback */
            padding: 20px;
            border-radius: 8px; 
            margin: 50px auto; 
            text-align: center; 
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); 
        }

        input[type="submit"] {
            background-color: #FF6347; /* Red color for the submit button */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 16px; 
            width: 100%; /* Full width button */
        }

        input[type="submit"]:hover {
            background-color: #FF4500; /* Darker red on hover */
            transform: translateY(-2px); /* Lift effect */
        }

        footer {
            background-color: #343a40; /* Dark gray footer */
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: auto; /* Pushes footer to the bottom */
        }

        footer .footer-container {
            display: flex;
            justify-content: space-between;
            max-width: 1170px;
            margin: 0 auto;
            flex-wrap: wrap;
        }

        footer .col {
            flex: 1;
            margin: 0 15px;
            min-width: 200px;
        }

        footer h2 {
            margin-bottom: 10px;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="menubar">
        <div class="leftmenu">
            <h1 class="text">BILLING MANAGEMENT</h1>
        </div>
        <ul>
            <li style="font-size:20px"><a href="home.jsp">Home</a></li>
            <li style="font-size:20px"><a href="about.jsp">About Us</a></li>
            <li style="font-size:20px"><a href="services.jsp">Services</a></li>
            <li style="font-size:20px"><a href="contactus.jsp">Contact Us</a></li>
        </ul>
    </div>
    
    <div class="contt">
        <form action="backtoinsert" method="post">
            <h1>Something went wrong.</h1>
            <h3>The process wasn't successful.<br></h3>
            <input type="submit" name="backbtn" value="Go back to Payment Insert Form">
        </form>
    </div>
    
    <footer>
        <div class="footer-container">
            <div class="col">
                <h2>About Us</h2>
            </div>
            <div class="col">
                <h2>Find Us</h2>
                <p>Facebook: <br>Instagram: <br>Email: support@qwert.com</p>
            </div>
            <div class="col">
                <h2>Location</h2>
                <p>No 14<br>Malabe.</p>
            </div>
            <div class="col">
                <h2>Hotline</h2>
                <p>+94 123 123 123<br>+94 456 456 456</p>
            </div>
        </div>
    </footer>
</body>
</html>
