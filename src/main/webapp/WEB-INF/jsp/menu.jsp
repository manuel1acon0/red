<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/red/css/red.css">
<title>Details</title>
</head>

<body id="body">
	<div class="container-fluid">
	<a href="/menu/finish"><button type="button" class="btn btn-dark"  >finish</button> 
	</a>
	
		<div class="table">
			<c:forEach var="detail" items="${details}">
						<div>
							<br> <img src="/red/pic/${detail.name}.PNG"
								alt=" ${detail.name}" width="800px">
								<h3>${detail.name}</h3>
					<h3 id="description" style="padding-left: 20px;">${detail.description}</h3>
					<h3 id="description" style="padding-left: 20px;">€ ${detail.price}</h3>
					<a href="/menu/add?id=${detail.id}&categoryId=${detail.categoryId}">
					
<!-- 					<form action="/menu/add"> -->
<%-- 					<input name= "id" value="${detail.id}" type="hidden"> --%>
<%-- 					<input name= "categoryId" value="${detail.categoryId}" type="hidden"> --%>
					<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;">+</button>
<!-- 					<img src="/red/pic/AddIcon.PNG" alt="add" width="30"> -->
<!-- 					</form> -->
					</a>
						</div>
				<br>
			</c:forEach>
		</div>
	</div>
	
	


	
</body>
</html>