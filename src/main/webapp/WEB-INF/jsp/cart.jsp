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
<div class="container-fluid">
<h1>CART</h1>

<table class="table table-striped table-hover" style="text-align: center" >
		<tr id=row>
			
			<td><h3>Name</h3></td>
			<td><h3>Price</h3></td>
			<td><h3>Quantity</h3></td>
		</tr>
		<c:forEach var="order" items="${orders}">
			<tr>
				<td>${order.name}</td>
				<td>€ ${order.price}</td>	
				
				<td>
<!-- 				<div>-</div> -->
				<div>${order.quantity}</div>
<!-- 				<div>+</div> -->
				</td>
					
			</tr>
		</c:forEach>
		
	</table>
	
	<p>Totale ordine: € ${sum}</p>
	<a href="/menu/removeAll">
					

					<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;">Svuota</button>

					</a>
	
	</div>
</body>
</html>