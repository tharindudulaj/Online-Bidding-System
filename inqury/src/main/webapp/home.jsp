<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/all.min.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100vh;
            margin: 0;
            background-image: url('images/accc.webp'); /* Add your image path here */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        header, footer {
            background-color: transparent; /* Fully transparent background */
            padding: 10px;
            text-align: center;
            width: 100%;
        }

        .btn-container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <header>
        <h1>Welcome to Our Inquiry System</h1>
    </header>

    <div class="btn-container">
        <a href="inqInsert.jsp" class="btn">Inquiry</a>
        <a href="viewAllInquiries" class="btn">View Inquiry</a>
    </div>

    <footer>
        <p>&copy; 2024 TEMU BIDDING. All Rights Reserved.</p>
    </footer>

</body>
</html>
