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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
            crossorigin="anonymous"></script>
</head>

<body id="body">
	<div class="container-fluid">
	
	<div class="row">
	<nav class="navbar fixed-top navbar-light bg-light">
		<div class="col-3">
			<form action="/menu/search" >
			<input type="text" name="name" style="padding-top: 10px; padding-bottom: 10px; margin-left: 10px; margin-top: 5px;">
			<button type="button" class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-bottom: 5px;margin-top: 5px;"><img src="/red/pic/lente.PNG" alt="cerca" width="60"></button>
     		</form>
		</div>
		<div class="offset-1 col-5">
		<h1 class="img-thumbnail" align="center" style="margin-top: 5px;">MENU</h1>
		</div>
		<div class=" offset-1 col-2">
		<div class="container">
		<c:if test="${not empty count}">
			<a href="/menu/finish"><button type="button" class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 1px;padding-bottom: 5px; margin-top: 5px;" ><img src="/red/pic/Cart.PNG" alt="carrello" width="60"></button> 
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
		<p>	
		<div class="table" class="img-thumbnail">
			<c:forEach var="category" items="${categories}">
				<a href="/menu?id=${category.id}">
				
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
		<nav class="navbar fixed-bottom navbar-light bg-light">
			 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Open demo modal
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">...</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button type="button" class="btn btn-primary">
                                Save changes
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- 					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/Menu.png" alt="menu" width="30"></button> -->
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/contatti.png" alt="contatti" width="30"></button>
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/dove.png" alt="dove" width="30"></button>
					<button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 10px;padding-bottom: 10px;" data-toggle="modal" data-target="#Modal1"><img src="/red/pic/crea.png" alt="crea" width="30"></button>
		</nav>
	</div>
</body>
</html>