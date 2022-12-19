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
<title>Details</title>
</head>

<body id="body">
<div class="container-fluid">

 	<div class="row">
	<div class="col-1">
		<a href="/red?count=${count}"><button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px; margin-top: 10px;" > Categories </button> 
		</a>
	</div>
	<div class="offset-10 col-1">
		<a href="/menu/finish"><button type="button" class="btn btn-dark" style="padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px; margin-top: 10px;" ><img src="/red/pic/Cart.PNG" alt="add" width="30"></button> 
		</a>
	</div>
	</div>
	
	<c:if test="${not empty count}">
	<p> hai selezionato ${count} prodotti </p>
	</c:if>
		<div class="table">
			<c:forEach var="detail" items="${details}">
				<p>
					<div class="img-thumbnail">
					<div class="row">
					<div class="offset-2 col-4">
						<h3>${detail.name}</h3>
					</div>
					<div class="col-6">
						<h3 style="padding-left: 20px;">€ ${detail.price}</h3>
					</div>
					</div>
					<div class="row">
					<div class="offset-2 col-4">
						<h6 id="description" style="padding-left: 20px;">${detail.description}</h6>
					</div>
					</div>
					<div class="row">
					<div class="offset-3 col-6">
							<img src="/red/pic/${detail.name}.PNG" alt=" ${detail.name}" width="800px">
					</div>
					</div>
						<br>
					<div class="row">
					<div class="offset-2 col-4">
						<a href="/menu/add?id=${detail.id}&categoryId=${detail.categoryId}">
						<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/piu.png" alt="add" width="30"></button>
						</a>
					</div>
					<div class="col-6">
						<a href="/menu/remove?id=${detail.id}&categoryId=${detail.categoryId}">
						<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/meno.png" alt="remove" width="30"></button>
						</a>
					</div>
					</div>
					</div>
					
				</p>		
			</c:forEach>
		</div>
		</div>	
</body>
</html>