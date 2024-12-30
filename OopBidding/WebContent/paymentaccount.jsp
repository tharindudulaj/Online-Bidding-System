<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Update</title>
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

        hr {
            border: 1px solid #007BFF;
            margin: 20px 0;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF; /* Blue for table header */
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1; /* Light grey on row hover */
        }

        input[type="button"] {
            background-color: #007BFF; /* Blue button */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="button"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
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
            <h1 class="text">BILLING MANAGEMENT</h1>
        </div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="services.jsp">Services</a></li>
            <li><a href="contactus.jsp">Contact Us</a></li>
        </ul>
    </div>

    <center>
        <table>
            <tr>
                <th>Card Name</th>
                <th>Card ID</th>
                <th>Customer Name</th>
                <th>Card Number</th>
                <th>Card Expiry Date</th>
                <th>CVC</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>	

            <c:forEach var="payment" items="${paydetails}">
                <tr>
                    <td>${payment.propertyname}</td>
                    <td>${payment.paymentid}</td>
                    <td>${payment.name}</td>
                    <td>${payment.cardno}</td>
                    <td>${payment.cardexpdate}</td>
                    <td>${payment.cvc}</td>
                    <td>
                        <c:url value="updatepayment.jsp" var="payupdate">
                            <c:param name="propertyname" value="${payment.propertyname}"/>
                            <c:param name="paymentid" value="${payment.paymentid}"/>
                            <c:param name="name" value="${payment.name}"/>
                            <c:param name="cardno" value="${payment.cardno}"/>
                            <c:param name="cardexpdate" value="${payment.cardexpdate}"/>
                            <c:param name="cvc" value="${payment.cvc}"/>
                        </c:url>
                        <a href="${payupdate}">
                            <input type="button" name="update" value="Update Details">
                        </a>
                    </td>
                    <td>
                        <c:url value="deletepayment.jsp" var="paydelete">
                            <c:param name="propertyname" value="${payment.propertyname}"/>
                            <c:param name="paymentid" value="${payment.paymentid}"/>
                            <c:param name="name" value="${payment.name}"/>
                            <c:param name="cardno" value="${payment.cardno}"/>
                            <c:param name="cardexpdate" value="${payment.cardexpdate}"/>
                            <c:param name="cvc" value="${payment.cvc}"/>
                        </c:url>
                        <a href="${paydelete}">
                            <input type="button" name="delete" value="Delete Details">
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>

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
