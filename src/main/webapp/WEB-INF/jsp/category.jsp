<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/red/css/red.css">
</head>

<body id="body">
	<div class="container-fluid">
	<div class="row">
	<nav class="navbar fixed-top navbar-light bg-light">
		
		<div class="offset-2 col-8">
		<h1 class="img-thumbnail" align="center" style="margin-top: 5px;">MENU</h1>
		</div>
		<div class="offset-1 col-1">
		<div class="container">
			<a href="/menu/finish"><button type="button" class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 1px;padding-bottom: 5px; margin-top: 5px;" ><img src="/red/pic/Cart.PNG" alt="add" width="60"></button> 
			</a>
	
			<div class="box">
				<c:if test="${not empty count}">
					<p class="notify">${count}</p>
				</c:if>
			</div>
			<div class="box overlay"></div>
		</div>
	</div>
		
	</nav>
	</div>
		<p>	
		<div class="table" class="img-thumbnail">
			<c:forEach var="category" items="${categories}">
				<a href="/menu?id=${category.id}&name=${category.name}">
				
					<button class="btn btn-light" class="rounded" style="margin-top: 90px;">
						<div>
							<h1>${category.name}</h1>
							<br> <img src="/red/pic/${category.name}.PNG" class="flex" alt=" ${category.name}">
						</div>
					</button>
				</p>
				</a>
				<br>
			</c:forEach>

		</div>
	</div>
</body>
</html>