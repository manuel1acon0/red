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
<body id="body">
<div class="container-fluid">
<div class="row">
		<div class="offset-1 col-10">
		<h1 class="img-thumbnail" align="center" style="margin-top: 5px;">ORDINE</h1>
		</div>
		</div>


<table class="table table-striped table-hover" style="text-align: center" >
		<tr id=row>
			
			<td><h3>Prodotto</h3></td>
			<td><h3>Prezzo</h3></td>
			<td><h3 style="padding-left: 60px;">Quantità</h3></td>
		</tr>
		<c:forEach var="order" items="${orders}">
			<tr>
				<td style="padding-top: 15px">${order.name}</td>
				<td style="padding-top: 15px">€ ${order.price}</td>	
				
				<td>
				<div class="row">
				<div class="offset-4 col-1"><button type="button" class="btn btn-dark"><img src="/red/pic/piu.png" alt="add" width="15"></button></div>
				<div class="offset-1 col-1" style="padding-top: 8px">${order.quantity}</div>
				<div class="offset-1 col-1"><button type="button" class="btn btn-dark"><img src="/red/pic/meno.png" alt="remove" width="15"></button></div>
				</div>
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