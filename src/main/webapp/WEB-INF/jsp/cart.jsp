<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
 <div class="row">
   		<div class="col-3" style="padding-top: 62px;">
<%-- 			<h2 id="title" style="padding-left: 15px;">${details.name}</h2> --%>
		</div>
	</div>
<table class="table table-striped table-hover table-light" >
		<thead>
		<tr id="first-row" class="table">
			<td scope="row" style="padding-left: 20px;">Nome</td>
			<td scope="row" style="padding-left: 20px;">Descrizione</td>
			<td scope="row" style="padding-left: 20px;">Prezzi</td>
		</tr>
		</thead>
		
		<c:forEach var="detail" items="${details}">
			<tr>
				<td style="padding-left:20px;" >${detail.name}</td>
				<td style="padding-left:20px;" >${detail.description}</td>
				<td style="padding-left:20px;" >${detail.price}</td>
				<td style="padding-left:20px;" >
				<br>
<%-- 				<a href="/menu?id=${category.id}" > --%>
				<button> 
					<img src="/red/pic/${detail.name}.PNG" alt=" ${detail.name}" width="200px" >
				</button>
<!-- 				</a> -->
				</td>
				
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>