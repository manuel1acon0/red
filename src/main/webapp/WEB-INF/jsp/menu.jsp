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

 <div class="row">

	<div class="col-2 offset-2">
<a href="/red"><button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;" > Categories </button> 
	</a>
		
		
		</div>
	
	<div class="col-2">
	<a href="/menu/finish"><button type="button" class="btn btn-dark" style="padding-right: 20px;padding-left: 20px;padding-top: 10px;padding-bottom: 10px;" ><img src="/red/pic/Cart.PNG" alt="add" width="30"></button> 
		</a>
	</div>
	</div>
	
	<c:if test="${not empty count}">
	<p> hai selezionato ${count} prodotti </p>
	</c:if>
		<div class="table">
			<c:forEach var="detail" items="${details}">
						<div>
							<br> <img src="/red/pic/${detail.name}.PNG"
								alt=" ${detail.name}" width="800px">
								<h3>${detail.name}</h3>
					<h3 id="description" style="padding-left: 20px;">${detail.description}</h3>
					<h3 id="description" style="padding-left: 20px;">€ ${detail.price}</h3>
					<a href="/menu/add?id=${detail.id}&categoryId=${detail.categoryId}">
					

					<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;">+</button>

					</a>
					<a href="/menu/remove?id=${detail.id}&categoryId=${detail.categoryId}">
					

					<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;">-</button>

					</a>
						</div>
				<br>
			</c:forEach>
		</div>
		
	
	</div>
	
	


	
</body>
</html>