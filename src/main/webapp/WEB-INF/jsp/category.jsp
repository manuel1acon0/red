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
	
<%-- 	<c:if test="${not empty count}"> --%>
<%-- 	<p> hai selezionato ${count} prodotti </p> --%>
<%-- 	</c:if> --%>
		<div class="row">
		<div class="offset-1 col-10">
		<h1 class="img-thumbnail" align="center" style="margin-top: 5px;">MENU</h1>
		</div>
		</div>
		<p>	
		<div class="table" class="img-thumbnail">
			<c:forEach var="category" items="${categories}">
				<a href="/menu?id=${category.id}">
				
					<button class="btn btn-light" class="rounded">
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