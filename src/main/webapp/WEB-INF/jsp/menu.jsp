<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Categories</title>
	<link rel="stylesheet" type="text/css" href="/red/css/red.css">
</head>

<body id="body">
	<div class="container-fluid" >
	
		<h1 class="title ">MENU</h1>
		
		<div class="table" >
		<c:forEach var="category" items="${categories}">
				<a href="/menu?id=${category.id}" >
					<button>
						<div >
							<h1>${category.name}</h1>
							<br>
							<img src="/red/pic/${category.name}.PNG" alt=" ${category.name}" width="80%" >
						</div>
					</button>
				</a>
			<br>
		</c:forEach>
		
		</div>
	</div>
</body>
</html>