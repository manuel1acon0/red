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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
            crossorigin="anonymous"></script>
<title>Details</title>
</head>

<body id="body">
<div class="container-fluid">
<div class="row">
<nav class="navbar fixed-top navbar-light bg-light">

<!--   <a class="navbar-brand" href="#">Fixed top</a> -->
<!-- </nav> -->

		<div class="offset-2 col-8">
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
	<div style="margin-top: 100px;"></div>
	
		<div class="table">
			<c:forEach var="detail" items="${details}">
					
					<div class="img-thumbnail" style="margin-left: 150px;margin-right: 150px;margin-top: 20px;">
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
					<c:forEach var="order" items="${orders}">
                    <c:if test="${order.id == detail.id}">
                    <div class="col-2"  style="padding-top: 20px;">${order.quantity}</div>
                    <div class="col-5">
                        <a href="/menu/remove?id=${detail.id}&categoryId=${detail.categoryId}">
                        <button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/meno.png" alt="remove" width="30"></button>
                        </a>
                    </div>
                    </c:if>
                        </c:forEach>
<!-- 					<div class="col-2"  style="padding-top: 20px;">X</div> -->
<!-- 					<div class="col-5"> -->
<%-- 						<a href="/menu/remove?id=${detail.id}&categoryId=${detail.categoryId}"> --%>
<!-- 						<button type="button" class="btn btn-dark" style="padding-right: 60px;padding-left: 60px;padding-top: 10px;padding-bottom: 10px;"><img src="/red/pic/meno.png" alt="remove" width="30"></button> -->
<!-- 						</a> -->
<!-- 					</div> -->
					</div>
					</div>	
			</c:forEach>	
		</div>
		<div style="margin-top: 80px;"></div>
		<nav class="navbar fixed-bottom navbar-light bg-light">
			<div class="col-1">
				<a href="/menu/home"><button type="button" class="btn btn-dark" 
				style="padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 5px;height: 48px;width: 56px;margin-left: 5px;">
				<img src="/red/pic/Home.png" alt="Home" width="40">
				</button> 
<!-- 		<a href="/red"><button type="button" class="btn btn-dark" style="padding-right: 30px;padding-left: 30px;padding-top: 20px;padding-bottom: 20px; margin-top: 5px;"> Categorie </button>  -->
				</a>
			</div>
            <!-- Button trigger modal 1 -->
            <button type="button" data-bs-toggle="modal" data-bs-target="#menuModal"
            class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 5px;height: 48px;width: 56px;">
            <img src="/red/pic/Menu.png" alt="Menu" width="40">
            </button>
            
            <!-- Button trigger modal 4 -->
            <button type="button" data-bs-toggle="modal" data-bs-target="#cercaModal"
            class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 5px;height: 48px;width: 56px;">
            <img src="/red/pic/lente.PNG" alt="cerca" width="45">
            </button>
            
            <!-- Button trigger modal 2 -->
            <button type="button" data-bs-toggle="modal" data-bs-target="#infoModal"
            class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 5px;height: 48px;width: 56px;">
            <img src="/red/pic/Info.png" alt="Info" width="45">
            </button>
            
            <!-- Button trigger modal 3 -->
            <button type="button" data-bs-toggle="modal" data-bs-target="#condividiModal"
            class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-top: 3px;padding-bottom: 5px;height: 48px;width: 56px;">
            <img src="/red/pic/Condividi.png" alt="Condividi" width="45">
            </button>

		</nav>
		
            <!-- Modal 1 -->
            <div class="modal fade" id="menuModal" tabindex="-1" aria-labelledby="menuModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="menuModalLabel">Menu</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        	<div class="table" class="img-thumbnail">
								<c:forEach var="category" items="${categories}">
								<a href="/menu?id=${category.id}">
				
									<button class="btn btn-light" class="rounded">
										<div>
											<h4>${category.name}</h4>
										</div>
									</button>
								</a>
								<br>
								</c:forEach>

							</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Modal 2 -->
            <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="infoModalLabel">Info</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        <h5>Pizzeria</h5>
                        <h5>Telefono</h5>
                        <h5>Indirizzo</h5>
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <!-- Modal 3 -->
            <div class="modal fade" id="condividiModal" tabindex="-1" aria-labelledby="condividiModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="condividiModalLabel">Condividi</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        <h5>Whatsapp</h5>
                        <h5>Facebook</h5>
                        <h5>Instagram</h5>
                        </div>
                        
                    </div>
                </div>
            </div>
            
             <!-- Modal 4 -->
            <div class="modal fade" id="cercaModal" tabindex="-1" aria-labelledby="cercaModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cercaModalLabel">Cerca</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        <form action="/menu/search" >
						<input type="text" name="name" style="padding-top: 10px; padding-bottom: 10px; margin-left: 10px; margin-top: 5px;">
                        </form>
                        </div>
                        <div class="modal-footer">
                            <a href="/menu/search?name=${detail.name}">
								<button type="button" class="btn btn-dark" style="padding-right: 5px;padding-left: 5px;padding-bottom: 5px;margin-top: 5px;"><img src="/red/pic/lente.PNG" alt="cerca" width="60"></button>
     						</a>
                        </div>
                    </div>
                </div>
            </div>
</div>
</body>
</html>