<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
</head>
<body>
<table style= "text-align: center" >
		<tr>
			<td>id</td>
			<td> Name</td>			
		</tr>
		<c:forEach var="category" items="${categories}">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				<td>
				<figure>
					<img src="/red/pic/${category.name}.PNG" alt=" ${category.name}" width="20">
				</figure>
				</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>