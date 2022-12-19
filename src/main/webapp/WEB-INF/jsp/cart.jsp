<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/red/css/red.css">
<title>Cart</title>
</head>
<body>
<h1>Cart</h1>
<div class="container-fluid">
<table class="table table-striped table-hover" style="text-align: center" >
		<tr>
			
			<td>Name</td>
			<td>Price</td>
			<td>Quantity</td>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.name}</td>
				<td>${item.price}</td>	
				
				<td>
<!-- 				<div>-</div> -->
				<div>X</div>
<!-- 				<div>+</div> -->
				</td>
					
			</tr>
		</c:forEach>
		
	</table>
	</div>
	<p>Totale ordine: ${sum}</p>
	<a href="/menu/removeAll">
					

					<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;">Svuota</button>

					</a>
	
	
</body>
</html>