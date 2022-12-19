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
		<h1 class="title">MENU</h1>
		<div class="table">
			<c:forEach var="category" items="${categories}">
				<a href="/menu?id=${category.id}">
				<p>
					<button>
						<div>
							<h1>${category.name}</h1>
							<br> <img src="/red/pic/${category.name}.PNG"
								alt=" ${category.name}" width="800px">
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