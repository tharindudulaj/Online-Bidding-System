<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Age</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="cus" items="${customer}">
  		<tr>
  			<td>${cus.name}</td>
  			<td>${cus.age}</td>
  			<td>${cus.email}</td>
  			<td>${cus.password}</td>
  			<td>
  			<form action="singleDataButton" method="post">
  			<input type="hidden" name="email" value="${cus.email}">
  			<button type="submit">Data</button>
  			</form>
  			</td>
  			<td>
  			<form action="deleteCustomer" method="post">
  			<input type="hidden" name="email" value="${cus.email}"> 
  			<button type="submit">Delete</button>
  			</form>
  			</td>
  		</tr>
  	</c:forEach>
  </tbody>
</table>
</body>
</html>