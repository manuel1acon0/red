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
<nav class="navbar fixed-top navbar-light bg-light">

<!--   <a class="navbar-brand" href="#">Fixed top</a> -->
<!-- </nav> -->

 	
	<div class="col-1">
		<a href="/menu/home"><button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 20px;padding-bottom: 20px; margin-top: 5px;">Menu </button> 
<!-- 		<a href="/red"><button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 20px;padding-bottom: 20px; margin-top: 5px;"> Categorie </button>  -->
		</a>
		</div>
		<div class="offset-1 col-8">
			<h1 class="img-thumbnail" align="center" style="margin-top: 5px;">${name}</h1>
				
		</div>
	
	<div class="offset-1 col-1">
		<div class="container">
			
			
			
	<c:if test="${not empty count}">
	<a href="/menu/finish"><button type="button" class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 1px;padding-bottom: 5px; margin-top: 5px;" ><img src="/red/pic/Cart.PNG" alt="add" width="60"></button> 
			</a>
					
				</c:if>
				
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
	
	
		<div class="table">
			<c:forEach var="detail" items="${details}">
				<p>
					
					<div class="img-thumbnail" style="margin-left: 150px;margin-right: 150px;margin-top: 120px;">
					<div class="row">
					<div class="col-5">
						<h3>${detail.name}</h3>
					</div>
					<div class="offset-2 col-5">
						<h3 style="padding-left: 20px;">€ ${detail.price}</h3>
					</div>
					</div>
					<div class="row">
					<div class="col-5">
						<h6 id="description" style="padding-left: 20px;">${detail.description}</h6>
					</div>
					</div>
<!-- 					<div class="row"> -->
<!-- 					<div class="offset-2 col-6"> -->
							<img class="flex" src="/red/pic/${detail.name}.PNG" alt=" ${detail.name}" style="padding-right: 55px; padding-left: 55px;">
<!-- 					</div> -->
<!-- 					</div> -->
						<br>
					<div class="row">
					<div class="col-5">
						<a href="/menu/add?id=${detail.id}&categoryId=${detail.categoryId}">
						<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/piu.png" alt="add" width="30"></button>
						</a>
					</div>
					<div class="col-2"  style="padding-top: 20px;">X</div>
					<div class="col-5">
						<a href="/menu/remove?id=${detail.id}&categoryId=${detail.categoryId}">
						<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/meno.png" alt="remove" width="30"></button>
						</a>
					</div>
					</div>
					</div>
				</p>		
			</c:forEach>	
		</div>
		<nav class="navbar fixed-bottom navbar-light bg-light">
			
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/Menu.png" alt="menu" width="30"></button>
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/contatti.png" alt="contatti" width="30"></button>
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/dove.png" alt="dove" width="30"></button>
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/crea.png" alt="crea" width="30"></button>
		</nav>
		</div>	
</body>
</html>