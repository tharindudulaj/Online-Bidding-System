<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Record</title>
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

        .formcontent {
            margin: 30px auto;
            width: 90%;
            max-width: 600px;
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h1.capitalize {
            text-align: center;
            margin: 20px 0;
            color: #007BFF; /* Blue heading */
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box; /* Include padding in width */
        }

        input[type="submit"] {
            background-color: #dc3545; /* Red button for deletion */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            width: 100%; /* Full width button */
        }

        input[type="submit"]:hover {
            background-color: #c82333; /* Darker red on hover */
            transform: translateY(-2px); /* Lift effect */
        }

        footer {
            background-color: #343a40; /* Dark gray footer */
            color: white;
            padding: 30px;
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
            <h1 class="text">SPARE PARTS</h1>
        </div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="About.jsp">About Us</a></li>
            <li><a href="services.jsp">Services</a></li>
            <li><a href="contactus.jsp">Contact Us</a></li>
        </ul>
    </div>

    <!-- Get the details passed from parameter from the URL of the paymentaccount.jsp page -->
    <%
        String propertyname = request.getParameter("propertyname");
        String paymentid = request.getParameter("paymentid");
        String name = request.getParameter("name");
        String cardno = request.getParameter("cardno");
        String cardexpdate = request.getParameter("cardexpdate");
        String cvc = request.getParameter("cvc");
    %>
    <div class="formcontent">
        <h1 align="center" class="capitalize">Delete the Record</h1> 
        
        <form action="delete" method="post">
            <label>Card Name:</label>
            <input type="text" name="propertyname" value="<%= propertyname %>" class="idper" required>

            <label>Card ID:</label> 
            <input type="text" class="idper" name="paymentid" value="<%= paymentid %>" readonly>

            <label>Customer's Name:</label>
            <input type="text" name="name" value="<%= name %>" class="idper" required>

            <label>Card Number:</label>
            <input type="text" name="cardno" value="<%= cardno %>" class="idper" required>

            <label>Card Expire Date:</label>
            <input type="text" name="cardexpdate" value="<%= cardexpdate %>" class="idper" required>

            <label>CVC:</label>
            <input type="text" name="cvc" value="<%= cvc %>" class="idper" required>
            <br>

            <input type="submit" name="submit" value="Delete The Data">
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
