<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
<h1>Cart</h1>
<table style= "text-align: center" >
		<tr>
			
			<td>Name</td>
			<td>Price</td>
			
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.name}</td>
				<td>${item.price}</td>				
			</tr>
		</c:forEach>
	</table>
<%-- 	<p>${sum}</p> --%>
	
</body>
</html>